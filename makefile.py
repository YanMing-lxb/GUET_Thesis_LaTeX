import os
import re
import subprocess
import shutil
from datetime import datetime

# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 基本设置 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
file_name = "main"
tex_name = "xelatex"
build_path = "./Build/"
# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

# 计算开始时间
start_time = datetime.now()


# # 获取当前目录中所有以 .tex 结尾的文件列表
# files = [f for f in os.listdir() if f.endswith('.tex')]

# # 处理每个符合条件的文件名
# for file in files:
#     file_name += os.path.splitext(file)[0] + "\n"  # 使用 os.path.splitext 去掉后缀并添加到 file_name 中

# --------------------------------------------------------------------------------
# 定义清除辅助文件命令
# --------------------------------------------------------------------------------
def remove_aux():
    auxiliary_files = [
        f"{file_name}{ext}" for ext in [".pdf", ".synctex", ".aux", ".bbl", ".blg", ".log", ".out", ".toc", ".bcf", ".xml", ".synctex", ".nlo", ".nls", ".bak", ".ind", ".idx", ".ilg", ".lof", ".lot", ".ent-x", ".tmp", ".ltx", ".los", ".lol", ".loc", ".listing", ".gz", ".userbak", ".nav", ".snm", ".vrb", ".fls", ".xdv", ".fdb_latexmk", ".run.xml"]
    ]
    for file in auxiliary_files:
        try:
            os.remove(file)
        except FileNotFoundError:
            pass
    print("已清除辅助文件")

# --------------------------------------------------------------------------------
# 定义编译 TeX 文件命令
# --------------------------------------------------------------------------------
def compile_tex(tex_times):
    print("\n\n" + "=" * 80+"\n"+
      "X" * 28 + f" 开始 {tex_times} 次 {tex_name} 编译 " + "X" * 28 + "\n" + 
      "=" * 80 + "\n\n")
    options = ["-shell-escape", "-file-line-error", "-halt-on-error", "-interaction=batchmode", "--synctex=1"]
    if tex_name == "xelatex":
        options.insert(0, "-no-pdf")
    subprocess.run([tex_name] + options + [f"{file_name}.tex"])

# --------------------------------------------------------------------------------
# 定义编译 bib 文件命令
# --------------------------------------------------------------------------------
def compile_bib():
    print("\n\n" + "=" * 80+"\n"+
        "X" * 33 + " 开始文献编译 " + "X" * 33 + "\n" + 
        "=" * 80 + "\n\n")

    with open(f"{file_name}.aux", 'r', encoding='utf-8') as aux_file:
        aux_content = aux_file.read()
    # Check if Biber is used
    if re.search(r'\\citation', aux_content) or re.search(r'\\abx@aux@cite', aux_content):
        bib_compile_tex_times = 2 # 参考文献需要额外编译的次数
        if re.search(r'\\abx@aux@refcontext', aux_content):
            bib_name = 'biber'
            subprocess.run([bib_name, "-quiet", file_name])
            bib_print = f"{bib_name} 编译参考文献"
        # Check if BibTeX is used
        elif re.search(r'\\bibdata', aux_content):
            bib_name = 'bibtex'
            subprocess.run([bib_name, file_name])
            bib_print = f"{bib_name} 编译参考文献"
    else:
        bib_compile_tex_times = 0
        bib_print = "文档没有参考文献或编译工具不属于 bibtex 或 biber "
    print(bib_print)

    return bib_compile_tex_times, bib_print

