#!/bin/sh

DB_USER=${DB_USER:-admin}
DB_PASS=${DB_PASS:-admin123}

/usr/bin/mysqld_safe > /dev/null 2>&1 &

mysqladmin --silent --wait=30 ping

mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES"
mysql -uroot -e "CREATE SCHEMA '$DB_USER'"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this MariaDB Server using:"
echo ""
echo "    mysql -uadmin -padmin123 -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MariaDB user 'root' has no password but only allows local connections"
echo "========================================================================"

mysqladmin -uroot shutdown