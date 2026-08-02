# OpenWrt 多源码仓库编译系统
本项目文件仅供学习和参考使用。

![GitHub Stars](https://img.shields.io/github/stars/qq784790529/Online-Translation-OpenWRT.svg?style=flat-square&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/qq784790529/Online-Translation-OpenWRT.svg?style=flat-square&logo=github)

### 使用 GitHub Actions 构建 OpenWrt 的模板

## 目录说明
  - configs文件夹里面的.config文件命名请勿更改，yml中已经设定好了
	  -  关于在config文件夹里面的.config文件说明
		  - diy1.comfig                  // 这个是yml中第一步自定义库1调用的config。
		  - diy2.config                   // 这个是yml中第一步自定义库2调用的config。
		  - diy3.config                   // 这个是yml中第一步自定义库3调用的config。
		  - immortalwrt.config      //这个是yml中第一步immortalwrt调用的config，仓库来自immortalwrt/immortalwrt。
		  - lede.config                    //这个是yml中第一步lede调用的config，仓库来自coolsnowwolf/lede。
		  - openwrt.config             //这个是yml中第一步openwrt调用的config，仓库来自openwrt/openwrt。
		  - custom.config               //这个是自定义仓库，在Actions→选中yml流程→Run workflow中第一行选中custom，第三行和第四行填入仓库和版本号会调用这个config内容用于拉取软件包。
	
  - 如果不会修改OpenWrt Multi-Source Build.yml但又同时想用自己的库可以在Run workflow创建自动化流程时 源码仓库和分支版本这里选择custom - custom手动填写

  - .github/workflows：放置自动流程yml的位置，里面用于自动化操作的步骤。
  
  - diy-part1.sh 和 diy-part2.sh是自定义脚本，从P3TERX/Actions-OpenWrt大佬的文件夹里面复制过来的，目前只会用diy-part2.sh的简单用法。
  
  - custom-dts：文件夹中放入了主板的dts文件，如果直接使用官方默认的dts可以无视，如果需要自定义可以将修改后的dts放置在这里面，注意和config中dts要对应，在target/linux/构架类型/image/系列名称.mk中可以看到对应的。
  
  - custom-ipk：这个文件夹放置ipk文件，只适用于24.10及以下版本，25版本已经不用ipk文件了，但是这个安装功能好像不太成功，不建议使用。


## 引用的库文件
  - [OpenWrt](https://github.com/openwrt/openwrt)
  - [LEDE](https://github.com/coolsnowwolf/lede)
  - [immortalWrt](https://github.com/ImmortalWrt/immortalwrt)
