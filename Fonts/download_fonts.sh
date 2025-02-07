#!/bin/bash
# 获取脚本所在目录
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# 定义字体下载链接和目标文件名
declare -A Fonts=(
  ["$SCRIPT_DIR/FZ-ShuSong.ttf"]="https://cdn.jsdelivr.net/gh/jaywcjlove/free-font@main/docs/fonts/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E4%B9%A6%E5%AE%8B%E7%AE%80%E4%BD%93.ttf"
  ["$SCRIPT_DIR/FZ-KaiTi.ttf"]="https://cdn.jsdelivr.net/gh/jaywcjlove/free-font@main/docs/fonts/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E6%A5%B7%E4%BD%93%E7%AE%80%E4%BD%93.ttf"
  ["$SCRIPT_DIR/FZ-HeiTi.ttf"]="https://cdn.jsdelivr.net/gh/jaywcjlove/free-font@main/docs/fonts/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E9%BB%91%E4%BD%93%E7%AE%80%E4%BD%93.ttf"
)

# 下载字体
for file in "${!Fonts[@]}"; do
  url="${Fonts[$file]}"
  echo "Downloading $file from $url..."
  wget -O "$file" "$url"
  if [[ $? -ne 0 ]]; then
    echo "Failed to download $file from $url"
  else
    echo "Successfully downloaded $file"
  fi
done

echo "All downloads are complete."


# 去掉Windows换行符（如果需要）
# sed -i 's/\r$//' ./Fonts/download_fonts.sh
