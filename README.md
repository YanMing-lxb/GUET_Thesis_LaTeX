Guet_LATEX_Thesis_Template
---
此为桂林电子科技大学Latex硕博模板。该模板由机电C323 Li师兄主编，Liang师兄参与，参考UESTC模板和XDU模板，该模板符合桂林电子科技大学研究生学位论文的基本要求与书写格式-2022.2.23。


参考文献格式".bst"文件根据 GB/T 7714-2015 BibTeX Style 宏包配置参数进行自定义样式而来，符合桂林电子科技大学学位论文对参考文献格式的要求。
在修改参考文献格式的过程中，感谢GB/T 7714-2015 BibTeX Style项目的Zeping Lee大佬对我的帮助。
GB/T 7714-2015 BibTeX Style主页：https://github.com/zepinglee/gbt7714-bibtex-style

# Visual Code Studio 中使用该模板
1. Visual Code Studio 中安装LaTeX Workshop 插件；
2. 所需的配置设置请看[[Visual Code Studio 中LaTeX Workshop的设置说明]]

# 编译
使用latexmk编译前，需在系统盘下创建名为latexmk的文件夹，并将LatexMK文件放入该文件夹下。
编译时只需使用latexmk即可完成编译。

# 转word格式
请看[[转word命令]]，目前尚且存在转换后，图片不存在的问题（由于pandoc不支持读取多个文件夹图片的原因）。


# 样式参数
|    命令   |  功能  |
|:---------:|:------:|
|  eversion | 电子版 |
|  pversion | 打印版 |
|   master  |  学硕  |
| promaster |  专硕  |
|   doctor  |  博士  |

 latex教程 lshort-zh