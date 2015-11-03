/etc/init.d/mysql stop
fdisk /dev/sdb
mkfs.ext4 /dev/sdb1
mkdir /db
echo "/dev/sdb1      /db      ext4      errors=remount-ro      0    1" >> /etc/fstab
echo "You should now exit and reload vagrant."
