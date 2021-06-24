
# buildコマンド実行場所を docker build のカレントディレクトリにできる
docker build -f ./docker/nginx/Dockerfile -t image-name:nginx-1.17.3-alpine .

docker-compose up -d --remove-orphans

echo 'open safari http://localhost'
