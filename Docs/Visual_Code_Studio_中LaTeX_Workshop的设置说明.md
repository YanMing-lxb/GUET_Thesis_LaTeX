<!--
 *  =======================================================================
 *  ····Y88b···d88P················888b·····d888·d8b·······················
 *  ·····Y88b·d88P·················8888b···d8888·Y8P·······················
 *  ······Y88o88P··················88888b·d88888···························
 *  ·······Y888P··8888b···88888b···888Y88888P888·888·88888b·····d88b·······
 *  ········888······"88b·888·"88b·888·Y888P·888·888·888·"88b·d88P"88b·····
 *  ········888···d888888·888··888·888··Y8P··888·888·888··888·888··888·····
 *  ········888··888··888·888··888·888···"···888·888·888··888·Y88b·888·····
 *  ········888··"Y888888·888··888·888·······888·888·888··888··"Y88888·····
 *  ·······························································888·····
 *  ··························································Y8b·d88P·····
 *  ···························································"Y88P"······
 *  =======================================================================
 * 
 *  -----------------------------------------------------------------------
 * Author       : 焱铭
 * Date         : 2023-07-19 13:15:53 +0800
 * LastEditTime : 2023-07-20 21:58:42 +0800
 * Github       : https://github.com/YanMing-lxb/
 * FilePath     : \GUET_Thesis_LaTeX\Docs\Visual_Code_Studio_中LaTeX_Workshop的设置说明.md
 * Description  : 
 *  -----------------------------------------------------------------------
 -->

将下列代码复制到VSCode的settings.json里, 具体操作请百度。

# LaTex Workshop 配置
---
==使用该配置时请将以下几个代码框中的代码粘贴到 settings.json 的{}中。==

`编译工具和命令` 和 `编译链配置` 中的部分命令已注释，可根据需要自行解除注释。
推荐通过`XeLaTeXmk`、`PdfLaTeXmk`、`LuaLaTeXmk`这三个编译链使用LaTeXmk进行编译。

## 编译工具和命令
```
//------------------------------LaTeX 配置----------------------------------

  // 编译工具和命令
  "latex-workshop.latex.tools": [
    // {
    //   "name": "latexmk",
    //   "command": "latexmk",
    //   "args": [
    //     "%DOC%"
    //   ]
    // },
    {
      "name": "xelatexmk",
      "command": "latexmk",
      "args": [
        "-xelatex",
        "%DOC%"
      ]
    },
    {
      "name": "pdflatexmk",
      "command": "latexmk",
      "args": [
        "-pdflatex",
        "%DOC%"
      ]
    },
    {
      "name": "lualatexmk",
      "command": "latexmk",
      "args": [
        "-lualatex",
        "%DOC%"
      ]
    },
    // {
    //   "name": "xelatex",
    //   "command": "xelatex",
    //   "args": [
    //   "-synctex=1",
    //   "-interaction=nonstopmode",
    //   "-file-line-error",
    //   "%DOC%"
    //     ]
    // },          
    // {
    //   "name": "pdflatex",
    //   "command": "pdflatex",
    //   "args": [
    //   "-synctex=1",
    //   "-interaction=nonstopmode",
    //   "-file-line-error",
    //   "%DOC%"
    //   ]
    // },
    // {
    //   "name": "lualatex",
    //   "command": "lualatex",
    //   "args": [
    //   "-lualatex",
    //   "-dvi",
    //   "-synctex=1",
    //   "-interaction=nonstopmode",
    //   "-file-line-error",
    //   "%DOC%"
    //     ]
    // },   
    // {
    //   "name": "makeglossaries",
    //   "command": "makeglossaries",
    //   "args": [
    //   "%DOCFILE%"
    //   ]
    // },
    // {
    //   "name": "makeindex",
    //   "command": "makeindex",
    //   "args": [
    //   "%DOCFILE%.nlo",
    //   "-s",
    //   "nomencl.ist",
    //   "-o",
    //   "%DOCFILE%.nls"
    //   ]
    // },
    // {
    //   "name": "bibtex",
    //   "command": "bibtex",
    //   "args": [
    //   "%DOCFILE%"
    //   ]
    // },
    // {
    //   "name": "biber",
    //   "command": "biber -l zh__pinyin --output-safechars %O %S",
    //   "args": [
    //   "%DOCFILE%"
    //   ]
    // }
  ],
```

