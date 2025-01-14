#!/bin/bash

# 获取脚本所在的目录路径
SCRIPT_DIR=$(dirname "$0")

# 下载方正黑体简体到脚本所在目录
curl -o "$SCRIPT_DIR/FZ-ShuSong.ttf" "https://cdn.jsdelivr.net/gh/jaywcjlove/free-font@main/docs/fonts/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E9%BB%91%E4%BD%93%E7%AE%80%E4%BD%93.ttf"

# 下载方正楷体简体到脚本所在目录
curl -o "$SCRIPT_DIR/FZ-KaiTi.ttf" "https://cdn.jsdelivr.net/gh/jaywcjlove/free-font@main/docs/fonts/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E6%A5%B7%E4%BD%93%E7%AE%80%E4%BD%93.ttf"

# 下载方正书宋简体到脚本所在目录
curl -o "$SCRIPT_DIR/FZ-HeiTi.ttf" "https://cdn.jsdelivr.net/gh/jaywcjlove/free-font@main/docs/fonts/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E4%B9%A6%E5%AE%8B%E7%AE%80%E4%BD%93.ttf"


# sed -i 's/\r$//' Fonts/download_fonts.sh # 去掉Windows换行符