
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
 # LastEditTime : 2023-12-03 18:01:33 +0800
 # Github       : https://github.com/YanMing-lxb/
 # FilePath     : /YM-Beamer-Metropolis/makefile.sh
 # Description  : 
 #  -----------------------------------------------------------------------
###

#!/bin/bash

# 基本设置
File_Name="main"
TeX_Name="xelatex"
Bib_Name="biber"

# 计算开始时间
Start_Time=$(date +%T)
#==========================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除辅助文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 清除辅助文件
rm -r $File_Name.pdf $File_Name.synctex *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk

#==========================================================================
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始一次 %TeX_Name% 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
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
elif [[ -f "$File_Name.toc" ]]; then
    # 执行 makeindex 命令
    makeindex -s gind.ist -o $File_Name
    Catalogs="没有符号说明表"
else
    # 打印该文章没有插入任何索引
    Catalogs="没有插入任何索引"
fi
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始二次 %TeX_Name% 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 编译 Tex 文件
$TeX_Name -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 $File_Name.tex
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始三次 %TeX_Name% 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 编译 Tex 文件
$TeX_Name -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 $File_Name.tex
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 完成所有编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""

#==========================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除辅助文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo ""
echo ""
# 清除辅助文件
rm -r *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk

#==========================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除已有结果文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
# 处理上次生成的结果文件
Build_Path="./Build/"
# 检查是否存在 ./Build/ 文件夹
if [[ -d "$Build_Path" ]]; then
    # 存在 ./Build/ 文件夹，则删除
    rm -rf "$Build_Path"
    echo "删除上次生成的结果文件"
    mkdir $Build_Path
    echo "创建 Build 文件夹"
else
    # 不存在 ./Build/ 文件夹，则创建
    mkdir $Build_Path
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
#==========================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 统计编译时长 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
# 计算结束时间
End_Time=$(date +%T)
# 格式化时间
start_h=$(echo $Start_Time | awk -F":" '{print $1}')
start_m=$(echo $Start_Time | awk -F":" '{print $2}')
start_s=$(echo $Start_Time | awk -F":" '{print $3}')
end_h=$(echo $End_Time | awk -F":" '{print $1}')
end_m=$(echo $End_Time | awk -F":" '{print $2}')
end_s=$(echo $End_Time | awk -F":" '{print $3}')
hours=$(($end_h-$start_h))
mins=$(($end_m-$start_m))
secs=$(($end_s-$start_s))
ms=0
if [ $secs -lt 0 ]; then
    mins=$(($mins-1))
    secs=$(($secs+60))
fi
if [ $mins -lt 0 ]; then
    hours=$(($hours-1))
    mins=$(($mins+60))
fi
if [ $hours -lt 0 ]; then
    hours=$(($hours+24))
fi
totalsecs=$(($hours*3600+$mins*60+$secs))
echo "编译时长为：$hours 小时 $mins 分 $secs 秒 $ms 毫秒 ($totalsecs.$ms ms total)"
echo ""
echo ""
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 目录生成情况 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo $Catalogs
# 延时关闭 5s
sleep 5