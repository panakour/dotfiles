function mysql-export-db -d "Export a MySQL database to a SQL file"
    if test -z "$argv[1]"
        printf "give a name for the db.\n"
        return 1
    end

    set db_name $argv[1]
    echo "Exporting database $db_name to $db_name.sql..."

    docker exec (mysql-container-id) mariadb-dump -uroot -proot $db_name > $db_name.sql

    if test $status -eq 0
        echo "Database $db_name exported successfully to $db_name.sql."
        return 0
    else
        echo "Failed to export database $db_name."
        return 1
    end
end
