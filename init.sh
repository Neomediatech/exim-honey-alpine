#!/bin/sh

touch /var/log/exim/mainlog /var/log/exim/rejectlog /var/log/exim/paniclog; chown exim:exim /var/log/exim/mainlog /var/log/exim/rejectlog /var/log/exim/paniclog

mkdir -p /data/mail && chmod 777 /data/mail

exim -bd
tail -f /var/log/exim/mainlog 
