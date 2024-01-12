#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

lock_file=/tmp/rep_libpam.lock
if [ -f $lock_file ];then
    echo "file: $lock_file is exist!";
    exit 1;
fi

touch $lock_file

rpm_bin=$(which rpm)
if [ ! -f $rpm_bin ];then
    exit 0;
fi

yum_bin=$(which yum)
if [ ! -f $yum_bin ];then
    exit 0;
fi

is_rep=$($rpm_bin -V pam|grep libpam.so|grep -v grep|grep -E "(S.5|SM5)")
if [ "$is_rep" = "" ];then
    exit 0;
fi

yum -y reinstall pam

systemctl restart sshd.service
systemctl restart crond.service
/etc/init.d/nginx reload

rm -f $lock_file
