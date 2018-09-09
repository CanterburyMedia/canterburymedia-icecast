FROM alpine:latest
LABEL maintainer="Chris Roberts <chris@naxxfish.net>"

RUN addgroup -S icecast && adduser -S icecast
RUN apk --no-cache add icecast && rm -rf /var/cache/apk/*
ADD ./webroot /usr/share/icecast/web
ADD ./admin /usr/share/icecast/admin
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000/tcp
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/entrypoint.sh"]
CMD icecast -c /etc/icecast.xml
