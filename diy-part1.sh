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
sed -i 's/openwrt/CM520-97F/g' package/base-files/files/bin/config_generate
# 修改机器初始密码
sed -i 's/root:$1$N4/f5Vcd$7LygRu1WrAhqs/vmuC4Ty.:18817:0:99999:7:::/root::0:0:99999:7:::/g' /etc/shadow

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git dockerman https://github.com/lisaac/luci-app-dockerman' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

#Add The Theme：luci-theme-opentomcat
#git clone https://github.com/Cosme927/luci-theme-opentomcat package/luci-theme-opentomcat
