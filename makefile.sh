###
 #  =======================================================================
 #  ····Y88b···d88P················888b·····d888·d8b·······················
 #  ·····Y88b·d88P·················8888b···d8888·Y8P·······················
 #  ······Y88o88P··················88888b·d88888···························
 #  ·······Y888P··8888b···88888b···888Y88888P888·888·88888b·····d88b·······
 #  ········888······"88b·888·"88b·888·Y888P·888·888·888·"88b·d88P"88b·····
 #  ········888···d888888·888··888·888··Y8P··888·888·888··888·888··888·····
 #  ········888··888··888·888··888·888···"···888·888·888··888·Y88b·888·····
 #  ········888··"Y888888·888··888·888·······888·888·888··888··"Y88888·····
 #  ·······························································888·····
 #  ··························································Y8b·d88P·····
 #  ···························································"Y88P"······
 #  =======================================================================
 # 
 #  -----------------------------------------------------------------------
 # Author       : 焱铭
 # Date         : 2023-12-03 16:42:32 +0800
 # LastEditTime : 2023-12-07 21:54:55 +0800
 # Github       : https://github.com/YanMing-lxb/
 # FilePath     : /GUET_Thesis_LaTeX/makefile.sh
 # Description  : 
 #  -----------------------------------------------------------------------
###

#!/bin/bash

# 基本设置
File_Name="main"
TeX_Name="xelatex"
Bib_Name="bibtex"

# 计算开始时间
Start_Time=$(date +"%s")
#==========================================================================
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除辅助文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 清除辅助文件
rm -rf $File_Name.pdf $File_Name.synctex *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk
echo "已清除完辅助文件"

#==========================================================================
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始一次 $TeX_Name 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 编译 Tex 文件 nonstopmode batchmode 批处理运行模式，无日志显示，利于提速
$TeX_Name -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 $File_Name.tex

echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始文献编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 编译参考文献
$Bib_Name $File_Name
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始目录编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
Catalogs="没有插入任何索引"
# 编译目录和符号说明索引
# 判断是否存在 .gls 文件，判断是否采用 glossaries 宏包生成符号说明表
if [[ -f "$File_Name.glo" ]]; then
    # 执行 makeindex 命令
    makeindex -s $File_Name.ist -o $File_Name.gls $File_Name.glo
    Catalogs="采用 glossaries 宏包生成符号说明表"
# 判断是否存在 .nls 文件，判断是否采用 nomencl 宏包生成符号说明表 
elif [[ -f "$File_Name.nlo" ]]; then
    # 执行 makeindex 命令
    makeindex -s nomencl.ist -o $File_Name.nls $File_Name.nlo
    Catalogs="采用 nomencl 宏包生成符号说明表"
# 判断是否存在 .idx 文件，判断是否需要生成索引
elif [[ -f "$File_Name.xdv" ]]; then
    # 执行 makeindex 命令
    makeindex "$File_Name.xdv"
    Catalogs="有目录 没符号说明表"
else
    # 打印该文章没有插入任何索引
    Catalogs="没有插入任何索引"
fi

echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始二次 $TeX_Name 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 编译 Tex 文件
$TeX_Name -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 $File_Name.tex

echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始三次 $TeX_Name 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 编译 Tex 文件
$TeX_Name -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 $File_Name.tex

echo ""
echo ""
echo ================================================================================
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 完成所有编译 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ================================================================================
echo ""
echo ""

#==========================================================================

echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除辅助文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 清除辅助文件
rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk
echo "已清除完辅助文件"

#==========================================================================

echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除已有结果文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
# 处理上次生成的结果文件
Build_Path="./Build/"
# 检查是否存在 ./Build/ 文件夹
if [[ -d "$Build_Path" ]]; then
    # 存在 ./Build/ 文件夹
    files_count=$(ls -A "$Build_Path" | wc -l)

    if [[ $files_count -gt 0 ]]; then
        # 存在文件或文件夹，删除所有内容
        rm -rf "$Build_Path"/*
        echo "删除上次生成的结果文件"
    else
        echo "已存在空Build文件夹"
    fi
else
    # 不存在 ./Build/ 文件夹，则创建
    mkdir "$Build_Path"
    echo "创建 Build 文件夹"
fi
echo ""
echo ""
#==========================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 移动生成文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
# 移动结果文件到指定文件夹
if [[ -f "$File_Name.pdf" ]]; then
    mv "$File_Name.pdf" $Build_Path
    mv "$File_Name.synctex" $Build_Path
    echo "移动结果文件到 Build 文件夹中"
else
    echo "未生成结果文件"
fi
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 目录生成情况 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo $Catalogs
echo ""
echo ""
#==========================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 统计编译时长 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
# 计算结束时间
End_Time=$(date +"%s")
# 计算运行时长
Run_Time=$(($End_Time - $Start_Time))
Hours=$((Run_Time / 3600))
Minutes=$(((Run_Time % 3600)/60))
Seconds=$((Run_Time % 60))

echo "编译时长为：$Hours 小时 $Minutes 分 $Seconds 秒 ($Run_Time s total)"
echo ""

# 延时关闭 5s
sleep 5