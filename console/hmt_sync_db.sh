echo 'Dropping Local Database'
mysqladmin -u root -proot drop holdmyticket

echo 'Creating tmp folder in vagrant folder to save space.'
mkdir /vagrant/.tmp/

echo 'Dumping Live Read Replica DB To File'
mysqldump -h hmtread.ctycy1cg9bsq.us-east-1.rds.amazonaws.com -P 3306 -u holdmyticket -p holdmyticket > /vagrant/.tmp/holdmyticket.sql

echo 'Creating Local Database'
mysqladmin -u root -proot create holdmyticket

echo 'Importing Database'
mysql -u root -proot holdmyticket < /vagrant/.tmp/holdmyticket.sql

echo 'Cleaning up'
rm -rf /vagrant/.tmp/

echo 'All Done'
