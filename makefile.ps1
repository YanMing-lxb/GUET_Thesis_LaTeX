# 设置窗口标题
$WindowTitle = "$(Get-Date -Format 'yyyy-MM-dd') $(Get-Date -Format 'HH:mm:ss') makefile"
[Console]::Title = $WindowTitle

# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 基本设置 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
$File_Name = "main"
$TeX_Name = "xelatex"
$Build_Path = ".\Build"
# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


# 计算开始时间
$Start_Time = Get-Date


# 清除辅助文件
Remove-Item "$File_Name.pdf", "$File_Name.synctex", "*.aux", "*.bbl", "*.blg", "*.log", "*.out", "*.toc", "*.bcf", "*.xml", "*.synctex", "*.nlo", "*.nls", "*.bak", "*.ind", "*.idx", "*.ilg", "*.lof", "*.lot", "*.ent-x", "*.tmp", "*.ltx", "*.los", "*.lol", "*.loc", "*.listing", "*.gz", "*.userbak", "*.nav", "*.snm", "*.vrb", "*.fls", "*.xdv", "*.fdb_latexmk" -Force -ErrorAction SilentlyContinue
Write-Host "已清除完辅助文件"

Write-Host ""
Write-Host ""
Write-Host "==============================================================================="
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始一次 $TeX_Name 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "==============================================================================="
Write-Host ""
Write-Host ""

# 编译 Tex 文件 nonstopmode batchmode 批处理运行模式，无日志显示，利于提速
& $TeX_Name -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 "$File_Name.tex"

Write-Host ""
Write-Host ""
Write-Host "==============================================================================="
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始文献编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "==============================================================================="
Write-Host ""
Write-Host ""

# 编译参考文献
# 查找当前文件夹及子文件夹中是否存在 .bib 文件
if (Get-ChildItem -Recurse -Filter "*.bib") {
    # 存在 .bib 文件
    if (Test-Path "$File_Name.bcf") {
        # 存在 .bcf 文件，采用 biber 编译
        $Bib_Name = "biber"
        & $Bib_Name $File_Name
    }
    else {
        # 否则，采用 bibtex 编译
        $Bib_Name = "bibtex"
        & $Bib_Name $File_Name
    }
    $Bib_Print = "$Bib_Name 编译参考文献"
}
else {
    $Bib_Print = "文档没有参考文献"
}

Write-Host ""
Write-Host ""
Write-Host "==============================================================================="
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始目录编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "==============================================================================="
Write-Host ""
Write-Host ""

$Catalogs_Print = "没有插入任何索引"

# 编译目录和符号说明索引
# 判断是否存在 .gls 文件，判断是否采用 glossaries 宏包生成符号说明表
if (Test-Path "$File_Name.glo") {
    # 执行 makeindex 命令
    makeindex -s "$File_Name.ist" -o "$File_Name.gls" "$File_Name.glo"
    $Catalogs_Print = "glossaries 宏包生成符号说明表"
}
# 判断是否存在 .nls 文件，判断是否采用 nomencl 宏包生成符号说明表 
elseif (Test-Path "$File_Name.nlo") {
    # 执行 makeindex 命令
    makeindex -s nomencl.ist -o "$File_Name.nls" "$File_Name.nlo"
    $Catalogs_Print = "nomencl 宏包生成符号说明表"
}
# 判断是否存在 .idx 文件，判断是否需要生成索引
elseif (Test-Path "$File_Name.xdv") {
    # 执行 makeindex 命令
    makeindex "$File_Name.xdv"
    $Catalogs_Print = "有目录 没符号说明表"
}
else {
    # 打印该文章没有插入任何索引
    $Catalogs_Print = "没有插入任何索引"
}

Write-Host ""
Write-Host ""
Write-Host "==============================================================================="
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始二次 $TeX_Name 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "==============================================================================="
Write-Host ""
Write-Host ""

# 编译 Tex 文件
& $TeX_Name -no-pdf -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 "$File_Name.tex"

Write-Host ""
Write-Host ""
Write-Host "==============================================================================="
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXX 开始三次 $TeX_Name 编译 XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "==============================================================================="
Write-Host ""
Write-Host ""

# 编译 Tex 文件
& $TeX_Name -shell-escape -file-line-error -halt-on-error -interaction=batchmode --synctex=-1 "$File_Name.tex"

Write-Host ""
Write-Host ""
Write-Host "==============================================================================="
Write-Host "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 完成所有编译 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
Write-Host "==============================================================================="
Write-Host ""
Write-Host "文档整体：$Tex_Name 编译"
Write-Host "参考文献：$Bib_Print"
Write-Host "目录索引：$Catalogs_Print"


Write-Host ""
Write-Host "==============================================================================="
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXX 开始执行编译以外的附加命令！XXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "==============================================================================="
Write-Host ""


# 处理上次生成的结果文件
# 检查是否存在 ./Build/ 文件夹
if (Test-Path $Build_Path -PathType Container) {
    # 存在 ./Build/ 文件夹
    $files_count = (Get-ChildItem -Path $Build_Path).Count

    if ($files_count -gt 0) {
        # 存在文件或文件夹，删除所有内容
        Remove-Item "$Build_Path\*" -Force -Recurse
        Write-Host "删除上次生成的结果文件"
    }
    else {
        Write-Host "已存在空Build文件夹"
    }
}
else {
    # 不存在 ./Build/ 文件夹，则创建
    New-Item -ItemType Directory -Path $Build_Path
    Write-Host "创建 Build 文件夹"
}

# 移动结果文件到指定文件夹
if (Test-Path "$File_Name.pdf") {
    Move-Item "$File_Name.pdf" $Build_Path
    Move-Item "$File_Name.synctex" $Build_Path
    Write-Host "移动结果文件到 Build 文件夹中"
}
else {
    Write-Host "未生成结果文件"
}

# 清除辅助文件
Remove-Item "*.aux", "*.bbl", "*.blg", "*.log", "*.out", "*.toc", "*.bcf", "*.xml", "*.synctex", "*.nlo", "*.nls", "*.bak", "*.ind", "*.idx", "*.ilg", "*.lof", "*.lot", "*.ent-x", "*.tmp", "*.ltx", "*.los", "*.lol", "*.loc", "*.listing", "*.gz", "*.userbak", "*.nav", "*.snm", "*.vrb", "*.fls", "*.xdv", "*.fdb_latexmk" -Force -ErrorAction SilentlyContinue
Write-Host "已清除完辅助文件"

Write-Host ""
Write-Host "==============================================================================="
# 计算结束时间
$End_Time = Get-Date
# 计算运行时长
$Run_Time = ($End_Time - $Start_Time).TotalSeconds
$Hours = [math]::floor($Run_Time / 3600)
$Minutes = [math]::floor(($Run_Time % 3600)/60)
$Seconds = [math]::floor($Run_Time % 60)

Write-Host "编译时长为：$Hours 小时 $Minutes 分 $Seconds 秒 ($Run_Time s total)"
Write-Host ""
