#!/bin/bash

# Fix for :
# Starting MySQL database server: mysqld . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . failed!
# at container startup
find /var/lib/mysql/mysql -exec touch -c -a {} +

echo '[+] Starting mysql...'
service mysql start

echo '[+] Starting apache'
service apache2 start

while true
do
    tail -f /var/log/apache2/*.log
    exit 0
done
