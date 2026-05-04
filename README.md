# OpenWrt 多源码仓库编译系统
本项目文件仅供学习和参考使用。

![GitHub Stars](https://img.shields.io/github/stars/qq784790529/Online-Translation-OpenWRT.svg?style=flat-square&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/qq784790529/Online-Translation-OpenWRT.svg?style=flat-square&logo=github)

使用 GitHub Actions 构建 OpenWrt 的模板

##说明
  - configs/文件夹里面的.config文件命名和.github/workflows/OpenWrt Multi-Source Build.yml中定义一致，如果看不懂请不要随意更改名字。
  - .github/workflows/OpenWrt Multi-Source Build.yml是Actions的自动化流程文件，里面配置库URL地址和分支版本，默认已经配好openwrt官方库、lede库以及immortalWrt库，最高分支版本为25。
  - OpenWrt Multi-Source Build.yml同时还有两个自定义库的位置，可以自行更改，注释写的很明白，如果不需要自定义库请直接使用openwrt官方库、lede库以及immortalWrt库。
  - 如果不会修改OpenWrt Multi-Source Build.yml但又同时想用自己的库可以在Run workflow创建自动化流程时 源码仓库和分支版本这里选择custom - custom手动填写
  - 源码仓库和分支版本 custom - custom 说明：如果选择custom - custom 请填写第二栏的URL和第三栏的分支版本。
  - diy-part1.sh 和 diy-part2.sh是自定义脚本，从P3TERX/Actions-OpenWrt大佬的文件夹里面复制过来的

##用法
  - Fock这个项目到自己的Github账号，在自己的账号里面操作。
  -   1、使用已经配置好的.config, 进入configs里面将自己的配置好的.config配置到相对应的 库.config 文件里面。
  -   2、没有.config也无需担心, 有带有SSH配置流程的自动化流程方法调试。
  - 进入Fock的过来项目, configs里面找到要用的库，将自己的.config复制进里面对应的文件。
  - 状态栏菜单那进入Actions，左侧All workflows下面的
  -   1、OpenWrt 多源码仓库编译 不支持SSH配置            //这个不支持ssh调试，默认使用configs里面的.config文件
  -   2、OpenWrt 多源码仓库编译 支持SSH配置.config      //这个支持ssh调试，需要在run workflow里面勾选，如果不勾选默认使用configs里面的.config文件。

##关于dts的问题
  - dts不在本项目中使用
  - dts需要配置在你Fock的库中，具体的dts正常因该是在 ../target/linux/SOC架构/dts/ 里面，找到对应的版型修改就行

##Credits
  - [OpenWrt](https://github.com/openwrt/openwrt)
  - [LEDE](https://github.com/coolsnowwolf/lede)
  - [immortalWrt](https://github.com/ImmortalWrt/immortalwrt)