## 编译链配置
```
"latex-workshop.latex.recipes": [
    // {
    //   "name": "LaTeXmk",
    //   "tools": [
    //   "latexmk"
    //               ]
    // },
    {
      "name": "XeLaTeXmk",
      "tools": [
        "xelatexmk",
        // "-interaction=batchmode", // 批处理模式，会编译提速但不会报错
      ]
    },
    {
      "name": "PdfLaTeXmk",
      "tools": [
        "pdflatexmk",
      ]
    },
    {
      "name": "LuaLaTeXmk",
      "tools": [
        "lualatexmk",
      ]
    },
    // {
    //   "name": "LaTeXmk-DVIPDFMx",
    //   "tools": [
    //     "LaTeXmk-DVIPDFMx",
    //   ]
    // },
    // {
    //   "name": "upLaTeXmk-DVIPDFMx",
    //   "tools": [
    //     "upLaTeXmk-DVIPDFMx",
    //   ]
    // },

    
    // {
    //   "name": "xelatex",
    //   "tools": [
    //   "xelatex"
    //               ]
    //         },
    // {
    //   "name": "pdflatex",
    //   "tools": [
    //   "pdflatex"
    //               ]
    //         },
    // {
    //   "name": "lualatex",
    //   "tools": [
    //   "lualatex"
    //               ]
    // },
    // {
    //   "name": "bibtex",
    //   "tools": [
    //   "bibtex"
    //               ]
    // },
    // {
    //   "name": "biber",
    //   "tools": [
    //   "biber"
    //               ]
    // },
    // {
    //   "name": "X-bibtex-XX",
    //   "tools": [
    //   "xelatex",
    //   "bibtex",
    //   "xelatex",
    //   "xelatex"
    //               ]
    // },
    // {
    //     "name": "P-bibtex-PP",
    //     "tools": [
    //         "pdflatex",
    //         "bibtex",
    //         "pdflatex",
    //         "pdflatex"
    //     ]
    // },

  ],

```

## 配置文件清理
```
//文件清理。子文件夹中递归删除辅助文件
"latex-workshop.latex.clean.subfolder.enabled": true,

//文件清理。此属性必须是字符串数组 // "*.bbl",
"latex-workshop.latex.clean.fileTypes": [
    "*.aux",
    "*.bbl",
    "*.blg",
    "*.idx",
    "*.ind",
    "*.lof",
    "*.lot",
    "*.out",
    "*.toc",
    "*.acn",
    "*.acr",
    "*.alg",
    "*.glg",
    "*.glo",
    "*.gls",
    "*.ist",
    "*.fls",
    "*.log",
    "*.spl",
    "*.dtx",
    "*.nlo",
    "*.nls",
    "*.nlg",
    "*.ilg",
    "*.xdv",
    "*.glsdefs",
    "*.fdb_latexmk",
    "*.fdb_latexmk,",
    "*/*.aux",
    "*.ttt",
    "*.fff",
    "*.nav",
    "*.snm",
    "*.vrb",
],  
```

## 配置其他操作
```
    // 编译错误后是否尝试重新编译
    "latex-workshop.latex.autoBuild.cleanAndRetry.enabled": false,
    // 设置是否自动编译
    "latex-workshop.latex.autoBuild.run":"never",
    // 自动编译时间间隔
    // "latex-workshop.latex.autoBuild.interval": 1000,

    //右键菜单
    "latex-workshop.showContextMenu":false,
    //从使用的包中自动补全命令和环境
    "latex-workshop.intellisense.package.enabled": true,
    //编译出错时设置是否弹出气泡设置
    "latex-workshop.message.error.show": false,
    "latex-workshop.message.warning.show": false,
   
    //设置为onFaild 在构建失败后清除辅助文件
    "latex-workshop.latex.autoClean.run": "onBuilt", 
    // 使用上次的recipe编译组合
    "latex-workshop.latex.recipe.default": "lastUsed",
    // 用于反向同步的内部查看器的键绑定。ctrl/cmd +点击(默认)或双击
    "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click",
    // 用于实时预览图片
    "latex-workshop.hover.preview.enabled": true,
    // 实时显示引文信息
    "latex-workshop.hover.citation.enabled": true,
    // 实时显示参考信息
    "latex-workshop.hover.ref.enabled": true,
    // 实时显示命令所属文档
    "latex-workshop.hover.command.enabled": true,

    // 大纲隐藏题注
    // "latex-workshop.view.outline.floats.caption.enabled": false,
    // 大纲中隐藏label
    // "latex-workshop.view.outline.commands": [],
    // 大纲隐藏浮动体数字序号
    // "latex-workshop.view.outline.floats.number.enabled": false,
    // 大纲隐藏浮动体
    // "latex-workshop.view.outline.floats.enabled": false,
```

