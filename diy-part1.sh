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
#sed -i '$a src-git NueXiniPackages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default
#git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
#git clone https://github.com/kenzok8/small.git package/small
# sed -i '$a src-git dnsfilter https://github.com/kiddin9/luci-app-dnsfilter' feeds.conf.default
git clone https://github.com/kenzok8/small-package package/small-package
#git clone https://github.com/bootli/luci-app-turboacc.git package/small-package/luci-app-turboacc
#git clone https://github.com/deplives/luci-app-turboacc.git package/small-package/luci-app-turboacc
#git clone https://github.com/imapproxy/luci-app-turboacc.git package/small-package/luci-app-turboacc

## Turbo ACC
svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-turboacc package/small-package/luci-app-turboacc
svn export --force https://github.com/kiddin9/openwrt-packages/trunk/shortcut-fe package/small-package/luci-app-turboacc/shortcut-fe

## DDNS-Go
svn export --force https://github.com/kiddin9/openwrt-packages/trunk/ddnsgo package/kiddin-package/ddnsgo
svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ddns-go package/kiddin-package/luci-app-ddns-go
#svn export --force https://github.com/immortalwrt/luci/trunk/applications/luci-app-ddns-go package/immortalwrt/luci-app-ddns-go
#svn export --force https://github.com/immortalwrt/packages/trunk/net/ddns-go package/immortalwrt/luci-app-ddns-go
#

svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-rclone package/small-package/luci-app-rclone
#git clone https://github.com/bootli/luci-app-ddns-go.git package/ddns-go
#git clone https://github.com/kenzok8/openwrt-packages package/kenzo
#git clone https://github.com/kenzok8/small package/small
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
# git clone https://github.com/kiddin9/openwrt-packages.git package/kiddin9
#git clone https://github.com/NueXini/NueXini_Packages.git package/NueXini
#rm -f /workdir/openwrt/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/root-ipq40xx/sbin/mount.ntfs
#Add The Theme：luci-theme-opentomcat
#git clone https://github.com/Cosme927/luci-theme-opentomcat package/luci-theme-opentomcat
# zerotier
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.8.4/g' feeds/packages/net/zerotier/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=2866a4ef9193cca0a9f0fe528a0dea00c13cb0fd714bf388a0300cb6f3639b3b/g' feeds/packages/net/zerotier/Makefile
#rm -rf feeds/packages/net/zerotier
#cp -rf $GITHUB_WORKSPACE/general/zerotier feeds/packages/net
rm -rf package/small-package/chinadns-ng
rm -rf package/small-package/ddnsgo
rm -rf package/small-package/luci-app-ddns-go
