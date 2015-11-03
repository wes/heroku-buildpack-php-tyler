/etc/init.d/mysql stop
mv /var/lib/mysql/* /db/
sed -i "s,datadir.*=.*,datadir=/db,g" /etc/mysql/my.cnf
sed -e '/bind-address/ s/^#*/#/' -i /etc/mysql/my.cnf
chown -R mysql.mysql /db
/etc/init.d/mysql start

echo "You will now need to reload vagrant again."
