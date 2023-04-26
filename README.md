# GUET-LATEX-Thesis-Template-桂林电子科技大学毕业论文模板
---
此为桂林电子科技大学Latex硕博模板。该模板由机电C323 Li师兄主编，Liang师兄参与，参考UESTC模板和XDU模板，该模板符合桂林电子科技大学研究生学位论文的基本要求与书写格式-2022.2.23。


参考文献格式".bst"文件根据 GB/T 7714-2015 BibTeX Style 宏包配置参数进行自定义样式而来，符合桂林电子科技大学学位论文对参考文献格式的要求。
在修改参考文献格式的过程中，感谢GB/T 7714-2015 BibTeX Style项目的Zeping Lee大佬对我的帮助。

GB/T 7714-2015 BibTeX Style主页：https://github.com/zepinglee/gbt7714-bibtex-style

## 使用方法
### 基本环境
使用模板需要系统安装任意一种TeX环境，如TeXLive、MacTeX和MiKTeX（都自动带有XeLaTeX引擎，但是不推荐CTeX），安装有 SimSun 和 SimHei 字体（其实就是宋体和黑体）以及 Times New Roman 英文字体。

#### 样式参数
|    命令   |  功能  |
|:---------:|:------:|
|  eversion | 电子版 |
|  pversion | 打印版 |
|   master  |  学硕  |
| promaster |  专硕  |
|   doctor  |  博士  |


### latexmk编译
编译文档请使用XeLaTeX引擎。模版提供latexmk设置文件用于自动编译。latexmk可自动调用相关程序进行编译，处理各种文件依赖并自动预览。可在终端执行latexmk -c命令清理所有缓存文件。
使用latexmk编译前，需在系统盘下创建名为latexmk的文件夹，并将LatexMK文件放入该文件夹下。请勿删掉latexmkrc文件。
**<font color="#d83931">注意</font>**：如果在Windows平台下使用MiKTeX还需要安装[Perl语言解释器](http://strawberryperl.com/)，方可使用latexmk进行编译。
编译时只需使用latexmk即可完成编译。

### 编辑器
推荐使用 Visual Code Studio 编辑器。
1. Visual Code Studio 中安装LaTeX Workshop 插件；
2. 所需的配置设置请看[[Visual_Code_Studio_中LaTeX_Workshop的设置说明]]

### 转word格式
请看[[转word命令]]，目前尚且存在转换后，图片不存在的问题（由于pandoc不支持读取多个文件夹图片的原因）。

## 写作指南
### 论文封面
论文封面和扉页由\makecover命令添加，可以显示论文题目，作者，指导老师等，也可使用`\bindpdfcover{cover.pdf}`命令添加封面.独创性声明可以由\originalitydeclaration命令生成，添加扫描版签名后的声明使用`\signatureofdeclaration{signature.pdf}`命令。

封面显示的信息可以使用一系列命令进行设置，包括标题、作者、学院等：

| 命令名称 | 参数#1 | 参数#2 |
|---|---|---|
|\title{#1}{#2}| 中文标题 | 英语标题 |
|\author{#1}| 作者名 | 无 |
|\advisor{#1}| 导师名 | 无 |
|\school{#1}| 学院名 | 无|
|\major{#1}| 专业名| 无 |
|\studentnumber{#1}| 学号 | 无 |
|\degreecategories{#1}| 申请学位门类|无|
|\datereply{#1}| 论文答辩日期 | 无 |

如果想使用自己定义的封面，可以用`\bindpdfcover`命令添加已经做好的PDF格式的封面，如`\bindpdfcover{cover.pdf}`。

### 中英文摘要

中英文摘要应包含在`chineseabstract`和`englishabstract`环境中，对应的关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应的环境中。

