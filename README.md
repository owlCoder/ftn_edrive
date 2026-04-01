<!-- TODO: ADD README FOR BACKEND -->

<!-- SQL docker latest version -->

docker run --name mysql-celestia -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=celestia_codex -p 3306:3306 -v mysql-data:/var/lib/mysql -d mysql:latest