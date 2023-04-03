Guet_LATEX_Thesis_Template
此为桂林电子科技大学Latex硕博模板，目前暂时只更新硕士部分。该模板由机电C323 Li师兄主编，Liang师兄参与，参考UESTC模板和XDU模板

# Visual Code Studio 中使用该模板
1. Visual Code Studio 中安装LaTeX Workshop 插件；
2. 所需的配置设置请看[[Visual Code Studio 中LaTeX Workshop的设置说明]]

# 编译
使用latexmk编译前，需在系统盘下创建名为latexmk的文件夹，并将LatexMK文件放入该文件夹下。
编译时只需使用latexmk即可完成编译。

# 转word格式
请看[[转word命令]]，目前尚且存在转换后，图片不存在的问题（由于pandoc不支持读取多个文件夹图片的原因）。


#问题解决方案。
目录之前的罗马字母页码显示不全。计数器故障
初步怀疑是因加入奇偶数判断后出现异常。
目前解决方案：在插图索引一栏将计数器进行减一操作
