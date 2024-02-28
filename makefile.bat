@echo off

REM 拼接参数为一个字符串
set "args=%~1"
:loop
shift
if "%~1"=="" goto :continue
set "args=%args% %1"
goto :loop
:continue

REM 运行 makefile
python ./pytexmk.py %args%

@REM 示例：makefile 使用默认参数运行，makefile -p -nq main' 使用 pdflatex 非安静模式编译 