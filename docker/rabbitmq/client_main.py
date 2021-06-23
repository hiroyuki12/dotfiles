import pika
import datetime

pika_param = pika.ConnectionParameters('localhost')
connection = pika.BlockingConnection(pika_param)
channel = connection.channel()

channel.queue_declare(queue='hello')

print('Send Message 1 Start. {}'.format(datetime.datetime.now()))
channel.basic_publish(exchange='',
                      routing_key='hello',
                      body='Hello World 1')
print('Send Message 1 End. {}'.format(datetime.datetime.now()))

print('Send Message 2 Start. {}'.format(datetime.datetime.now()))
channel.basic_publish(exchange='',
                      routing_key='hello',
                      body='Hello World 2')
print('Send Message 2 End. {}'.format(datetime.datetime.now()))
