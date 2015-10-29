/etc/init.d/mysql.server stop
mv /usr/local/mysql/data/* /db/
rm -rf /usr/local/mysql/data
ln -s /db /usr/local/mysql/data
chown -R mysql.mysql /db
chmod -R g+w /db
/etc/init.d/mysql.server start

echo "You will now need to reload vagrant again."
