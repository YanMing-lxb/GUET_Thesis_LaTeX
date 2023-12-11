'''
 =======================================================================
 ····Y88b···d88P················888b·····d888·d8b·······················
 ·····Y88b·d88P·················8888b···d8888·Y8P·······················
 ······Y88o88P··················88888b·d88888···························
 ·······Y888P··8888b···88888b···888Y88888P888·888·88888b·····d88b·······
 ········888······"88b·888·"88b·888·Y888P·888·888·888·"88b·d88P"88b·····
 ········888···d888888·888··888·888··Y8P··888·888·888··888·888··888·····
 ········888··888··888·888··888·888···"···888·888·888··888·Y88b·888·····
 ········888··"Y888888·888··888·888·······888·888·888··888··"Y88888·····
 ·······························································888·····
 ··························································Y8b·d88P·····
 ···························································"Y88P"······
 =======================================================================

 -----------------------------------------------------------------------
Author       : 焱铭
Date         : 2023-12-11 14:02:31 +0800
LastEditTime : 2023-12-11 15:19:49 +0800
Github       : https://github.com/YanMing-lxb/
FilePath     : /GUET_Thesis_LaTeX/makefile.py
Description  : 
 -----------------------------------------------------------------------
'''

import os
import re
import subprocess
import shutil
from datetime import datetime

# 基本设置
file_name = "main"
tex_name = "xelatex"
build_path = "./Build/"

# 计算开始时间
start_time = datetime.now()

# 定义清除辅助文件命令
def remove_aux():
    auxiliary_files = [
        f"{file_name}{ext}" for ext in [".pdf", ".synctex", ".aux", ".bbl", ".blg", ".log", ".out", ".toc", ".bcf", ".xml", ".synctex",
                                        ".nlo", ".nls", ".bak", ".ind", ".idx", ".ilg", ".lof", ".lot", ".ent-x", ".tmp", ".ltx", ".los",
                                        ".lol", ".loc", ".listing", ".gz", ".userbak", ".nav", ".snm", ".vrb", ".fls", ".xdv", ".fdb_latexmk"]
    ]
    for file in auxiliary_files:
        try:
            os.remove(file)
        except FileNotFoundError:
            pass
    print("已清除辅助文件")

# 定义编译 TeX 文件命令
def compile_tex(pdf=True):
    options = ["-shell-escape", "-file-line-error", "-halt-on-error", "-interaction=batchmode", "--synctex=-1"]
    if not pdf:
        options.insert(0, "-no-pdf")
    subprocess.run([tex_name] + options + [f"{file_name}.tex"])

# 清除辅助文件
remove_aux()

# 开始一次编译
print("\n\n" + "=" * 80+"\n"+
      "X" * 28 + f" 开始一次 {tex_name} 编译 " + "X" * 28 + "\n" + 
      "=" * 80 + "\n\n")
compile_tex(False)

# 开始文献编译
print("\n\n" + "=" * 80+"\n"+
      "X" * 33 + " 开始文献编译 " + "X" * 33 + "\n" + 
      "=" * 80 + "\n\n")

def bib_judge(file_path):
    bib_print = "文档没有参考文献"
    with open(file_path, 'r', encoding='utf-8') as aux_file:
        aux_content = aux_file.read()
    # Check if Biber is used
    if re.search(r'\\abx@aux@refcontext', aux_content):
        bib_name = 'biber'
        subprocess.run([bib_name, file_name])
        bib_print = f"采用 {bib_name} 编译参考文献"
    # Check if BibTeX is used
    if re.search(r'\\bibdata', aux_content):
        bib_name = 'bibteX'
        subprocess.run([bib_name, file_name])
        bib_print = f"采用 {bib_name} 编译参考文献"
    return bib_print
bib_print = bib_judge(f"{file_name}.aux")


# 开始目录编译
print("\n\n" + "=" * 80+"\n"+
      "X" * 33 + " 开始目录编译 " + "X" * 33 + "\n" + 
      "=" * 80 + "\n\n")
catalogs = "没有插入任何索引"
if os.path.exists(f"{file_name}.glo"):
    subprocess.run(["makeindex", "-s", f"{file_name}.ist", "-o", f"{file_name}.gls", f"{file_name}.glo"])
    catalogs = "采用 glossaries 宏包生成符号说明表"
elif os.path.exists(f"{file_name}.nlo"):
    subprocess.run(["makeindex", "-s", "nomencl.ist", "-o", f"{file_name}.nls", f"{file_name}.nlo"])
    catalogs = "采用 nomencl 宏包生成符号说明表"
elif os.path.exists(f"{file_name}.xdv"):
    subprocess.run(["makeindex", f"{file_name}.xdv"])
    catalogs = "有目录 没符号说明表"
else:
    catalogs = "没有插入任何索引"

# 二次编译
print("\n\n" + "=" * 80+"\n"+
      "X" * 28 + f" 开始二次 {tex_name} 编译 " + "X" * 28 + "\n" + 
      "=" * 80 + "\n\n")
compile_tex(False)

# 三次编译
print("\n\n" + "=" * 80+"\n"+
      "X" * 28 + f" 开始三次 {tex_name} 编译 " + "X" * 28 + "\n" + 
      "=" * 80 + "\n\n")
compile_tex(True)

# 完成所有编译
print("\n\n" + "=" * 80+"\n"+
      "▓" * 33 + " 完成所有编译 " + "▓" * 33 + "\n" + 
      "=" * 80 + "\n")
print(f"文档整体：{tex_name} 编译")
print(f"参考文献：{bib_print}")
print(f"目录索引：{catalogs}")

# 执行编译以外的附加命令
print("\n" + "=" * 80+"\n"+
      "X" * 26 + " 开始执行编译以外的附加命令！" + "X" * 25 + "\n" + 
      "=" * 80 + "\n")

# 清除已有结果文件
if os.path.exists(build_path):
    # 删除整个文件夹
    shutil.rmtree(build_path)
    print("删除上次生成的结果文件")
    
# 创建空的 build_path 文件夹
os.mkdir(build_path)

# 移动生成文件
result_files = [f"{file_name}{ext}" for ext in [".pdf", ".synctex"]]
for file in result_files:
    if os.path.exists(file):
        shutil.move(file, build_path)
print("移动结果文件到 Build 文件夹")

# 清除辅助文件
remove_aux()

# 统计编译时长
print("\n" + "=" * 80)
end_time = datetime.now()
run_time = end_time - start_time
hours, remainder = divmod(run_time.seconds, 3600)
minutes, seconds = divmod(remainder, 60)
print(f"编译时长为：{hours} 小时 {minutes} 分 {seconds} 秒 ({run_time.seconds} s total)\n")