docker-compose build
docker-compose images
docker-compose up -d
docker-compose ps

docker-compose exec app go run main.go

echo 'ls'
echo 'go run main.go'
docker-compose exec app /bin/bash
