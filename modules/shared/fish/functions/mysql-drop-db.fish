function mysql-drop-db -d "Drop a MySQL database"
    if test -z "$argv[1]"
        printf "give a name for the db.\n"
        return 1
    end

    set db_name $argv[1]
    echo "Dropping database $db_name..."

    docker exec (mysql-container-id) mariadb -uroot -proot -e "DROP DATABASE $db_name"

    if test $status -eq 0
        echo "Database $db_name dropped successfully."
        return 0
    else
        echo "Failed to drop database $db_name."
        return 1
    end
end
