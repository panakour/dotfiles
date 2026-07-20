function postgres-db -d "PostgreSQL database operations: create, drop, export, import, list, connect"
    set -l POSTGRES_USER postgres
    set -l POSTGRES_DB postgres
    set -l requested_container

    function _postgres_container_id
        docker ps -q --filter "name=postgres" --filter "name=postgresql" | head -n1
    end

    function _check_container
        if test -n "$argv[1]"
            set container_id (docker inspect --format '{{if .State.Running}}{{.Id}}{{end}}' "$argv[1]" 2>/dev/null)
        else
            set container_id (_postgres_container_id)
        end

        if test -z "$container_id"
            if test -n "$argv[1]"
                echo "Error: PostgreSQL container '$argv[1]' was not found or is not running." >&2
            else
                echo "Error: No PostgreSQL container found. Make sure a PostgreSQL container is running." >&2
            end
            return 1
        end
        echo $container_id
    end

    function _show_usage
        echo "Usage: postgres-db [--container <name-or-id>] <command> [options]"
        echo ""
        echo "Options:"
        echo "  -c, --container <name-or-id> - Use a specific PostgreSQL container"
        echo ""
        echo "Commands:"
        echo "  create <db_name>           - Create a new database"
        echo "  drop <db_name>             - Drop a database"
        echo "  export <db_name> [file]    - Export database to gzipped SQL (default: <db_name>.sql.gz)"
        echo "  import <file> <db_name>    - Import SQL (supports .sql and .sql.gz)"
        echo "  list                       - List all databases"
        echo "  connect [db_name]          - Connect to database (default: postgres)"
        echo "  exec <sql_command>         - Execute SQL command"
        echo ""
        echo "Examples:"
        echo "  postgres-db create myapp"
        echo "  postgres-db drop myapp"
        echo "  postgres-db export myapp"
        echo "  postgres-db --container pk-postgres-1 export myapp"
        echo "  postgres-db import backup.sql myapp"
        echo "  postgres-db list"
        echo "  postgres-db connect myapp"
        echo "  postgres-db exec 'SELECT version();'"
    end

    if contains -- $argv[1] -c --container
        if test (count $argv) -lt 2
            echo "Error: Container name or ID required after '$argv[1]'"
            _show_usage
            return 1
        end

        set requested_container $argv[2]
        set argv $argv[3..-1]
    end

    if test (count $argv) -eq 0
        _show_usage
        return 1
    end

    set command $argv[1]

    if not contains -- $command create drop export import list connect exec
        echo "Error: Unknown command '$command'"
        _show_usage
        return 1
    end

    set container_id (_check_container "$requested_container")
    or return 1

    set -l configured_user (docker exec $container_id printenv POSTGRES_USER 2>/dev/null)
    if test -n "$configured_user"
        set POSTGRES_USER $configured_user
    end

    set -l configured_db (docker exec $container_id printenv POSTGRES_DB 2>/dev/null)
    if test -n "$configured_db"
        set POSTGRES_DB $configured_db
    else
        set POSTGRES_DB $POSTGRES_USER
    end

    switch $command
        case create
            if test (count $argv) -lt 2
                echo "Error: Database name required for create command"
                _show_usage
                return 1
            end

            set db_name $argv[2]
            echo "Creating database '$db_name'..."
            docker exec $container_id psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE DATABASE \"$db_name\";"

            if test $status -eq 0
                echo "Database '$db_name' created successfully."
                return 0
            else
                echo "Failed to create database '$db_name'."
                return 1
            end

        case drop
            if test (count $argv) -lt 2
                echo "Error: Database name required for drop command"
                _show_usage
                return 1
            end

            set db_name $argv[2]
            echo "Dropping database '$db_name'..."
            docker exec $container_id psql -U $POSTGRES_USER -d $POSTGRES_DB -c "DROP DATABASE IF EXISTS \"$db_name\";"

            if test $status -eq 0
                echo "Database '$db_name' dropped successfully."
                return 0
            else
                echo "Failed to drop database '$db_name'."
                return 1
            end

        case export
            if test (count $argv) -lt 2
                echo "Error: Database name required for export command"
                _show_usage
                return 1
            end

            set db_name $argv[2]
            set output_file $argv[3]

            if test -z "$output_file"
                set output_file "$db_name.sql.gz"
            end

            echo "Exporting database '$db_name' to '$output_file'..."
            docker exec $container_id pg_dump -U $POSTGRES_USER -d $db_name --clean --if-exists | gzip -c >$output_file
            set dump_status $pipestatus[1]
            set gzip_status $pipestatus[2]

            if test $dump_status -eq 0 -a $gzip_status -eq 0
                echo "Database '$db_name' exported successfully to '$output_file'."
                return 0
            else
                echo "Failed to export database '$db_name'."
                return 1
            end

        case import
            if test (count $argv) -lt 3
                echo "Error: Both SQL file and database name required for import command"
                _show_usage
                return 1
            end

            set sql_file $argv[2]
            set db_name $argv[3]

            if not test -f "$sql_file"
                echo "Error: File '$sql_file' not found."
                return 1
            end

            # Create database if it doesn't exist
            echo "Creating database '$db_name' if it doesn't exist..."
            docker exec $container_id psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE DATABASE \"$db_name\";" 2>/dev/null

            echo "Importing '$sql_file' into database '$db_name'..."

            if string match -r '.*\\.gz$' -- $sql_file
                gunzip -c $sql_file | docker exec -i $container_id psql -U $POSTGRES_USER -d $db_name
                set unzip_status $pipestatus[1]
                set psql_status $pipestatus[2]
            else
                cat $sql_file | docker exec -i $container_id psql -U $POSTGRES_USER -d $db_name
                set unzip_status 0
                set psql_status $pipestatus[2]
            end

            if test $unzip_status -eq 0 -a $psql_status -eq 0
                echo "Database '$db_name' imported successfully from '$sql_file'."
                return 0
            else
                echo "Failed to import database '$db_name'."
                return 1
            end

        case list
            echo "Listing all databases..."
            docker exec $container_id psql -U $POSTGRES_USER -d $POSTGRES_DB -c "\l"

        case connect
            set db_name $argv[2]

            if test -z "$db_name"
                set db_name $POSTGRES_DB
            end

            echo "Connecting to database '$db_name'..."
            docker exec -it $container_id psql -U $POSTGRES_USER -d $db_name

        case exec
            if test (count $argv) -lt 2
                echo "Error: SQL command required for exec command"
                _show_usage
                return 1
            end

            set sql_command $argv[2]
            echo "Executing SQL command..."
            docker exec $container_id psql -U $POSTGRES_USER -d $POSTGRES_DB -c "$sql_command"

        case '*'
            echo "Error: Unknown command '$command'"
            _show_usage
            return 1
    end
end
