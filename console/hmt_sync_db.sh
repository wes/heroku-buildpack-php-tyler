echo 'Dropping Local Database'
mysqladmin -u root -proot drop holdmyticket

echo 'Creating tmp folder in vagrant folder to save space.'
mkdir /vagrant/.tmp/

echo 'Dumping Live Read Replica DB To File'
scp root@162.243.16.64:/home/latest.sql.gz /vagrant/.tmp/holdmyticket.sql.gz

echo 'Unzipping Archive'
gunzip /vagrant/.tmp/holdmyticket.sql.gz

echo 'Creating Local Database'
mysqladmin -u root -proot create holdmyticket

echo 'Importing Database'
mysql -u root -proot holdmyticket < /vagrant/.tmp/holdmyticket.sql

echo 'Cleaning up'
rm -rf /vagrant/.tmp/

echo 'All Done'
