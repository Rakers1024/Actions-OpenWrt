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

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/linkease/istore.git && mv istore/luci/luci-app-store package/ && rm -rf istore
git clone https://github.com/lisaac/luci-lib-docker.git && mv luci-lib-docker/collections/luci-lib-docker package/ && rm -rf luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman.git && mv luci-app-dockerman/applications/luci-app-dockerman package/ && rm -rf luci-app-dockerman
git clone https://github.com/sirpdboy/netspeedtest.git && mv netspeedtest/luci-app-netspeedtest package/ && rm -rf netspeedtest
