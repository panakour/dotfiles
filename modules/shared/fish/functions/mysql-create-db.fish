function mysql-create-db -d "Create a MySQL database"
    if test -z "$argv[1]"
        printf "give a name for the db.\n"
        return 1
    end

    set db_name $argv[1]
    echo "Creating database $db_name..."

    docker exec (mysql-container-id) mariadb -uroot -proot -e "CREATE SCHEMA IF NOT EXISTS $db_name DEFAULT CHARACTER SET utf8mb4 COLLATE = utf8mb4_unicode_ci"

    if test $status -eq 0
        echo "Database $db_name created successfully."
        return 0
    else
        echo "Failed to create database $db_name."
        return 1
    end
end
