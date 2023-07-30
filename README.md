# GUET_Thesis_LaTeX(GTL) 桂林电子科技大学毕业论文模板 <img src="https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/assets/113030089/ae350b84-8731-4bb9-be30-0f40a4e56bec" width="90" height="90" align="right">

[![](https://img.shields.io/badge/license-LPPL-blue)](https://www.latex-project.org/lppl/) [![](https://img.shields.io/github/last-commit/GUET-TeX-Users-Group/GUET_Thesis_LaTeX)](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/zipball/master) [![](https://img.shields.io/github/issues/GUET-TeX-Users-Group/GUET_Thesis_LaTeX)](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/issues)  ![Downloads latest release](https://img.shields.io/github/downloads/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/latest/total?color=blueviolet)

## 欢迎使用桂林电子科技大学毕业论文模板

***点个⭐支持一下！***

此项目提供用于排版桂林电子科技大学本硕博毕业论文的 $\LaTeX$ 模板类，旨在帮助桂林电子科技大学的毕业生高效地完成毕业论文的写作。该模板由机电 C323 李雪斌发起，参考电子科大王稳师兄所编写的[ThesisUESTC-电子科技大学毕业论文模板](https://github.com/bdebye/thesisuestc)。参考文献格式".bst"文件根据 GB/T 7714-2015 BibTeX Style 宏包配置参数进行自定义样式而来，符合桂林电子科技大学学位论文对参考文献格式的要求。在修改参考文献格式的过程中，感谢[GB/T 7714-2015 BibTeX Style 项目](https://github.com/zepinglee/gbt7714-bibtex-style)的 Zeping Lee 大佬对我的帮助。

*该模板符合桂林电子科技大学研究生学位论文的基本要求与书写格式-2022.02.23。*

希望该项目能够继续发展，解决各位同学毕业论文写作中的困难。

## 当前状态

**本科毕业论文格式大部分功能已调整完，但细节有待完善，欢迎各位同学参与该项目！**

> PS：目前已调整 cls 样式文件的代码，可以使用`\ifbachelor{}{}`命令修改本科样式。

## 待完善功能
- [x] 封面目录的单双行切换（使用Tabularray宏包解决，但在标题中需要添加`\\&`命令进行换行）；
- [ ] 盲审版本切换：
  - [ ] 盲审封面制作及版本切换；
  - [ ] 攻读学位期间取得成果的盲审版本切换。
- 去除所有其他表格宏包，完全使用Tabularray宏包制表
  - [ ] 自定义长三线表环境`lthreetab`(要求可跨页，跨页后自带 “题注(续)” )
  - [x] 自定义普通三线表环境`threetab`
- [ ] 使用文学编程重构项目



## 获取模板

### 下载模板

普通用户可以直接 `clone` 或者下载最新发行版 [GUET_Thesis_LaTeX.zip](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/archive/refs/heads/main.zip)。

```
git clone https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX.git
```

### 项目地址

考虑到网络问题，国内下载可用Gitee项目镜像。

[Gitee项目地址](https://gitee.com/metaljack666/GUET_Thesis_LaTeX)

[Github项目地址](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX)

模版更新频繁，且只维护最新版。如有问题，可以先尝试升级模版，而后进行反馈。

### 相关项目
桂林电子科技大学 Beamer 模板：[GUET Beamer Theme](https://github.com/GUET-TeX-Users-Group/GUET_Beamer)



## 使用方法

### Overleaf 在线写作

点击[🔗链接](https://www.overleaf.com/latex/templates/gui-lin-dian-zi-ke-ji-da-xue-ben-shuo-bo-fei-quan-zai-zhi-bi-ye-lun-wen-she-ji-latexmo-ban-v0-dot-7/vjvvkwmdnjhp)即可直接使用。

**<font color="#d83931">注意</font>**：==在线写作平台默认使用 pdflatex 编译，您需要设置使用 XeLaTeX 编译器==。

### TeXPage 在线写作

点击[🔗链接](https://www.texpage.com/template/2f15a24f-20f7-4c04-8a4c-d0aacee0c818)即可直接使用。

**<font color="#d83931">注意</font>**：==在线写作平台默认使用 pdflatex 编译，您需要设置使用 XeLaTeX 编译器==。

### 本地部署写作

1. 编译该模板请使用 XeLaTeX 引擎。

2. 本地部署LaTeX环境请转到[YM VSCode Configurations for LaTeX](https://github.com/YanMing-lxb/YM-VSCode-Configurations-for-LaTeX)项目


## 模板说明

### 样式参数

|   命令    |   功能   |
| :-------: | :------: |
| eversion  |  电子版  |
| pversion  |  打印版  |
| bachelor  |   本科   |
|  master   |   学硕   |
| promaster |   专硕   |
|  doctor   |   博士   |
| ojmaster  | 在职硕士 |
| ptomaster | 非全专硕 |

> 根据学校要求打印版硕士学位论文封面桂电 logo 为黑色(其他的硕博的打印版桂电 logo 也都顺便设置成黑色的)，对与其他几种封面的相关要求可以在[**issues**](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/issues)中提出并补充。

### 注意事项

- 标题中`\texorpdfstring` 命令包装数学公式，并提供一个无公式的备选项，如：`\section{\texorpdfstring{$E=mc^2$}{E=mc2}} ` 否则会有警告；
- 在具有多个子图的情况时，子图与子图之间要留有一定的空间，不要占满，否则会发生自动换行；
- 子图请用`\subfloat[<子题注>]{\includegraphics[width=0.45\linewidth]{<图片文件名>}}}`命令加入；
- 使用`\caption[]{}`命令时，如果不需要设置缩写目录的内容，一定要删掉`[]`，否则插图插表索引将不会显示该图\表的目录；
- 表、图、公式、算法、章节、节的引用请用`\cref{<label>}`命令。

### 表格制作

推荐使用tabularray 宏包进行表格的制作，模板中已自定义三线表环境`threetab`，示例如下所示。
作者暂无精力完成长表环境格式自定义，有待完善。

```tex
\begin{table}
  \centering
  \caption{三线表示例(tabularray自定义宏包)}
  \begin{threetab}{cc}
    表头1  & 表头2 \\
    内容1  & 内容2 \\
    内容3  & 内容4 \\
  \end{threetab}
\end{table}
```

Tabularray表格排版宏包使用手册中文翻译: [https://gitee.com/nwafu_nan/tabularray-doc-zh-cn](https://gitee.com/nwafu_nan/tabularray-doc-zh-cn)

### 论文封面

论文封面和扉页由`\makecover`命令添加，可以显示论文题目，作者，指导老师等，也可使用`\bindpdfcover{cover.pdf}`命令添加封面.独创性声明可以由`\originalitydeclaration`命令生成，添加扫描版签名后的声明使用`\signatureofdeclaration{signature.pdf}`命令。

封面显示的信息可以使用一系列命令进行设置，包括标题、作者、学院等：

| 命令名称              | 参数#1       | 参数#2   |
| --------------------- | ------------ | -------- |
| \title{#1}{#2}        | 中文标题     | 英语标题 |
| \author{#1}           | 作者名       | 无       |
| \advisor{#1}          | 导师名       | 无       |
| \protitle{#1}         | 导师职称     | 无       |
| \school{#1}           | 学院名       | 无       |
| \major{#1}            | 专业名       | 无       |
| \studentnumber{#1}    | 学号         | 无       |
| \degreecategories{#1} | 申请学位门类 | 无       |
| \datereply{#1}        | 论文答辩日期 | 无       |

如果想使用自己定义的封面，可以用`\bindpdfcover`命令添加已经做好的 PDF 格式的封面，如`\bindpdfcover{cover.pdf}`。

### 中英文摘要

中英文摘要应包含在`chineseabstract`和`englishabstract`环境中，对应的关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应的环境中。

## 写作工具

- 画表神器 https://www.tablesgenerator.com/
- $\LaTeX$公式手册 https://www.cnblogs.com/1024th/p/11623258.html
- 识别公式神器 https://mathpix.com/
- $LaTeX$公式编辑器 https://www.latexlive.com/home
- 文献 bib 整理神器 https://dblp.uni-trier.de/
- $\LaTeX$画图画表常用命令 https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Tip

## 反馈与贡献


### 反馈问题
如果在使用上有任何问题，建议通过以下方式进行反馈（按推荐顺序排序）：

- 如遇不会使用、编译错误等问题，请至 [**在 GitHub 项目讨论区提问**](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/discussions) (推荐)
- 如遇模版 BUG，或有新的需求，请至  [**在 GitHub 项目中提issues**](https://github.com/GUET-TeX-Users-Group/GUET_Thesis_LaTeX/issues)

### 成为贡献者
这个仓库是面向用户的示例模版，如果你有很好的排版示例，可以提交到此仓库与大家分享。

除了提交 Pull Request 之外，还有以下方式可以进行贡献：

- 帮助我们解答同学们的问题，这些问题你也可能遇到过并且知道如何解决；
- 与我们一起维护项目的 Wiki 文档，Wiki 任何人都可以直接编辑；
- 向周围同学安利 GUET_Thesis_LaTeX(GTL)，让更多的同学使用我们维护的模板；
- 在我们的讨论组中分享你的使用体验，以及吐槽。如果你也想成为项目的长期维护者，也可以通过讨论组告诉我们。:-)

## 软件许可证
桂林电子科技大学校徽图片的版权归桂林电子科技大学所有。

其他部分使用 [LPPL](https://www.latex-project.org/lppl/) 授权。
