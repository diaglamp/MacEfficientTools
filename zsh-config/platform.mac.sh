
## == open file == ##

alias o='open'
alias oo='open .'

function ow() {
    if [[ -n "$@" ]]; then
        (cd "$@" && ow)
    else
        if ls *.xcworkspace 2>&1 1>/dev/null; then
            for i in *.xcworkspace;open "$i"
        elif ls *.xcodeproj 2>&1 1>/dev/null; then
            for i in *.xcodeproj;open "$i"
        else
            echo "ERROR, xcode project not exists in '$(pwd)' !"
            echo "Use this in xcode project directory or use 'ow <DIRECTORY>'"
        fi
    fi
}

alias ll='ls -alhG'
alias src='source ~/.zshrc'

# export BSTEMP='/private/tmp'

## == IP == ##

function current_networkservice() {
    network=''
    if [ "$(networksetup -getnetworkserviceenabled Ethernet)" = 'Enabled' ]; then
       network='Ethernet'
    elif [ "$(networksetup -getnetworkserviceenabled Wi-Fi)" = 'Enabled' ]; then
       network='Wi-Fi'
    else
       network=''
    fi
    echo $network
}

function ip() {
    network=`current_networkservice`
    networksetup -getinfo $network | grep '^IP address' | awk -F: '{print $2}' | sed 's/ //g'
}

## == File operatoin == ##

# function bssize() {
#     location=$1
#     if [ ${location} = "/" ]; then
#         /bin/df -gH
#         return
#     fi

#     if [ -d "${location}" ]; then
#         pushd $PWD > /dev/null
#         cd ${location}
#         du -d 1 -h -c
#         if [ ${location} != "." ]; then
#             popd >/dev/null
#         fi
#     else
#         if [ -f "${location}" ]; then
#             du -h ${location}
#         else
#             echo "No such file or directory"
#             return
#         fi
#     fi
# }

# mkcdir () {
#     mkdir -p -- "$1" &&
#     cd -P -- "$1"
# }

# function autojump_with_fzf() {
#     local dir
#     dir=$(cat ~/Library/autojump/autojump.txt | sort -nr | awk '{print $2}' | fzf +s) && cd "$dir"
# }

# function bsfn () {
#     # Use -or to support multi types
#     find . \( -type f -or -type l \) | egrep --color=always $1
# }

# function bssclient () {
#     nohup sslocal -q -c ~/.macbootstrap/config/shadowsocks.conf &> $BSTEMP/nohup.out&
# }

# function c() {
#     if [ "$#" -eq 0 ]; then
#         code .
#     elif [ "$#" -eq 1 ]; then
#         if [ -f $1 ]; then
#             code $1
#         elif [ -d $1 ]; then
#             (cd $1 && code .)
#         else
#             (j $1 && code .)
#         fi
#     else
#         echo "Usage: c or c path"
#     fi
# }

# function bswhich() {
#     if `type $1 | grep -q 'is a shell function'`; then
#         type $1
#         which $1
#     elif `type $1 | grep -q 'is an alias'`; then
#         PS4='+%x:%I>' zsh -i -x -c '' |& grep '>alias ' | grep "${1}="
#     fi
# }

# function wifipassword () {
#     SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`
#     security find-generic-password -D "AirPort network password" -a "$SSID" -gw
# }

# Get resolution of image
# function resolution() {
#     brew_install -q exiv2
#     exiv2 $1 | grep 'Image size' | column 4 5 6
# }

# Show path of xcode(Xcode must be running)
# function xcodepath() {
#     ps `pgrep -x Xcode` R 2 C -1
# }
