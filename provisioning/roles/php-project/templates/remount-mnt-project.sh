#!/bin/sh

# remount /mnt/project for changing gid
mount | grep -q /mnt/project
if [ $? -eq "0" ]; then
  umount /mnt/project && mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group apache | cut -d: -f3`,dmode=775,fmode=775 mnt_project /mnt/project
fi