## 配置 SumatraPDF
```
//使用 SumatraPDF 预览编译好的PDF文件
    // 使用外部查看器时要执行的命令。此功能不受官方支持。
    "latex-workshop.view.pdf.external.viewer.command": "D:/Application/SumatraPDF/SumatraPDF.exe", // 注意修改路径
    // 使用外部查看器时，latex-workshop.view.pdf.external.view .command的参数。此功能不受官方支持。%PDF%是用于生成PDF文件的绝对路径的占位符。
    "latex-workshop.view.pdf.external.viewer.args": [
      "-forward-search",
      "%TEX%",
      "%LINE%",
      "-reuse-instance",
      "-inverse-search",
      "D:/Application/Microsoft VS Code/Code.exe -r -g \"%f\":%l",
      "%PDF%"
    ],
    // 将synctex转发到外部查看器时要执行的命令。此功能不受官方支持。
    "latex-workshop.view.pdf.external.synctex.command": "D:/Application/SumatraPDF/SumatraPDF.exe", // 注意修改路径
    // latex-workshop.view.pdf.external.synctex的参数。当同步到外部查看器时。%LINE%是行号，%PDF%是生成PDF文件的绝对路径的占位符，%TEX%是触发syncTeX的扩展名为.tex的LaTeX文件路径。
    "latex-workshop.view.pdf.external.synctex.args": [
        "-forward-search",
        "%TEX%",
        "%LINE%",
        "-reuse-instance",
        "-inverse-search",
        "\"D:/Application/Microsoft VS Code/Code.exe\" \"D:/Application/Microsoft VS Code/resources/app/out/cli.js\" --ms-enable-electron-run-as-node -r -g \"%f:%l\"", // 注意修改路径
        "%PDF%"
    ],
    "workbench.colorTheme": "Monokai",
    "explorer.confirmDelete": false,
    "files.autoGuessEncoding": true,
    "markdown-preview-enhanced.previewTheme": "atom-light.css",

```

# 中英文字符统计
---
可采用VSCode中的Word Count CJK插件进行中英文字符统计。
具体配置内容如下：
```
//------------------------------Word Count CJK 配置----------------------------------
  "wordcount_cjk.activateLanguages": ["markdown", "plaintext", "latex"],
  "wordcount_cjk.statusBarTextTemplate": "中文：${cjk} 字 + 英文：${en_words} 词",
  "wordcount_cjk.statusBarTooltipTemplate": "中文字数：${cjk} \\n 非 ASCII 字符数：\\t${total - ascii} \\n 英文单词数：${en_words} \\n 非空白字符数：${total - whitespace} \\n 总字符数：${total}",
  "mdtableeditor.commandViews": {
    "toolbar": [
      "MdTableEditor.fillCells",
      "MdTableEditor.changeAlignRight",
      "MdTableEditor.changeAlignCenter",
      "MdTableEditor.changeAlignLeft",
      "MdTableEditor.insertTop",
      "MdTableEditor.insertBottom",
      "MdTableEditor.insertLeft",
      "MdTableEditor.insertRight",
      "MdTableEditor.removeColumn",
      "MdTableEditor.removeRow",
      "MdTableEditor.moveTop",
      "MdTableEditor.moveBottom",
      "MdTableEditor.moveLeft",
      "MdTableEditor.moveRight",
      "MdTableEditor.columnSelectEmpty",
      "MdTableEditor.sortNumberAsc",
      "MdTableEditor.sortNumberDesc",
      "MdTableEditor.sortTextAsc.ignore",
      "MdTableEditor.sortTextDesc.ignore"
    ],
    "context": [
      "MdTableEditor.columnSelectEmpty",
      "MdTableEditor.fillCells",
      "MdTableEditor.insertBottom",
      "MdTableEditor.insertLeft",
      "MdTableEditor.insertRight",
      "MdTableEditor.insertTop",
      "MdTableEditor.removeColumn",
      "MdTableEditor.removeRow",
      "MdTableEditor.sortNumberAsc",
      "MdTableEditor.sortNumberDesc",
      "MdTableEditor.sortTextAsc.ignore",
      "MdTableEditor.sortTextDesc.ignore"
    ]
  },
  ```
