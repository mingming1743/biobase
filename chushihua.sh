#!/usr/bin/env bash
#author:sunyongguang
systemctl disable firewalld && systemctl stop firewalld
sed -i s/SELINUX=enforcing/SELINUX=DISABLED/g /etc/selinux/config
setenforce 0
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

synctime() {
    timedatectl set-timezone Asia/Shanghai
    ntpdate -b ntp1.aliyun.com
}

if [ -f /usr/bin/ntpdate ];then
  synctime
  ntpdate -b ntp1.aliyun.com
else
    yum -y install ntpdate
    ntpdate -b ntp1.aliyun.com
fi

yum -y install vim wget net-tools lsof
