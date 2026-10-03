#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 1. 扩容 DTS 到 32M
sed -i 's/0x7b0000/0x1fb0000/g' target/linux/ramips/dts/mt7620a_phicomm_psg1208.dts

# 2. 扩容 Makefile 的体积上限
sed -i '/define Device\/phicomm_psg1208/,/endef/ s/IMAGE_SIZE := .*/IMAGE_SIZE := 32448k/' target/linux/ramips/image/mt7620.mk