# --------------------------------------------------------------------------------
# 定义编译 index 文件命令
# --------------------------------------------------------------------------------
def compile_index():
    print("\n\n" + "=" * 80+"\n"+
        "X" * 33 + " 开始索引编译 " + "X" * 33 + "\n" + 
        "=" * 80 + "\n\n")

    if os.path.exists(f"{file_name}.glo"):
        with open(f"{file_name}.glo", "r") as f:
            content = f.read()
        if content.strip():  # Check if content is not empty
            subprocess.run(["makeindex", "-s", f"{file_name}.ist", "-o", f"{file_name}.gls", f"{file_name}.glo"])
            index_compile_tex_times = 1 # 目录和符号索引需要额外编译的次数
            catalogs_print = "glossaries 宏包生成符号索引"
        else:
            index_compile_tex_times = 0
            catalogs_print = "glossaries 宏包没有进行索引"

    elif os.path.exists(f"{file_name}.nlo"):
        with open(f"{file_name}.nlo", "r") as f:
            content = f.read()
        if content.strip():  # Check if content is not empty
            subprocess.run(["makeindex", "-s", "nomencl.ist", "-o", f"{file_name}.nls", f"{file_name}.nlo"])
            index_compile_tex_times = 1
            catalogs_print = "nomencl 宏包生成符号索引"
        else:
            index_compile_tex_times = 0
            catalogs_print = "nomencl 宏包没有进行索引"      
    else:
        if os.path.exists(f"{file_name}.toc"):
            index_compile_tex_times = 1 # 目录需要额外编译 1 次
        catalogs_print = "没有符号索引或使用 glossaries 或 nomencl 插入符号索引"

    print(catalogs_print)

    return index_compile_tex_times, catalogs_print



def post():
    # --------------------------------------------------------------------------------
    # 执行编译以外的附加命令
    # --------------------------------------------------------------------------------
    print("\n" + "=" * 80+"\n"+
        "X" * 26 + " 开始执行编译以外的附加命令！" + "X" * 25 + "\n" + 
        "=" * 80 + "\n")
    # --------------------------------------------------------------------------------
    # 清除已有结果文件
    # --------------------------------------------------------------------------------
    if os.path.exists(build_path):
        # 删除整个文件夹
        shutil.rmtree(build_path)
        print("删除上次生成的结果文件")
    # 创建空的 build_path 文件夹
    os.mkdir(build_path)


    # --------------------------------------------------------------------------------
    # 移动生成文件
    # --------------------------------------------------------------------------------
    result_files = [f"{file_name}{ext}" for ext in [".pdf", ".synctex.gz"]]
    for file in result_files:
        if os.path.exists(file):
            shutil.move(file, build_path)
    print("移动结果文件到 Build 文件夹")


# --------------------------------------------------------------------------------
# 清除辅助文件
# --------------------------------------------------------------------------------
remove_aux()

# --------------------------------------------------------------------------------
# 编译 tex 文档
# --------------------------------------------------------------------------------
compile_tex(1)

# --------------------------------------------------------------------------------
# 编译参考文献
# --------------------------------------------------------------------------------
bib_compile_return = compile_bib()

# --------------------------------------------------------------------------------
# 编译索引
# --------------------------------------------------------------------------------
index_compile_return = compile_index()

# --------------------------------------------------------------------------------
# 编译 tex 文档
# --------------------------------------------------------------------------------
extra_complie_times = max(bib_compile_return[0], index_compile_return[0])
for times in range(extra_complie_times):
    times+=2
    compile_tex(times)

if tex_name == "xelatex":
    print("\n\n" + "=" * 80+"\n"+
    "X" * 33 + " 开始生成 pdf " + "X" * 33 + "\n" + 
    "=" * 80 + "\n\n")
    subprocess.run(["xdvipdfmx","-V","1.6" ,f"{file_name}"])


print("\n\n" + "=" * 80+"\n"+
      "▓" * 33 + " 完成所有编译 " + "▓" * 33 + "\n" + 
      "=" * 80 + "\n")
print(f"文档整体：{tex_name} 编译 {extra_complie_times+1} 次")
print(f"参考文献：{bib_compile_return[1]}")
print(f"目录索引：{index_compile_return[1]}")


post()


# --------------------------------------------------------------------------------
# 清除辅助文件
# --------------------------------------------------------------------------------
remove_aux()


# --------------------------------------------------------------------------------
# 统计编译时长
# --------------------------------------------------------------------------------
print("\n" + "=" * 80)
end_time = datetime.now()
run_time = end_time - start_time
hours, remainder = divmod(run_time.seconds, 3600)
minutes, seconds = divmod(remainder, 60)
milliseconds = run_time.microseconds // 1000  # 获取毫秒部分

print(f"编译时长为：{hours} 小时 {minutes} 分 {seconds} 秒 {milliseconds} 毫秒 ({run_time.total_seconds():.3f} s total)\n")