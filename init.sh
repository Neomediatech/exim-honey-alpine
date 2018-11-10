#!/bin/sh

touch /var/log/exim/mainlog /var/log/exim/rejectlog /var/log/exim/paniclog; chown exim:exim /var/log/exim/mainlog /var/log/exim/rejectlog /var/log/exim/paniclog

exim -bd
tail -f /var/log/exim/mainlog 

