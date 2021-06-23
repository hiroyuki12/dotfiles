docker image build -t rabbitmq-scd .
docker container create -p 5672:5672 -p 15672:15672 --name rabbitmq-scd rabbitmq-scd
docker container start rabbitmq-scd

echo 'sh installpika.sh'
