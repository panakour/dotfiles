function mysql-import-db -d "Import a SQL file into a MySQL database"
    set file "$argv[1]"
    set dbName "$argv[2]"

    if test -z "$file"
        printf "give a file.\n"
        return 1
    end

    if not test -f "$file"
        printf "file: %s not found.\n" $file
        return 1
    end

    if test -z "$dbName"
        printf "give a name for the db.\n"
        return 1
    end

    mysql-create-db "$dbName"

    echo "Importing database from $file to $dbName..."

    docker exec -i (mysql-container-id) mariadb -uroot -proot -f $dbName < $file

    if test $status -eq 0
        echo "Database $dbName imported successfully."
        return 0
    else
        echo "Failed to import database $dbName."
        return 1
    end
end
