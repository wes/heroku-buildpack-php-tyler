/etc/init.d/mysql.server stop
fdisk /dev/sdb
mkfs.ext4 /dev/sdb1
mkdir /db
echo "/dev/sdb1      /db      ext4      errors=remount-ro      0    1" >> /etc/fstab
mv /usr/local/mysql/data/* /db/
rm -rf /usr/local/mysql/data
ln -s /db /usr/local/mysql/data
chown -R mysql.mysql /db
chmod -R g+w /db
/etc/init.d/mysql.server start
