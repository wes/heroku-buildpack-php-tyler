echo 'Dropping Local Database'
mysqladmin -u root -proot drop holdmyticket

echo 'Dumping Live Read Replica DB To File'
mysqldump -h holdmyticket.ctycy1cg9bsq.us-east-1.rds.amazonaws.com -P 3306 -u holdmyticket -p holdmyticket > /tmp/holdmyticket.sql

echo 'Creating Local Database'
mysqladmin -u root -proot create holdmyticket

echo 'Importing Database'
mysql -u root -proot holdmyticket < /tmp/holdmyticket.sql

echo 'Cleaning up'
rm /tmp/holdmyticket.sql

echo 'All Done'
