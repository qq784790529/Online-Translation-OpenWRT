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

# luci-app-passwall 依赖
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
# 这两个容易404或者失败，没事就不用开
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >>feeds.conf.default

# 4G/5G模组
# modemfeed 轻量化 不好用
# echo 'src-git modemfeed https://github.com/koshev-msk/modemfeed.git' >>feeds.conf.default
# QModem 一站式 编译不出固件
# echo 'src-git qmodem https://github.com/FUjr/QModem.git' >>feeds.conf.default
# luci-app-vohive 驱动管理插件（可选）LuCI -> Applications -> luci-app-vohive
# echo 'src-git vohive https://github.com/voorz/luci-app-vohive.git' >>feeds.conf.default

# 3ginfo-lite 专注于显示信号强度、网络类型等关键信息
# echo 'src-git 3ginfo https://github.com/4IceG/luci-app-3ginfo-lite.git' >>feeds.conf.default
