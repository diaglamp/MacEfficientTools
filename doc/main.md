# 文档入口

##  依赖文件/路径

- `./tools/defaultbrowser`

## 这个库能做什么

[详细文档](features.md)

## 方法封装

- `brew_install()`
- `backup_file()`
- `bs_cp()`

shell 语法可以参考 [github](https://github.com/diaglamp) 相关文档

## 系统配置

主要配置的是系统默认但不好用的设置。

[详细文档](system.md)

## 环境搭建

**python3**

``` sh
brew install python3
```

**Shadowsocks**

``` sh
brew cask install shadowsocksx-ng

# TODO config 
```

## App 安装

**iTerm2**

```sh
brew cask install iterm2

# TODO config
```

主要做了以下配置，但没了解细节，先注释了

1. 配置了快捷键 Command + ←, 可以向左回退一个单词
2. 配置了快捷键 Command + →，可以向右前进一个单词
3. 配置了快捷键 Command + delete，不管光标在哪里都可以删除当前行，相当于 `Ctrl + A` 再加一个 `Ctrl + K`
4. Command + d 垂直切分屏幕，Command + Shift + d 水平切分屏幕，Command + [ 或 ] 切换分屏
5. F1 可以快速召唤一个半透明的 iTerm 窗口，方便做一些简单的操作。

**SourceTree**

``` sh
brew cask install sourcetree
```

**WeChat**

``` sh
brew cask install WeChat
```

**Chrome**

``` sh
brew cask install google-chrome

# Set Chrome as default browser
git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
(cd ./tools/defaultbrowser && make && make install)
defaultbrowser chrome
```

**VSCode**

[详细文档](vscode.md)

常用插件

- Beautify : js, json, css, html
- Markdown All in One : short cuts
- Markdown PDF : markdown -> pdf
- markdownlint : lint
- Python : linting, debugging, formatting, etc.

``` sh
brew cask install visual-studio-code

# TODO config
```

## 命令行工具

**gsed**

mac sed is different from linux sed, gsed is same as liunx sed

``` sh
brew install gnu-sed
```

**coreutils**

需要更详细看看是啥

GNU核心工具组，包含了许多基本工具（如cat，ls 和 rm）在类 Unix 操作系统上的重新实现。

``` sh
brew install coreutils
mv /usr/local/opt/coreutils/libexec/gnubin/ls /usr/local/opt/coreutils/libexec/gnubin/gls
```

**autojump**

自动补全历史路径 

- 路径必须访问过
- 按使用频次排序

基本用法:

``` sh
j foo # jump directory contains foo
jc foo # jump to child directory (sub-directory of current directory) 
jo foo # open
```

更多详尽的用法请参考 [官方文档](https://github.com/wting/autojump)

``` sh
brew_install autojump
```

**fzf**

模糊搜索工具

功能就是递归搜索当前目录下的所有文件，选择后输出相对路径。

单这么看并没有什么用，所以要和其他工具组合使用，比如 vim git 等

``` sh
brew_install fzf
```