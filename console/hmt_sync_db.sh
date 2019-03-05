
echo 'Creating tmp folder in vagrant folder to save space.'
mkdir -p /vagrant/.tmp/

echo -n "Do you want to do a full sync, or partial (much faster) sync? Partial is default (full/partial)? "
read size

echo -n "Sync from remote or local servers? Local is default (remote/local)? "
read answer
if echo "$answer" | grep -iq "^remote" ;then
  echo 'Downloading Remote Database Dump'
  if echo "$size" | grep -iq "^full" ;then
    scp root@142.93.253.210:/home/latest.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  else
    scp root@142.93.253.210:/home/latest_small.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  fi
else
  echo 'Downloading Local Database Dump'
  if echo "$size" | grep -iq "^full" ;then
    scp administrator@wesG5:/Users/administrator/Desktop/latest.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  else
    scp administrator@wesG5:/Users/administrator/Desktop/latest_small.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  fi
fi

echo 'Dropping Local Database'
yes | mysqladmin -u root -proot drop holdmyticket

echo 'Unzipping Archive'
gunzip /vagrant/.tmp/holdmyticket.sql.gz

echo 'Creating Local Database'
mysqladmin -u root -proot create holdmyticket

if ! mysql -u root -proot -e 'use holdmyticket_test';then
  echo 'Creating Test Database'
  mysqladmin -u root -proot create holdmyticket_test 
fi

echo 'Restarting MySQL'
/etc/init.d/mysql.server restart

echo 'Importing Database'
pv /vagrant/.tmp/holdmyticket.sql | mysql -u root -proot holdmyticket

echo 'Restarting MySQL'
/etc/init.d/mysql.server restart

echo 'Cleaning up'
rm -rf /vagrant/.tmp/

echo 'All Done'
