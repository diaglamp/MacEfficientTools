# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load?
plugins=(
  git autojump zsh-syntax-highlighting zsh-autosuggestions
)

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
### aliases

# path
XHJ_CONFIG_BASE="$HOME/.macconfig"
XHJ_ZSH_BASE=$XHJ_CONFIG_BASE/zsh

source $XHJ_CONFIG_BASE/basic.sh
source $XHJ_ZSH_BASE/common.sh

# cocoapods
alias piu="pod install --repo-update"
alias pi="pod install"
alias pu="pod update"
alias plint="pod lib lint --sources=http://gitlab.lizhi.fm/iOSPods/LizhiSpecs.git --use-libraries --allow-warnings"
alias ppush="pod repo push LizhiSpecs --sources=http://gitlab.lizhi.fm/iOSPods/LizhiSpecs.git --use-libraries --allow-warnings"
# mac
alias o='open'
alias oo='open .'
alias ll='ls -algG'
alias src='source ~/.zshrc'
alias ow="open *.xcworkspace"

