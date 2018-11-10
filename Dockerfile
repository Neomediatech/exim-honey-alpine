FROM alpine

LABEL maintainer="docker-dario@neomediatech.it"

RUN apk update; apk upgrade ; apk add --no-cache tzdata; cp /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN apk add --no-cache tini exim exim-cdb exim-dbmdb exim-dnsdb exim-postgresql exim-scripts exim-sqlite exim-utils redis
RUN rm -rf /usr/local/share/doc /usr/local/share/man
RUN touch /var/log/exim/mainlog /var/log/exim/rejectlog /var/log/exim/paniclog; chown exim:exim /var/log/exim/mainlog /var/log/exim/rejectlog /var/log/exim/paniclog

COPY init.sh /
RUN chmod +x /init.sh
COPY conf/* /etc/exim/

EXPOSE 25 465 587

ENTRYPOINT ["tini", "--", "/init.sh"]