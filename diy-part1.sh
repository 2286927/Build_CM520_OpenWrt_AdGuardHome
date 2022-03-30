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
sed -i 's/192.168.1.1/4.1.1.1/g' package/base-files/files/bin/config_generate
# 修改机器名称
sed -i 's/OpenWrt/CM520-79F/g' package/base-files/files/bin/config_generate
# 修改机器初始密码
sed -i 's/root::0:0:99999:7:::/root::0:0:99999:7:::/g' package/base-files/files/etc/shadow

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
#sed -i '$a src-git dockerman https://github.com/lisaac/luci-app-dockerman' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
git clone https://github.com/kenzok8/small.git package/small
#git clone https://github.com/kiddin9/openwrt-packages.git package/kiddin9
git clone https://github.com/NueXini/NueXini_Packages.git package/NueXini
rm -f /workdir/openwrt/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/root-ipq40xx/sbin/mount.ntfs
#Add The Theme：luci-theme-opentomcat
#git clone https://github.com/Cosme927/luci-theme-opentomcat package/luci-theme-opentomcat
