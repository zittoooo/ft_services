FROM alpine:3.12.0

RUN apk update \
	&& apk --update --no-cache add \
	nginx \
	openssl

COPY ./nginx.sh /usr/sbin/nginx.sh
RUN chmod +x /usr/sbin/nginx.sh
COPY ./default.conf /etc/nginx/conf.d/

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/nginx.sh"]
