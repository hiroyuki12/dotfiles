docker-compose up -d --build
docker-compose ps
docker-compose run --rm consumer python consumer.py

echo 'oepn safari http://localhost:8000/docs'
echo 'oepn safari http://localhost:15672'
