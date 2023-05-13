#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default IP
sed -i 's/192.168.1.1/172.16.1.1/g' package/base-files/files/bin/config_generate
# 修改机器名称
sed -i 's/OpenWrt/CM520-79F-Home/g' package/base-files/files/bin/config_generate
# 修改机器初始密码
#sed -i 's/root::0:0:99999:7:::/root::0:0:99999:7:::/g' package/base-files/files/etc/shadow
# DNS Cache FixUP
# echo -e "#max-ttl=600\nneg-ttl=600\nmin-cache-ttl=3600" >> package/network/services/dnsmasq/files/dnsmasq.conf
# 修改连接数
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

####### Modify the version number
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt $('%V')'" >> package/base-files/files/etc/openwrt_release
sed -i "s/OpenWrt /\洲\·\C\y \build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/base-files/files/etc/openwrt_release

# Insert command to delete password
sed -i '2a\echo \"root\:123450\" | chpasswd' package/base-files/files/etc/rc.local
