import os
import re
import subprocess
import shutil
import argparse
from datetime import datetime

# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 设置默认 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
file_name = "main"
tex_name = "xelatex"
build_path = "./Build/"
# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
print('os.getcwd()')
# # 获取当前目录中所有以 .tex 结尾的文件列表
# files = [f for f in os.listdir() if f.endswith('.tex')]

# # 处理每个符合条件的文件名
# for file in files:
#     file_name += os.path.splitext(file)[0] + "\n"  # 使用 os.path.splitext 去掉后缀并添加到 file_name 中



# --------------------------------------------------------------------------------
# 定义编译 TeX 文件命令
# --------------------------------------------------------------------------------
def compile_tex(tex_times):
    print("\n\n" + "=" * 80+"\n"+
      "X" * 28 + f" 开始 {tex_times} 次 {tex_name} 编译 " + "X" * 28 + "\n" + 
      "=" * 80 + "\n\n")
    options = ["-shell-escape", "-file-line-error", "-halt-on-error", "--synctex=1"]

    if tex_name == 'xelatex':
        options.insert(3, "-no-pdf")

    if args.no_quiet:
        options.insert(3, "-interaction=nonstopmode")
    else:
        options.insert(0, "-interaction=batchmode")

    if args.pdflatex:
        tex_name == "pdflatex"
    if args.xelatex:
        tex_name == "xelatex"
    if args.lualatex:
        tex_name == "lualatex"

    subprocess.run([tex_name] + options + [f"{file_name}.tex"])

# --------------------------------------------------------------------------------
# 定义编译 bib 文件命令
# --------------------------------------------------------------------------------
def compile_bib():
    print("\n\n" + "=" * 80+"\n"+
        "X" * 33 + " 参考文献编译 " + "X" * 33 + "\n" + 
        "=" * 80 + "\n\n")

    with open(f"{file_name}.aux", 'r', encoding='utf-8') as aux_file:
        aux_content = aux_file.read()
    # Check if Biber is used
    if re.search(r'\\citation', aux_content) or re.search(r'\\abx@aux@cite', aux_content):
        bib_compile_tex_times = 2 # 参考文献需要额外编译的次数
        if re.search(r'\\abx@aux@refcontext', aux_content):
            if args.no_quiet:
                options = ['biber', file_name]
            else:
                options = ['biber', "-quiet", file_name]
            subprocess.run(options)
            bib_print = "biber 编译参考文献"
        # Check if BibTeX is used
        elif re.search(r'\\bibdata', aux_content):
            options = ['bibtex', file_name]
            subprocess.run(options)
            bib_print = "bibtex 编译参考文献"
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
        "X" * 33 + " 符号索引编译 " + "X" * 33 + "\n" + 
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
            catalogs_print = "含有图\表\章节目录"
        else:
            index_compile_tex_times = 0
            catalogs_print = "没有插入任何目录"

    print(catalogs_print)

    return index_compile_tex_times, catalogs_print

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
# 定义清除已有结果文件
# --------------------------------------------------------------------------------
def remove_result():
    if os.path.exists(build_path):
        # 删除整个文件夹
        shutil.rmtree(build_path)
        print("删除上次生成的结果文件")
    # 创建空的 build_path 文件夹
    os.mkdir(build_path)

# --------------------------------------------------------------------------------
# 定义移动生成文件
# --------------------------------------------------------------------------------
def move_result():
    result_files = [f"{file_name}{ext}" for ext in [".pdf", ".synctex.gz"]]
    for file in result_files:
        if os.path.exists(file):
            shutil.move(file, build_path)
    print(f"移动结果文件到 {build_path}")


# ================================================================================
# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 定义主函数 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# ================================================================================
def main():
    global file_name  # 声明 file_name 为全局变量
    # 判断 document 参数是否存在，如果存在则将该参数赋值于tex_name
    if args.document:
        file_name = args.document

    remove_aux() # 清除旧辅助文件
    compile_tex(1) # 首次编译 tex 文档
    bib_compile_return = compile_bib() # 编译参考文献
    index_compile_return = compile_index() # 编译索引

    # 额外编译 tex 文档
    extra_complie_times = max(bib_compile_return[0], index_compile_return[0])
    for time in range(extra_complie_times):
        time+=2
        compile_tex(time)

    # 将 xelatex 生成的 xdv 转换成 pdf
    if tex_name == "xelatex":
        print("\n\n" + "=" * 80+"\n"+
        "X" * 32 + " xdvipdfmx 编译 " + "X" * 32 + "\n" + 
        "=" * 80 + "\n\n")
        subprocess.run(["xdvipdfmx","-V","1.6" ,f"{file_name}"])


    print("\n\n" + "=" * 80+"\n"+
        "▓" * 33 + " 完成所有编译 " + "▓" * 33 + "\n" + 
        "=" * 80 + "\n")
    
    print(f"文档整体：{tex_name} 编译 {extra_complie_times+1} 次")
    print(f"参考文献：{bib_compile_return[1]}")
    print(f"目录索引：{index_compile_return[1]}")

    # 执行编译以外的附加命令
    print("\n" + "=" * 80+"\n"+
        "X" * 26 + " 开始执行编译以外的附加命令！" + "X" * 25 + "\n" + 
        "=" * 80 + "\n")
    remove_result() # 删除旧结果文件
    move_result() # 移动结果文件到 build_path
    remove_aux() # 清除辅助文件



# ================================================================================
# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 总运行程序 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# ================================================================================
if __name__ == "__main__":

    start_time = datetime.now() # 计算开始时间

    parser = argparse.ArgumentParser(description="LaTeX 辅助编译程序.")
    parser.add_argument('-v', '--version', action='version', version='%(prog)s 1.0')
    parser.add_argument('-c', '--clean', action='store_true', help="清除所有辅助文件")
    parser.add_argument('-C', '--Clean', action='store_true', help="清除所有辅助文件和 pdf 文件")
    parser.add_argument('-nq', '--no-quiet', action='store_true', help="非安静模式运行，此模式下显示编译过程")
    parser.add_argument('-p', '--pdflatex', action='store_true', help="pdflatex 进行编译")
    parser.add_argument('-x', '--xelatex', action='store_true', help="xelatex 进行编译")
    parser.add_argument('-l', '--lualatex', action='store_true', help="lualatex 进行编译")
    parser.add_argument('document', nargs='?', help="要被编译的文件名")
    args = parser.parse_args()

    if args.clean:
        remove_aux()
    elif args.Clean:
        remove_result()
    else:
        main()

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