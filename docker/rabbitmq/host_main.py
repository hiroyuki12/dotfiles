import datetime
import pika

pika_param = pika.ConnectionParameters(host='localhost', channel_max=2)
connection = pika.BlockingConnection(pika_param)
channel = connection.channel()

channel.queue_declare(queue='hello')

def callback(ch, method, properties, body):
    print("{} Received. {}".format(body, datetime.datetime.now()))
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_consume(
    queue='hello', on_message_callback=callback)

channel.start_consuming()
