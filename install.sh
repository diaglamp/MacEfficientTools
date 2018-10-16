#!/bin/sh
source basic.sh

# === System Config ===

sudo ./install-steps/macos.sh

# === Environment Config ===

brew install python3

# TODO: install ShadowsocksX

# === App Install ===

if [[ ! -e /Applications/iTerm.app ]]; then
    brew cask install iterm2

    # 不知道配置改了啥，先注释，后续 git diff 研究
    # defaults delete com.googlecode.iterm2
    # cp config/com.googlecode.iterm2.plist $HOME/Library/Preferences
else
    echo "You have installed iTerm2"
fi

if [[ ! -e /Applications/SourceTree.app ]]; then
    brew cask install sourcetree
else
    echo "You have installed SourceTree"
fi

if [[ ! -e /Applications/WeChat.app ]]; then
    brew cask install wechat
else
    echo "You have installed WeChat"
fi

if [[ ! -e /Applications/Google\ Chrome.app ]]; then
    brew cask install google-chrome

    # Set Chrome as default browser
    git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
    (cd ./tools/defaultbrowser && make && make install)
    defaultbrowser chrome
else
    echo "You have installed chrome"
fi

if [[ ! -e /Applications/Visual\ Studio\ Code.app ]]; then
    brew cask install visual-studio-code

    # VSCode 配置，先注释，后续研究
    # sh ./vscode/setup.sh
else
    echo "You have installed vscode"
fi

# === Cmd Install ===

if brew ls --versions gnu-sed > /dev/null; then
    echo "You have installed gsed"
else
    brew install gnu-sed
fi

# install coreutils
if [[ ! -e /usr/local/opt/coreutils ]]; then
    brew install coreutils
    mv /usr/local/opt/coreutils/libexec/gnubin/ls /usr/local/opt/coreutils/libexec/gnubin/gls
else
    echo "You have installed coreutils"
fi

# 用一个装一个
# brew install --HEAD universal-ctags/universal-ctags/universal-ctags #vim下方便代码阅读的工具
# brew install redis #REmote DIctionary Server
# brew_install cmake #CMake is an open-source, cross-platform family of tools designed to build, test and package software. 
# brew_install gawk #gnu-awk
# brew_install autojump #自动补全历史路径
# brew_install wget #gnu下载工具
# brew_install nvm #Node Version Manager
# brew_install exiv2 #a Cross-platform C++ library and a command line utility to manage image metadata. 
# brew_install ssh-copy-id #本地主机的公钥复制到远程主机的authorized_keys文件上
# brew_install imagemagick #a software suite to create, edit, compose, or convert bitmap images. 
# brew_install catimg #Renders images in the terminal.
# brew_install gpg #加密软件
# brew_install icdiff #Improved colored diff
# brew_install scmpuff #Makes working with git from the command line quicker by substituting numeric shortcuts for files.
# brew_install fzf #A command-line fuzzy finder
# brew_install nvim #improvement of vim
# brew_install exiftool #a program for reading, writing, and manipulating image, audio, video, and PDF metadata. 
# $(brew --prefix)/opt/fzf/install --all #安装 fzf 的扩展

# Personal
./install-steps/personal.sh

# link git config
mv ~/.gitconfig ~/.gitconfig_backup
backup_file ~/.gitattributes
ln -s ~/.macbootstrap/git-config/.gitconfig ~/.gitconfig
ln -s ~/.macbootstrap/git-config/.gitattributes ~/.gitattributes

# install zsh
if [[ ! -e ~/.oh-my-zsh ]]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# zshrc setup
backup_file ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -s ~/.macbootstrap/zsh-config/.zshrc ~/.zshrc

# vim configuration
backup_file ~/.vim
backup_file ~/.config/nvim/
git clone https://github.com/bestswifter/vim-config.git ~/.config/nvim
ln -s ~/.config/nvim ~/.vim

# ESLint configuration
backup_file ~/.eslintrc.js
backup_file ~/.eslintrc
ln -s ~/.macbootstrap/.eslintrc.js ~/.eslintrc.js

# install Chisel and Coderunner
./install-steps/dependencies.before.sh

# unset ALL_PROXY
./install-steps/dependencies.after.sh
# ./install-steps/sogou_sync.sh

# ssh configuration
