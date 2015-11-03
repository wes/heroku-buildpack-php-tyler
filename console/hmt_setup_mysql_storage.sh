/etc/init.d/mysql stop
mv /var/lib/mysql/* /db/
rm -rf /var/lib/mysql/data
ln -s /db /var/lib/mysql/data
chown -R mysql.mysql /db
chmod -R g+w /db
/etc/init.d/mysql.server start

echo "You will now need to reload vagrant again."
