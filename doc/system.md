# 默认 OS X 系统配置修改

有些配置无法立即生效，因此建议安装完以后重启，即可看到效果

## 依赖文件

- tools/DockIconHider_source.m
- // config/com.apple.systemuiserver.plist

## 禁用访客账号登录 (单独跑有问题先注释)
```sh
# sudo bash install-steps/guest_account.sh disable
```

## 交换 F1-F12 与特殊按键（外接键盘的话不需要）

默认情况下，键盘上的 F1-F12 是特殊键，偏向娱乐，比如 F1、F2 调整亮度，F11、F12 调整声音等。但程序员没必要总是折腾这些。

其实 F1-F12 可以用作快捷键，但需要配合键盘左下角的 Fn
键一起按下。此脚本的作用是让 F1 键成为真正的 F1，如果调节亮度才需要 Fn + F1:

```sh
defaults write -globalDomain com.apple.keyboard.fnState -int 1
```

## 开启完全键盘控制

在 Mac OS 弹出的对话框中，经常需要切换选项, 不用移动鼠标点击右边的选项，只要按下 `Tab` 键即可切换到右侧选项，再按下空格键就可以选中了。

以上特性需要完全开启键盘控制，由下面这行代码实现：

```sh
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
```

## dock 设置

- 自动展示/隐藏 加快动画速度
- 加快 Mission Control 动画
- 设置左边
- 移除系统默认 APP

```sh
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.05 #动画速度
defaults write com.apple.dock expose-animation-duration -float 0.12 
```

> 移除App需要修改的内容比较多，这里使用了 oc 文件编译后执行去修改（其实用 python/sh 去改更适合一些）

## 显示电池电量百分比

```sh
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
```

## 加速窗口大小调整动画

```sh
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
```

## Finder 配置

- CreateDesktop 不知道是啥，注释
- Allow text selection in Quick Look (QL中选择文本，好功能，但设置了，并无卵用)
- Hide icons for hard drives, servers, and removable media on the desktop （隐藏桌面硬盘等icon）
- Disable the warning when changing a file extension 修改后缀时不再询问
- Always show filename extension 总是显示文件后缀

```sh
# defaults write com.apple.finder CreateDesktop false
defaults write com.apple.finder QLEnableTextSelection -boolean true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -boolean false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -boolean false
defaults write com.apple.finder FXEnableExtensionChangeWarning -boolean false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

## 配置触摸板 (待测试)

- 启用触摸板轻触点击
- 开启三指拖动 (三指上下左右滑动都有冲突手势, 注释)

```sh
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
```

## 显示 `~/Library/` 目录

这个目录默认是隐藏的，我们可以在不显示所有隐藏文件的前提下单独显示它：

```sh
chflags nohidden ~/Library
```

## 禁用 spotlight (没必要, 先注释, Todo: 修改快捷键即可)（需同步安装 Alfred）

```sh
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
```

## Menu bar 设置 (待测试)

- 隐藏 Siri icon
- `systemuiserver` 不知道做了啥，先注释
- Disable menu bar transparency 禁用透明

```sh
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri UserHasDeclinedEnable -bool true

#cp config/com.apple.systemuiserver.plist ~/Library/Preferences/
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
```

## 禁用镜像文件验证 (无感，先注释)（比如第三方渠道下载的 xcode，但会不会有安全风险？）

打开大的 DMG 文件时，验证过程也是蛮繁琐的，可以关闭：

```sh
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
```

## 禁用 App 验证

- 允许第三方来源 App 安装
- Disable the “Are you sure you want to open this application?” dialog

```sh
sudo spctl --master-disable
defaults write com.apple.LaunchServices LSQuarantine -bool false
```

## 禁用文字自动更正

很多时候系统的自动改正功能反而会帮倒忙，比如：

- 有时候明明要输入普通的引号，`'` 或者`"`，结果被自动改成斜体的 `“`，导致各种解析错误
- 有时候输入两个连字符(dash) `--` 被自动改成为长的(emdash) `—`
- 明明每行第一个字母我就是要小写，结果自动改成大写

这些自动改正可以用以下命令来禁止：

```sh
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
```
