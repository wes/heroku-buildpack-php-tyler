echo 'Dropping Local Database'
mysqladmin -u root -proot drop holdmyticket

echo 'Creating tmp folder in vagrant folder to save space.'
mkdir /vagrant/.tmp/

echo -n "Do you want to do a full sync, or partial (much faster) sync? Partial is default (full/partial)? "
read size

echo -n "Sync from remote or local servers? Local is default (remote/local)? "
read answer
if echo "$answer" | grep -iq "^remote" ;then
  echo 'Downloading Remote Database Dump'
  if echo "$size" | grep -iq "^full" ;then
    scp root@162.243.16.64:/home/latest.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  else
    scp root@162.243.16.64:/home/latest_small.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  fi
else
  echo 'Downloading Local Database Dump'
  if echo "$size" | grep -iq "^full" ;then
    scp administrator@wesG5:/Users/administrator/Desktop/latest.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  else
    scp administrator@wesG5:/Users/administrator/Desktop/latest_small.sql.gz /vagrant/.tmp/holdmyticket.sql.gz
  fi
fi

echo 'Unzipping Archive'
gunzip /vagrant/.tmp/holdmyticket.sql.gz

echo 'Creating Local Database'
mysqladmin -u root -proot create holdmyticket

echo 'Importing Database'
mysql -u root -proot holdmyticket < /vagrant/.tmp/holdmyticket.sql

echo 'Cleaning up'
rm -rf /vagrant/.tmp/

echo 'All Done'