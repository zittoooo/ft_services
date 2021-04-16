FROM alpine:3.12.0

RUN apk update \
    && apk --repository=https://mirrors.ustc.edu.cn/alpine/latest-stable/community/ --update --no-cache add \
    mysql mysql-client

COPY ./mysql.sh /usr/sbin/mysql.sh
RUN chmod +x /usr/sbin/mysql.sh
COPY my.cnf /etc/my.cnf
RUN chmod 644 /etc/my.cnf

EXPOSE 3306

ENTRYPOINT ["/usr/sbin/mysql.sh"]