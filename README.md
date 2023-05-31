# GUET-LATEX-Thesis-Template-桂林电子科技大学毕业论文模板
[![](https://img.shields.io/badge/license-LPPL-blue)](https://www.latex-project.org/lppl/) [![](https://img.shields.io/github/last-commit/YanMing-lxb/Guet_LATEX_Thesis_Template)](https://github.com/YanMing-lxb/Guet_LATEX_Thesis_Template/zipball/master) [![](https://img.shields.io/github/issues/YanMing-lxb/Guet_LATEX_Thesis_Template)](https://github.com/YanMing-lxb/Guet_LATEX_Thesis_Template/issues)

此项目提供用于排版桂林电子科技大学毕业论文的LaTeX模板类，旨在帮助桂林电子科技大学的毕业生高效地完成毕业论文的写作。该模板由机电C323 李雪斌主编，梁锟参与，参考电子科大王稳师兄所编写的[ThesisUESTC-电子科技大学毕业论文模板](https://github.com/bdebye/thesisuestc)，希望日后能有师弟参与并维护该项目。
该模板符合桂林电子科技大学研究生学位论文的基本要求与书写格式-2022.02.23。

**目前本科毕业论文格式正在调整，欢迎参与该项目！**
>PS：目前作者忙于毕业，需要一段时间才能参与修改……，目前已调整cls样式文件的代码，可以使用`\ifbachelor{}{}`命令修改本科样式。


参考文献格式".bst"文件根据 GB/T 7714-2015 BibTeX Style 宏包配置参数进行自定义样式而来，符合桂林电子科技大学学位论文对参考文献格式的要求。在修改参考文献格式的过程中，感谢[GB/T 7714-2015 BibTeX Style项目](https://github.com/zepinglee/gbt7714-bibtex-style)的Zeping Lee大佬对我的帮助。

桂林电子科技大学Beamer模板：[Guet Beamer Theme](https://github.com/YanMing-lxb/Guet_Beamer_Theme)

## 使用方法
### 基本环境
使用模板需要系统安装任意一种TeX环境，如[TeXLive](http://mirror.ctan.org/systems/texlive/Images/)、[MacTeX](https://www.tug.org/mactex/mactex-download.html)和[MiKTeX](https://miktex.org/download)（都自动带有XeLaTeX引擎，但是不推荐CTeX），安装有 SimSun 和 SimHei 字体（其实就是宋体和黑体）以及 Times New Roman 英文字体。在 MacOS 系统下编译会自动识别操作系统，使用 Songti SC 和 STHeiti 字体，但需要启用`--shell-escape`编译选项。Linux 使用者可以下载[字体文件包](https://gitlab.com/Xmagus/fonts/-/archive/thesis/fonts-thesis.zip)解压到文档根目录。

#### 样式参数
|    命令   |  功能  |
|:---------:|:------:|
|  eversion | 电子版 |
|  pversion | 打印版 |
|  bachelor |  本科  |
|   master  |  学硕  |
| promaster |  专硕  |
|   doctor  |  博士  |
| ojmaster  |  在职硕士  |
| ptomaster |  非全专硕  |


> 根据学校要求打印版硕士学位论文封面桂电logo为黑色(其他的硕博的打印版桂电logo也都顺便设置成黑色的)，对与其他几种封面的相关要求可以在[**issues**](https://github.com/YanMing-lxb/Guet_LATEX_Thesis_Template/issues)中提出并补充。

### latexmk编译
编译文档请使用XeLaTeX引擎。模版提供latexmk设置文件用于自动编译。latexmk可自动调用相关程序进行编译，处理各种文件依赖并自动预览。可在终端执行`latexmk -c`命令清理所有缓存文件。
使用latexmk编译前，需在系统盘下创建名为latexmk的文件夹，并将LatexMK文件放入该文件夹下。请勿删掉latexmkrc文件。
**<font color="#d83931">注意</font>**：如果在Windows平台下使用MiKTeX还需要安装[Perl语言解释器](http://strawberryperl.com/)，方可使用latexmk进行编译。
编译时只需使用latexmk即可完成编译。

### 编辑器
推荐使用 Visual Code Studio 编辑器。
1. Visual Code Studio 中安装LaTeX Workshop 插件；
2. 所需的配置设置请看：[Visual_Code_Studio_中LaTeX_Workshop的设置说明](https://github.com/YanMing-lxb/Guet_LATEX_Thesis_Template/blob/main/Visual_Code_Studio_%E4%B8%ADLaTeX_Workshop%E7%9A%84%E8%AE%BE%E7%BD%AE%E8%AF%B4%E6%98%8E.md)

### 转word格式
请看：[转word命令](https://github.com/YanMing-lxb/Guet_LATEX_Thesis_Template/tree/main/Docs/Docs/%E8%BD%ACword%E5%91%BD%E4%BB%A4.md)
注意：
- 使用LaTeX转Word是通过Pandoc来实现，因此需要配置好Pandoc；
- 目前尚且存在转换后，图片不存在的问题（由于pandoc不支持读取多个文件夹图片的原因）。

## 写作指南
### 注意事项
- 在具有多个子图的情况时，子图与子图之间要留有一定的空间，不要占满，否则会发生自动换行；
- 标题中`\texorpdfstring` 命令包装数学公式，并提供一个无公式的备选项，如：`\section{\texorpdfstring{$E=mc^2$}{E=mc2}} ` 否则会有警告

### 论文封面
论文封面和扉页由`\makecover`命令添加，可以显示论文题目，作者，指导老师等，也可使用`\bindpdfcover{cover.pdf}`命令添加封面.独创性声明可以由`\originalitydeclaration`命令生成，添加扫描版签名后的声明使用`\signatureofdeclaration{signature.pdf}`命令。

封面显示的信息可以使用一系列命令进行设置，包括标题、作者、学院等：

| 命令名称 | 参数#1 | 参数#2 |
|---|---|---|
|\title{#1}{#2}| 中文标题 | 英语标题 |
|\author{#1}| 作者名 | 无 |
|\advisor{#1}| 导师名 | 无 |
|\protitle{#1}| 导师职称 | 无 |
|\school{#1}| 学院名 | 无|
|\major{#1}| 专业名| 无 |
|\studentnumber{#1}| 学号 | 无 |
|\degreecategories{#1}| 申请学位门类|无|
|\datereply{#1}| 论文答辩日期 | 无 |

如果想使用自己定义的封面，可以用`\bindpdfcover`命令添加已经做好的PDF格式的封面，如`\bindpdfcover{cover.pdf}`。

### 中英文摘要

中英文摘要应包含在`chineseabstract`和`englishabstract`环境中，对应的关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应的环境中。

## 写作工具
- 画表神器 https://www.tablesgenerator.com/
- 写公式神器 https://mathpix.com/
- 文献 bib 整理神器 https://dblp.uni-trier.de/
- Latex 画图画表常用命令 https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Tip
