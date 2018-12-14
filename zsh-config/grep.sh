# find & grep by file extension
function xgrep() {
    if [[ "$#" -eq 3 ]]; then
        find "$1" -type f -name "*.$2"|xargs grep -n "$3"
    elif [[ "$#" -eq 2 ]]; then
        find . -type f -name "*.$1"|xargs grep -n "$2"
    else
        echo "Useage:xgrep [DIRECTORY] <file-extension> <pattern>"
    fi
}

#如果不指定文件名，默认是当前目录下递归搜索，否则在指定文件名中搜索
function bsgrep() {
    if [ $# -eq 1 ]; then
        grep -rn "$1" .
    else
        grep -n "$1" "$pwd/$2"
    fi
}