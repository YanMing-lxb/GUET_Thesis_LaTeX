: 设置编码为utf-8，解决中文显示问题
chcp 65001

@echo off

:: 设置标题
title %date% %time% makefile
:: 基本设置
set File_Name=main
set TeX_Name=xelatex
set Bib_Name=bibtex

:: 计算开始时间
set Start_Time=%time%


echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除辅助文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
:: clear aux files
del /q %File_Name%.pdf %File_Name%.synctex *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.synctex(busy) *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk


echo.
echo.
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始一次 %TeX_Name% 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
:: compile the tex file nonstopmode batchmode 批处理运行模式，无日志显示，利于提速
%TeX_Name%.exe -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 %File_Name%.tex
echo.
echo.
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始文献编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
:: compile bibliography
%Bib_Name% %File_Name%
echo.
echo.
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始目录编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
set Catalogs=没有插入任何索引 
:: 编译目录和符号说明索引 
:: 判断是否存在 .gls 文件，判断是否采用glossaries宏包生成符号说明表 
if exist "%File_Name%.glo" ( 
  :: 执行 makeindex 命令 
  makeindex -s %File_Name%.ist -o %File_Name%.gls %File_Name%.glo 
  set Catalogs=采用glossaries宏包生成符号说明表
) else ( 
  :: 判断是否存在 .nls 文件，判断是否采用nomencl宏包生成符号说明表 
  if exist "%File_Name%.nlo" ( 
    :: 执行 makeindex 命令 
    makeindex -s nomencl.ist -o %File_Name%.nls %File_Name%.nlo 
    set Catalogs=采用nomencl宏包生成符号说明表
  ) else ( 
    :: 判断是否存在 .xdv 文件，判断是否需要生成索引 
    if exist "%File_Name%.xdv" ( 
      :: 执行 makeindex 命令 
      makeindex %File_Name%.xdv
      set Catalogs=有目录但没符号说明表
    ) else ( 
        :: 打印该文章没有插入任何索引 
        set Catalogs=没有插入任何索引 
    ) 
  ) 
)
echo.
echo.
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始二次 %TeX_Name% 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
:: compile the tex file batchmode nonstopmode
%TeX_Name%.exe -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 %File_Name%.tex
echo.
echo.
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始三次 %TeX_Name% 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
:: compile the tex file nonstopmode batchmode: 不输出过程信息，提高速度
%TeX_Name%.exe -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 %File_Name%.tex
echo.
echo.
echo ================================================================================
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 完成所有编译 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ================================================================================
echo.
echo.

:: ==========================================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除辅助文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo.
echo.
:: call makeclear
del /q *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.synctex(busy) *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk

:: ==========================================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 清除已有结果文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
:: 处理上次生成的结果文件
set Build_Path="./Build/"
:: 检查 Build 文件夹是否存在
if exist %Build_Path% (
    :: 检查 Build 文件夹中是否有文件或子文件夹
    dir /b /a:-d %Build_Path% >nul 2>nul
    if errorlevel 1 (
        :: 没有文件或子文件夹，打印消息
        echo 已存在空的 Build 文件夹。
    ) else (
        :: 文件或子文件夹存在，删除所有内容
        rd /s /q %Build_Path%
        echo 删除 Build 文件夹中的所有文件和子文件夹。
    )
) else (
    :: Build 文件夹不存在，创建它
    mkdir %Build_Path%
    echo 创建 Build 文件夹。
)
echo.
echo.
:: ==========================================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 移动生成文件 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
:: 移动结果文件到指定文件夹
if exist "%File_Name%.pdf" (
    move "%File_Name%.pdf" %Build_Path%
    move "%File_Name%.synctex" %Build_Path%
    echo 移动生成文件到 Build 文件夹中
) else (
    echo 未检索到生成的pdf文件
)
echo.
echo.
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 目录生成情况 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
echo %Catalogs%
echo.
echo.
:: ==========================================================================================
echo ================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 统计编译时长 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ================================================================================
:: 计算结束时间
set End_Time=%time%
:: 格式化时间
set options="tokens=1-4 delims=:.,"
for /f %options% %%a in ("%Start_time%") do set start_h=%%a&set /a start_m=100%%b %% 100&set /a start_s=100%%c %% 100&set /a start_ms=100%%d %% 100
for /f %options% %%a in ("%End_time%") do set end_h=%%a&set /a end_m=100%%b %% 100&set /a end_s=100%%c %% 100&set /a end_ms=100%%d %% 100
set /a hours=%end_h%-%start_h%
set /a mins=%end_m%-%start_m%
set /a secs=%end_s%-%start_s%
set /a ms=%end_ms%-%start_ms%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %hours% lss 0 set /a hours = 24%hours%
if 1%ms% lss 100 set ms=0%ms%
:: 计算时间并输出
set /a totalsecs = %hours%*3600 + %mins%*60 + %secs%
echo 编译时长为：%hours% 小时 %mins% 分 %secs% 秒 %ms% 毫秒 (%totalsecs%.%ms%s total)
echo.
:: 延时关闭 5s
@REM timeout /t 5
