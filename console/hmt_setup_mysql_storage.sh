mv /usr/local/mysql/data/* /db/
rm -rf /usr/local/mysql/data
ln -s /db /usr/local/mysql/data
chown -R mysql.mysql /db
chmod -R g+w /db
/etc/init.d/mysql.server start

mysql -u root -proot -h localhost mysql < "update user SET Host = '10.0.0.1' WHERE Host = '127.0.0.1';"

mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p mysql

echo "You will now need to reload vagrant again."
