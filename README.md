OpenWrt 多源码仓库编译系统


📁 项目目录结构
your-openwrt-build-repo/
├── .github/
│   └── workflows/
│       └── build.yml          # OpenWrt 编译自动化工作流文件
├── configs/
│   ├── openwrt.config         # OpenWrt 官方仓库配置文件
│   ├── lede.config            # LEDE 仓库配置文件
│   ├── immortalwrt.config     # ImmortalWrt 官方仓库配置文件
│   ├── diy1.config            # DIY1 仓库配置文件
│   ├── diy2.config            # DIY2 仓库配置文件
│   └── custom.config          # Custom 仓库配置文件
├── diy-part1.sh               # DIY 脚本第一部分（可选）
├── diy-part2.sh               # DIY 脚本第二部分（可选）
├── feeds.conf.default         # feeds 配置文件（可选）
├── README.md                  # 项目说明文档（本文件）
└── .gitignore                 # Git 忽略文件配置
🚀 使用步骤
第一步：Fork 本仓库
访问 GitHub 仓库页面
点击右上角的 Fork 按钮
将仓库 Fork 到你的 GitHub 账号下
第二步：准备配置文件
在 configs/ 目录下准备对应的 .config 配置文件：
bash

编辑



# 进入你的 OpenWrt 源码目录
cd openwrt

# 配置你需要的选项
make menuconfig

# 保存配置到文件
cp .config /path/to/your-repo/configs/openwrt.config
重要提示:
openwrt/openwrt 仓库 → 使用 configs/openwrt.config
coolsnowwolf/lede 仓库 → 使用 configs/lede.config
ImmortalWrt/immortalwrt 仓库 → 使用 configs/immortalwrt.config
DIY1 仓库 → 使用 configs/diy1.config
DIY2 仓库 → 使用 configs/diy2.config
custom 仓库 → 使用 configs/custom.config
第三步：运行编译工作流
进入你的仓库页面
点击 Actions 标签
选择 OpenWrt 多源码仓库编译 工作流
点击 Run workflow 按钮
选择源码仓库和分支版本
点击 Run workflow 确认
第四步：下载编译产物
编译完成后：
进入 Actions 标签
点击最新的工作流运行记录
在底部找到 Artifacts 部分
下载 openwrt-firmware 压缩包
📂 目录和文件说明
.github/workflows/ 目录
build.yml - OpenWrt 编译自动化工作流文件
这是整个项目的核心文件，定义了编译流程和配置选项。所有编译操作都在这里进行配置和执行。
configs/ 目录
存放不同仓库对应的 OpenWrt 配置文件，每个配置文件对应一个源码仓库：
openwrt.config - OpenWrt 官方仓库的配置文件
lede.config - LEDE (coolsnowwolf) 仓库的配置文件
immortalwrt.config - ImmortalWrt 官方仓库的配置文件
diy1.config - DIY1 仓库的配置文件
diy2.config - DIY2 仓库的配置文件
custom.config - Custom 仓库的配置文件
重要：配置文件命名必须与仓库名严格对应，否则编译会失败。
diy-part1.sh 文件
DIY 脚本第一部分，在更新 feeds 之前执行。
用途：
修改源码
添加补丁
添加自定义 feeds 源
示例内容：
bash

编辑



#!/bin/bash
cd openwrt

# 添加额外的 feeds
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default

# 应用自定义补丁
# patch -p1 < ../patches/my-patch.patch
diy-part2.sh 文件
DIY 脚本第二部分，在更新 feeds 之后执行。
用途：
修改已安装的 feeds
添加自定义软件包
修改编译选项
示例内容：
bash

编辑



#!/bin/bash
cd openwrt

# 修改 feeds 配置
sed -i 's/option check_signature/# option check_signature/g' feeds.conf.default

# 添加自定义软件包
# git clone https://github.com/xxx/xxx package/xxx
feeds.conf.default 文件
feeds 配置文件，定义了 OpenWrt 编译时使用的 feeds 源。
用途：
指定 feeds 源地址
控制 feeds 更新行为
示例内容：
bash

编辑



src-git packages https://github.com/openwrt/packages.git
src-git luci https://github.com/openwrt/luci.git
src-git routing https://github.com/openwrt/routing.git
src-git telephony https://github.com/openwrt/telephony.git
.gitignore 文件
Git 忽略文件配置，指定哪些文件不应该被提交到 Git 仓库。
用途：
忽略编译产物
忽略临时文件
忽略 IDE 配置文件
🔧 自动化工作流中引用的库位置
在 build.yml 文件中，引用了以下 GitHub Actions 库：
1. actions/checkout@v4
位置：第 157 行左右
yaml

编辑



- name: 🔍 检出当前仓库
  uses: actions/checkout@v4
作用：检出当前仓库代码，获取配置文件和脚本
2. actions/upload-artifact@v4
位置：第 297 行和第 304 行
yaml

编辑



- name: 📤 上传固件
  uses: actions/upload-artifact@v4
  with:
    name: openwrt-firmware
    path: ${{ env.REPO_DIR }}/bin/targets/*/*

- name: 📤 上传 bin 目录
  uses: actions/upload-artifact@v4
  with:
    name: openwrt-bin
    path: ${{ env.REPO_DIR }}/bin
作用：将编译产物上传为 GitHub Actions Artifact
3. softprops/action-gh-release@v1
位置：第 310 行左右
yaml

编辑



- name: 🚀 发布到 Release
  uses: softprops/action-gh-release@v1
  with:
    files: ${{ env.REPO_DIR }}/bin/targets/*/*
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
作用：将编译产物发布到 GitHub Release
🌿 分支版本号配置说明
位置 1：工作流输入选项（第 10-51 行）
在 build.yml 文件的 on.workflow_dispatch.inputs.source_branch.options 部分定义了所有可选的仓库和分支：
yaml

