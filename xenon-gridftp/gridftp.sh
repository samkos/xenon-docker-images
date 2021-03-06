#!/bin/sh

if [ -f /etc/ca-files/hosts/$(hostname -f)/hostcert.pem ] ; then
    chmod 600 /etc/ca-files/hosts/$(hostname -f)/hostkey.pem
    ln -f -s /etc/ca-files/hosts/$(hostname -f)/hostcert.pem /etc/grid-security
    ln -f -s /etc/ca-files/hosts/$(hostname -f)/hostkey.pem /etc/grid-security
else
    logger -s "No certificates found for host, starting grid ftp server without"
fi

/usr/sbin/globus-gridftp-server -d ALL -L /var/log/ -no-detach -c /etc/gridftp.conf -banner "Welcome to Xenon test gridftp server"
