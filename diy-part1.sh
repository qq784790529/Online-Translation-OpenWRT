#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git mrhaav https://github.com/mrhaav/openwrt-packages' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

# luci-app-atinout 插件 与 modemfeed 重复
# echo 'src-git 4ice https://github.com/4IceG/luci-app-atinout-mod.git' >>feeds.conf.default

# QModem 支持4G和5G模组，已明确支持移远（Quectel）和广和通（Fibocom）的大部分4G和5G模组，以及 Sierra 和 Simcom 的部分5G模组
echo 'src-git QModem https://github.com/FUjr/QModem.git' >>feeds.conf.default