编辑



on:
  workflow_dispatch:
    inputs:
      source_branch:
        description: '源码仓库和分支版本'
        type: choice
        required: true
        options:
          # OpenWrt 官方仓库
          - 'openwrt/openwrt - main'
          - 'openwrt/openwrt - lede-17.01'
          - 'openwrt/openwrt - master'
          - 'openwrt/openwrt - openwrt-18.06'
          - 'openwrt/openwrt - openwrt-19.07'
          - 'openwrt/openwrt - openwrt-21.02'
          - 'openwrt/openwrt - openwrt-22.03'
          - 'openwrt/openwrt - openwrt-23.05'
          - 'openwrt/openwrt - openwrt-24.10'
          - 'openwrt/openwrt - openwrt-25.12'
          
          # LEDE 仓库
          - 'coolsnowwolf/lede - master'
          
          # ImmortalWrt 官方仓库
          - 'ImmortalWrt/immortalwrt - master'
          - 'ImmortalWrt/immortalwrt - openwrt-25.12'
          - 'ImmortalWrt/immortalwrt - openwrt-24.10'
          - 'ImmortalWrt/immortalwrt - openwrt-23.05'
          - 'ImmortalWrt/immortalwrt - openwrt-21.02'
          - 'ImmortalWrt/immortalwrt - openwrt-18.06'
          - 'ImmortalWrt/immortalwrt - openwrt-18.06-k5.4'
          
          # DIY1 仓库
          - 'DIY1 - master'
          - 'DIY1 - openwrt-25.12'
          - 'DIY1 - openwrt-24.10'
          - 'DIY1 - openwrt-23.05'
          - 'DIY1 - openwrt-21.02'
          - 'DIY1 - openwrt-18.06'
          - 'DIY1 - openwrt-18.06-k5.4'
          
          # DIY2 仓库
          - 'DIY2 - master'
          
          # 完全自定义
          - 'custom - custom'
说明：
格式为：仓库名 - 分支版本
用户在运行工作流时从下拉菜单中选择
修改这里可以添加或删除可选的仓库和分支
位置 2：仓库地址和配置文件映射（第 86-147 行）
在 Parse Repository and Branch 步骤中，根据选择的仓库名设置对应的仓库地址和配置文件：
yaml

编辑



case "$REPO_NAME" in
  "openwrt/openwrt")
    REPO_URL="https://github.com/openwrt/openwrt"
    REPO_DIR="openwrt"
    CONFIG_FILE="configs/openwrt.config"
    ;;
    
  "coolsnowwolf/lede")
    REPO_URL="https://github.com/coolsnowwolf/lede"
    REPO_DIR="lede"
    CONFIG_FILE="configs/lede.config"
    ;;
    
  "ImmortalWrt/immortalwrt")
    REPO_URL="https://github.com/ImmortalWrt/immortalwrt"
    REPO_DIR="immortalwrt"
    CONFIG_FILE="configs/immortalwrt.config"
    ;;
    
  "DIY1")
    REPO_URL="https://github.com/qq784790529/immortalwrt"  # 可修改
    REPO_DIR="diy1"
    CONFIG_FILE="configs/diy1.config"
    ;;
    
  "DIY2")
    REPO_URL="https://github.com/your-custom-repo-2"  # 可修改
    REPO_DIR="diy2"
    CONFIG_FILE="configs/diy2.config"
    ;;
    
  "custom")
    REPO_URL="$CUSTOM_URL"
    REPO_DIR=$(basename "$CUSTOM_URL" .git)
    BRANCH_NAME="$CUSTOM_BRANCH"
    CONFIG_FILE="configs/custom.config"
    ;;
esac
说明：
REPO_URL - 仓库地址
REPO_DIR - 克隆到本地的目录名
CONFIG_FILE - 使用的配置文件路径
DIY1 和 DIY2 的仓库地址可以在这里修改
位置 3：自定义仓库输入（第 54-61 行）
当选择 custom - custom 时，需要手动输入仓库地址和分支：
yaml

编辑



custom_url:
  description: '仅当选择 custom使用请输入custom的url仓库地址'
  type: string
  required: false

custom_branch:
  description: '仅当选择 custom使用请输入custom的分支版本'
  type: string
  required: false
说明：
custom_url - 自定义仓库的完整 URL
custom_branch - 自定义仓库的分支名称
仅在选择 custom - custom 时需要填写
⚙️ 环境变量配置说明
在 build.yml 文件的 env 部分（第 63-99 行）定义了以下环境变量：
yaml

编辑



env:
  # 基础配置
  FEEDS_CONF: feeds.conf.default          # feeds 配置文件路径
  DIY_P1_SH: diy-part1.sh                 # DIY 脚本 Part 1 路径
  DIY_P2_SH: diy-part2.sh                 # DIY 脚本 Part 2 路径
  
  # 上传配置
  UPLOAD_FIRMWARE: true    # 是否上传固件文件
  UPLOAD_BIN_DIR: false    # 是否上传整个 bin 目录
  UPLOAD_RELEASE: false    # 是否发布到 GitHub Release
  
  TZ: Asia/Shanghai        # 时区设置

说明：
修改这些值可以控制编译行为
UPLOAD_FIRMWARE 建议保持 true，方便下载固件
UPLOAD_BIN_DIR 建议保持 false，除非需要完整编译产物
UPLOAD_RELEASE 建议保持 false，手动发布更可控
