## 工作路径 latexmk 配置文件
## 文件名：latexmkrc 或 .latexmkrc
## 文件目录：.

# 设置pdf生成模式，有 0 1 2 3 4 5
# 0 代表不生成 pdf
# 1 代表使用 $pdfltex 选项的命令，在系统 RC 文件已经设置
# 2 代表使用 $ps2pdf；
# 3 代表使用 $dvipdf；
# 4 代表使用 $lualatex；
# 5 代表使用 $xelatex，在系统 RC 文件已经设置
$pdf_mode = 5;

# 设置 bibtex 或 biber 的使用规则，有 0 1 1.5 2
# 0: 不使用 bibtex 或 biber； 清空的时候不会清空 .bbl 文件
# 1: 只有 bib 文件存在才使用 bibtex 或 biber；清空的时候不会清空 .bbl 文件
# 1.5: 只有 bib 文件存在才使用 bibtex 或 biber；当 bib 文件存在时会清空 bbl，否则不会清空
# 2: 有必要更新bbl文件时，运行 bibtex 或 biber，无需测试 bib 文件存在与否；清空删除 bbl
$bibtex_use = 1.5;
# 设置 latex 文件输出的目录
# $out_dir = "Build";

# 设置预览模式，相当于 -pv 选项，在编译结束会开启预览
$preview_mode = 0; # 0不开启，1开启，由于使用latex workshop因此选为0
# $view 设置预览的文件格式
$view = "pdf";

  

# 设置 latexmk 编译的文件，和不需要编译的文件，可以时多个
# @default_files = ("main.tex");
# @default_excluded_files = ();

#$"latexmk -c" # 由于使用latex workshop进行后清理，因此注销该命令

