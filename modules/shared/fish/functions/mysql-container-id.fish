function mysql-container-id -d "Get the ID of the MySQL/MariaDB container"
    docker ps -q --filter "name=mariadb" --filter "name=mysql" | head -n1
end
