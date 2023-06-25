#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Modify default IP
#sed -i 's/192.168.1.1/4.1.1.1/g' package/base-files/files/bin/config_generate
# 修改机器名称
#sed -i 's/OpenWrt/CM520-79F/g' package/base-files/files/bin/config_generate
# 修改机器初始密码
#sed -i 's/root::0:0:99999:7:::/root::0:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
#sed -i '$a src-git dockerman https://github.com/lisaac/luci-app-dockerman' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
#git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
#git clone https://github.com/kenzok8/small.git package/small
#git clone https://github.com/kiddin9/openwrt-packages.git package/kiddin9
#git clone https://github.com/NueXini/NueXini_Packages.git package/NueXini
#sed -i '$a src-git NueXiniPackages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default
# sed -i '$a src-git dnsfilter https://github.com/kiddin9/luci-app-dnsfilter' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
git clone https://github.com/kenzok8/openwrt-packages feeds/kenzo
git clone https://github.com/kenzok8/small feeds/small
#git clone https://github.com/kenzok8/small-package feeds/small-package
#git clone https://github.com/bootli/luci-app-turboacc.git package/small-package/luci-app-turboacc
#git clone https://github.com/deplives/luci-app-turboacc.git package/small-package/luci-app-turboacc
#git clone https://github.com/imapproxy/luci-app-turboacc.git package/small-package/luci-app-turboacc
## Turbo ACC
##svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-turboacc package/small-package/luci-app-turboacc
##svn export --force https://github.com/kiddin9/openwrt-packages/trunk/shortcut-fe package/small-package/luci-app-turboacc/shortcut-fe
#
####################################
### Turbo ACC-[openwrt(22.03/23.05)]
####################################
mkdir -p turboacc_tmp ./package/turboacc
cd turboacc_tmp 
git clone https://github.com/chenmozhijin/turboacc -b package
cd ../package/turboacc
git clone https://github.com/fullcone-nat-nftables/nft-fullcone
git clone https://github.com/chenmozhijin/turboacc
mv ./turboacc/luci-app-turboacc ./luci-app-turboacc
rm -rf ./turboacc
cd ../..
cp turboacc_tmp/turboacc/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch ./target/linux/generic/hack-5.15
cp turboacc_tmp/turboacc/hack-5.15/953-net-patch-linux-kernel-to-support-shortcut-fe.patch ./target/linux/generic/hack-5.15
rm -rf ./package/libs/libnftnl ./package/network/config/firewall4 ./package/network/utils/nftables
mkdir -p ./package/network/config/firewall4 ./package/libs/libnftnl ./package/network/utils/nftables
cp -r ./turboacc_tmp/turboacc/shortcut-fe ./package/turboacc
cp -RT ./turboacc_tmp/turboacc/firewall4-04a06bd70b9808b14444cae81a2faba4708ee231/firewall4 ./package/network/config/firewall4
cp -RT ./turboacc_tmp/turboacc/libnftnl-1.2.5/libnftnl ./package/libs/libnftnl
cp -RT ./turboacc_tmp/turboacc/nftables-1.0.7/nftables ./package/network/utils/nftables
rm -rf turboacc_tmp
####################################
### Turbo ACC of End
####################################
svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-rclone feeds/luci/applications/luci-app-rclone
# git clone https://github.com/bootli/luci-app-ddns-go.git package/ddns-go
#git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
#git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
#Add The Theme：luci-theme-opentomcat
#git clone https://github.com/Cosme927/luci-theme-opentomcat package/luci-theme-opentomcat
# zerotier
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.8.5/g' feeds/packages/net/zerotier/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=2866a4ef9193cca0a9f0fe528a0dea00c13cb0fd714bf388a0300cb6f3639b3b/g' feeds/packages/net/zerotier/Makefile
#rm -rf feeds/packages/net/zerotier
#cp -rf $GITHUB_WORKSPACE/general/zerotier feeds/packages/net
