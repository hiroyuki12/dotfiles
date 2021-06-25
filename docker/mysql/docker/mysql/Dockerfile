FROM mysql:8.0.23
RUN apt-get update && \
    apt-get install -y tzdata locales && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8

CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
