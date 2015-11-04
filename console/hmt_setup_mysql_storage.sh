/etc/init.d/mysql.server stop
mv /usr/local/mysql/data/* /db/
#sed -i "s,datadir.*=.*,datadir=/db,g" /etc/mysql/my.cnf
#sed -i "s,bind-address.*=.*,bind-address=10.0.0.2,g" /etc/mysql/my.cnf
chown -R mysql.mysql /db
/etc/init.d/mysql.server start

echo "You will now need to reload vagrant again."
