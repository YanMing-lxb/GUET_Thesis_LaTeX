将下列代码复制到VSCode的settings.json里, 具体操作请百度。

# LaTex Workshop 配置
---
## 编译工具和命令
```
//------------------------------LaTeX 配置----------------------------------
  // 编译工具和命令 
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": [
        "-shell-escape",
        "%DOCFILE%"
      ]
    },
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "%DOC%"
        ]
    },          
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "%DOC%"
      ]
    },
    {
      "name": "lualatex",
      "command": "lualatex",
      "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "%DOC%"
        ]
    },   
    {
      "name": "makeglossaries",
      "command": "makeglossaries",
      "args": [
      "%DOCFILE%"
      ]
    },
    {
      "name": "makeindex",
      "command": "makeindex",
      "args": [
      "%DOCFILE%.nlo",
      "-s",
      "nomencl.ist",
      "-o",
      "%DOCFILE%.nls"
      ]
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": [
      "%DOCFILE%"
      ]
    },
    {
      "name": "biber",
      "command": "biber -l zh__pinyin --output-safechars %O %S",
      "args": [
      "%DOCFILE%"
      ]
    }
  ],
```

## 编译链配置
```
  // 编译链配置
"latex-workshop.latex.recipes": [
    {
      "name": "latexmk",
      "tools": [
      "latexmk"
                  ]
    },
    {
      "name": "xelatex",
      "tools": [
      "xelatex"
                  ]
            },
    {
      "name": "pdflatex",
      "tools": [
      "pdflatex"
                  ]
            },
    {
      "name": "lualatex",
      "tools": [
      "lualatex"
                  ]
    },
    {
      "name": "bibtex",
      "tools": [
      "bibtex"
                  ]
    },
    {
      "name": "biber",
      "tools": [
      "biber"
                  ]
    },
    {
      "name": "X-bibtex-XX",
      "tools": [
      "xelatex",
      "bibtex",
      "xelatex",
      "xelatex"
                  ]
    },
    {
        "name": "P-bibtex-PP",
        "tools": [
            "pdflatex",
            "bibtex",
            "pdflatex",
            "pdflatex"
        ]
    },

  ],

```

## 配置文件清理
```
  //文件清理：此属性必须是字符串数组 // "*.bbl",
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
    
],
```

## 配置其他操作
```
  // 配置其他操作
    // 编译错误后是否尝试重新编译
    "latex-workshop.latex.autoBuild.cleanAndRetry.enabled": false,
    // 设置是否自动编译
    "latex-workshop.latex.autoBuild.run":"never",
    //右键菜单
    "latex-workshop.showContextMenu":true,
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
    // 设置VScode内部查看生成的pdf文件 tab browser external
    "latex-workshop.view.pdf.viewer": "tab",
    // PDF查看器用于在\ref上的[View on PDF]链接 auto tabOrBrowser external
    "latex-workshop.view.pdf.ref.viewer":"auto",
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
