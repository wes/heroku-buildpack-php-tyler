/etc/init.d/mysql stop
mv /var/lib/mysql/* /db/
#rm -rf /var/lib/mysql/data
#ln -s /db /var/lib/mysql/data
#chown -R mysql.mysql /db
#chmod -R g+w /db
sed -i "s,datadir.*=.*,datadir=/db,g" /etc/mysql/my.cnf
/etc/init.d/mysql start

echo "You will now need to reload vagrant again."
