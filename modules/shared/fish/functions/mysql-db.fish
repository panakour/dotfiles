function mysql-db -d "MySQL/MariaDB database operations: create, drop, export, import, list, connect"
    set -l MYSQL_USER root
    set -l MYSQL_PASSWORD root
    set -l MYSQL_DB mysql

    function _mysql_container_id
        docker ps -q --filter "name=mariadb" --filter "name=mysql" | head -n1
    end

    function _check_container
        set container_id (_mysql_container_id)
        if test -z "$container_id"
            echo "Error: No MySQL/MariaDB container found. Make sure a MySQL or MariaDB container is running."
            return 1
        end
        echo $container_id
    end

    function _show_usage
        echo "Usage: mysql-db <command> [options]"
        echo ""
        echo "Commands:"
        echo "  create <db_name>           - Create a new database"
        echo "  drop <db_name>             - Drop a database"
        echo "  export <db_name> [file]    - Export database to SQL file (default: <db_name>.sql)"
        echo "  import <file> <db_name>    - Import SQL file to database"
        echo "  list                       - List all databases"
        echo "  connect [db_name]          - Connect to database (default: mysql)"
        echo "  exec <sql_command>         - Execute SQL command"
        echo ""
        echo "Examples:"
        echo "  mysql-db create myapp"
        echo "  mysql-db drop myapp"
        echo "  mysql-db export myapp"
        echo "  mysql-db import backup.sql myapp"
        echo "  mysql-db list"
        echo "  mysql-db connect myapp"
        echo "  mysql-db exec 'SELECT VERSION();'"
    end

    if test (count $argv) -eq 0
        _show_usage
        return 1
    end

    set command $argv[1]

    switch $command
        case create
            if test (count $argv) -lt 2
                echo "Error: Database name required for create command"
                _show_usage
                return 1
            end

            set db_name $argv[2]
            set container_id (_check_container)
            or return 1

            echo "Creating database '$db_name'..."
            docker exec $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE SCHEMA IF NOT EXISTS $db_name DEFAULT CHARACTER SET utf8mb4 COLLATE = utf8mb4_unicode_ci"

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
            set container_id (_check_container)
            or return 1

            echo "Dropping database '$db_name'..."
            docker exec $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -e "DROP DATABASE IF EXISTS $db_name"

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
                set output_file "$db_name.sql"
            end

            set container_id (_check_container)
            or return 1

            echo "Exporting database '$db_name' to '$output_file'..."
            docker exec $container_id mariadb-dump -u$MYSQL_USER -p$MYSQL_PASSWORD $db_name >$output_file

            if test $status -eq 0
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

            set container_id (_check_container)
            or return 1

            # Create database if it doesn't exist
            echo "Creating database '$db_name' if it doesn't exist..."
            docker exec $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE SCHEMA IF NOT EXISTS $db_name DEFAULT CHARACTER SET utf8mb4 COLLATE = utf8mb4_unicode_ci" 2>/dev/null

            echo "Importing '$sql_file' into database '$db_name'..."
            docker exec -i $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -f $db_name <$sql_file

            if test $status -eq 0
                echo "Database '$db_name' imported successfully from '$sql_file'."
                return 0
            else
                echo "Failed to import database '$db_name'."
                return 1
            end

        case list
            set container_id (_check_container)
            or return 1

            echo "Listing all databases..."
            docker exec $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;"

        case connect
            set db_name $argv[2]

            if test -z "$db_name"
                set db_name $MYSQL_DB
            end

            set container_id (_check_container)
            or return 1

            echo "Connecting to database '$db_name'..."
            docker exec -it $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD $db_name

        case exec
            if test (count $argv) -lt 2
                echo "Error: SQL command required for exec command"
                _show_usage
                return 1
            end

            set sql_command $argv[2]
            set container_id (_check_container)
            or return 1

            echo "Executing SQL command..."
            docker exec $container_id mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -e "$sql_command"

        case '*'
            echo "Error: Unknown command '$command'"
            _show_usage
            return 1
    end
end
