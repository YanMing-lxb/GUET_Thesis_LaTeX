%此文件为全局设置
\ProvidesClass{thesis-guet}

\LoadClass[12pt,a4paper, openany, twoside]{book} % openright,openany
\RequirePackage{ifxetex} %需要ifxetex，在LaTeX类和包文件中使用另一个包文件：ifxetex
\RequireXeTeX %需要使用XeLatex编译tex文件，不然会报错。
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx} % 图片
\RequirePackage[font={onehalfspacing, small}, labelsep=space, skip=6pt, figurewithin=none, tablewithin=none]{caption} % figurewithin=none, tablewithin=none 将book 类中向figure of list 添加 10pt间距的命令取消，但也会使得图表章与章之间连续编号，因此需要设置对应计数器每章重置
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage[absolute,overlay]{textpos} % 设置密级用的文本框，overlay绝对坐标。可以随意控制文本框位置
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage[nopostdot]{glossaries} %不显示description后的英文标点符号
\RequirePackage{mathspec}
\RequirePackage{xeCJK} % 对全局字体进行设置
\RequirePackage{datetime}
\RequirePackage{ifplatform}
% ===============符号说明相关宏===============
\RequirePackage{framed} % Framing content
\RequirePackage{multicol} % Multiple columns environment
\RequirePackage[]{nomencl} % Nomenclature package %noprefix % 符号说明的宏包
% ===============不清楚===============
\RequirePackage{zhnumber} % 大写中文数字
\RequirePackage{pifont}
\RequirePackage[hyphens]{xurl}
\RequirePackage[unicode,pdfencoding=auto,bookmarks=true,hyperfootnotes=false,bookmarksnumbered=true,bookmarksdepth=4]{hyperref} % 书签设置宏包 citecolor链接颜色设置% linkcolor引用颜色设置 urlcolor网址颜色 unicode,pdfencoding=auto 用来解决PDF警告
\hypersetup{colorlinks=true,citecolor=black, linkcolor=black, urlcolor=black}
\RequirePackage{indentfirst}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr} % 页眉设置宏包
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage[numbers,sort&compress,super,square]{natbib} % 参考文献引用格式设置宏包
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem} % 列表环境宏包
\RequirePackage[algochapter, boxruled, linesnumbered]{algorithm2e}
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{ifoddpage} % 判断是否为奇数
\RequirePackage{pdfpages}
\RequirePackage[titles]{tocloft} % 目录设置宏包
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{geometry} % 页面布局宏
\RequirePackage{ifthen}
\RequirePackage[capitalize]{cleveref} % 要在 hyperref后引用 noabbrev 引用前缀为缩写
% bindingoffset为内边距加长2.5cm
\RequirePackage{lastpage} % 统计总页数宏
\geometry{a4paper,inner=2.5cm, outer=2.5cm, top=3cm, bottom=2cm,bindingoffset=0cm} 


% ===============定义打印版还是电子版===============
\newif\ifOptionPrintVersion 
\OptionPrintVersiontrue
\DeclareOption{eversion}{\OptionPrintVersiontrue}%true为电子版，false为打印版。
\DeclareOption{pversion}{\OptionPrintVersionfalse}

% ===============设置封面时间格式===============
\renewcommand{\today}{\number\year 年 \number\month 月 \number\day 日}

% ================页边距设置===============
\ifOptionPrintVersion
  {}
\else
  {\geometry{inner=2cm, outer=2cm,bindingoffset=0.5cm}}
\fi

% ===============定义空白页命令=============== 
\newcommand\blankpage{% 定义添加空白页
\newpage
\thispagestyle{empty}%没有页眉页脚，空白页
\null
% \addtocounter{page}{-1} %\addtocounter{计数器}{数值}将数值与该计数器原有值相加，数值可以是正整数，也可以是负整数。
\newpage
}

% ===============定义带页眉页脚空白页命令=============== 
\newcommand\blankpage@number{\newpage\null\newpage}




% ++++++++++++++++++++++++++++++++++++++++++++++++++ 封面设置相关 ++++++++++++++++++++++++++++++++++++++++++++++++++


% ===============封面信息变量定义===============
\newcommand{\zh@thetitle}{\quad} % 标题
\newcommand{\en@thetitle}{\quad} % 英文标题
\newcommand{\theauthor}{\quad} % 作者
\newcommand{\thedate}{\quad} % 日期
\newcommand{\theschool}{\quad} % 学院
\newcommand{\themajor}{\quad} % 专业
%本科
\newcommand{\theadvisor}{\quad} % 导师姓名
\newcommand{\theprotitle}{\quad} % 导师职称
\newcommand{\thesecrets}{\quad} % 密级
\newcommand{\thestudentnumber}{\quad} % 学号
\newcommand{\thedegreecategories}{\quad}
\newcommand{\thedatereply}{\quad}

% ===============封面信息获取===============
\renewcommand{\title}[2]{
  \renewcommand{\zh@thetitle}{#1}
  \renewcommand{\en@thetitle}{#2}
}

\newcommand{\secrets}[1]{\renewcommand{\thesecrets}{#1}}
\renewcommand{\author}[1]{\renewcommand{\theauthor}{#1}}
\renewcommand{\date}[1]{\renewcommand{\thedate}{#1}}
\newcommand{\major}[1]{\renewcommand{\themajor}{#1}}
\newcommand{\school}[1]{\renewcommand{\theschool}{#1}}
\newcommand{\advisor}[1]{\renewcommand{\theadvisor}{#1}} % 导师姓名
\newcommand{\protitle}[1]{\renewcommand{\theprotitle}{#1}} % 导师职称
\newcommand{\studentnumber}[1]{\renewcommand{\thestudentnumber}{#1}}
\newcommand{\degreecategories}[1]{\renewcommand{\thedegreecategories}{#1}}
\newcommand{\datereply}[1]{\renewcommand{\thedatereply}{#1}}


\newcommand{\thedateoral}{}
\newcommand{\thedatesubmit}{}
\newcommand{\thedateconfer}{年\quad 月}

\newcommand{\setdate}[2][]{ 
\ifthenelse{\equal{#1}{oral}}{\renewcommand{\thedateoral}{#2}}{}
\ifthenelse{\equal{#1}{submit}}{\renewcommand{\thedatesubmit}{#2}}{}
\ifthenelse{\equal{#1}{confer}}{\renewcommand{\thedateconfer}{#2}}{}
}


% ====================本硕博选项声明====================
%\DeclareOption{选项}{代码}其中的选项就是选项的名称，而代码就是选项要执行的指令集。
\DeclareOption{bachelor}{
  \def\degreename{本科}
  \def\booktitle{本科毕业设计（论文）}
  \def\displayheader{桂林电子科技大学本科生学位论文}
}
\DeclareOption{master}{
  \def\degreename{硕士}
  \def\booktitle{硕\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
  \def\displayheader{桂林电子科技大学硕士学位论文}
}
\DeclareOption{promaster}{
  \def\degreename{专业硕士}
  \def\booktitle{硕\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
  \def\displayheader{桂林电子科技大学硕士学位论文}
}
\DeclareOption{doctor}{
  \def\degreename{博士}
  \def\booktitle{博\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
  \def\displayheader{桂林电子科技大学博士学位论文}
}
\DeclareOption{engdoctor}{
  \def\degreename{工程博士}
  \def\booktitle{博\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
  \def\displayheader{桂林电子科技大学博士学位论文}
}
\ExecuteOptions{master} % 默认值为硕士
\ProcessOptions\relax





% ===============封面制作===============
% 新定义判断变量，如果学位名是专业硕士则执行#1命令，否执行#2命令
\newcommand{\ifpromaster}[2]{ \ifthenelse{\equal{\degreename}{专业硕士}}{#1}{#2}}
% 新定义判断变量，如果学位名是本科则执行#1命令，否执行#2命令
\newcommand{\ifbachelor}[2]{ \ifthenelse{\equal{\degreename}{本科}}{#1}{#2}}

\newcommand{\makecover}{
  \thispagestyle{empty} %没有页眉页脚，空白页
  \setlength{\extrarowheight}{9pt}
  \pdfbookmark{封面}{cover}

  % ================设置密级格式
  % % 设定textblock尺寸单位
  \ifbachelor{}{ % 硕博密级👇
    \setlength{\TPHorizModule}{10mm}
    \setlength{\TPVertModule}{10mm}

    \begin{textblock}{5}(13.5,2.1)
      % \textblockcolour{red!30}% 设置背景颜色
      \begin{table*}
        \begin{flushright}
          \begin{tabular}%{ccp{6em}}
          {>{\fontsize{12pt}{12pt}\selectfont}l
            >{\centering\arraybackslash\fontsize{12pt}{12pt}\selectfont}
            b{1in} b{12pt}}
          密\ \ 级 & \thesecrets \\\specialrule{0em}{0pt}{0pt}
          \cline{2-2} % 设置表格下框线显示
          \end{tabular}
        \end{flushright}
        \end{table*}
    \end{textblock}
  }
  ~\\

% ================设置LOGO
  \begin{center}
    \ifbachelor{ % 本科LOGO👇
      \vspace{-2.2cm}
      \includegraphics[width=0.9 \textwidth]{Guet-logo.pdf}
      
      \vspace{2cm}%本科的题目不用英文所以比较居中 
    }{ % 硕博LOGO👇
      \vspace{-1.9mm}
      \includegraphics[width=0.9 \textwidth]{Guet-logo.pdf}
      \vspace{1cm} 
    }

    \ifpromaster{ % 专硕👇
      \fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\booktitle} \\
      \fontsize{20pt}{26pt}\selectfont{\bfseries（全日制专业学位硕士）}\\
      \vspace{1cm}
    }{ % 学硕及博士👇
      \fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\booktitle} \\
      \vspace{1cm}
    }

  % ================设置题目格式
  \ifbachelor{ % 本科题目 👇
    \vspace{1cm}
    
    \renewcommand{\arraystretch}{1.3}

    \begin{tabular}{m{0.57in}<{\centering}m{4.3in}<{\centering}}
      \bfseries\fontsize{16pt}{16pt}\selectfont 题目: &\multirow[t]{2}{4in}
      {
      \centering
      \linespread{2.0}
      \bfseries\fontsize{16pt}{16pt}\selectfont\zh@thetitle
      } \\ \cline{2-2}
      & \\ \cline{2-2}
    \end{tabular}
    \vspace{2.2cm}
  
  }{ % 硕博题目👇
    \renewcommand{\arraystretch}{1.3}
    \begin{tabular}{m{0.55in}<{\centering}m{4.8in}<{\centering}}
      \bfseries\fontsize{16bp}{16bp}\selectfont 题目 &\multirow[t]{2}{4.8in}
      {
      \centering
      \bfseries\fontsize{14bp}{26bp}\selectfont \zh@thetitle
      } \\ \cline{2-2}
      & \\ \cline{2-2}
      \bfseries\fontsize{14bp}{14bp}\selectfont (英文) &\multirow[t]{2}{4.8in}
      {
      \centering
      \bfseries\fontsize{14bp}{26bp}\selectfont \en@thetitle
      } \\ \cline{2-2}
      & \\ \cline{2-2}
    \end{tabular}\hspace*{\fill} \\[\baselineskip]
    \vspace{0.5cm}
  }
    % & \\ \cline{2-2} % 标题有几行就添加几行这段代码


    % ================设置信息格式
    \renewcommand\arraystretch{1.3}
    
    \ifbachelor{ % 本科封面信息 👇
      \begin{tabular}
        {>{\bfseries\fontsize{15pt}{15pt}\selectfont}m{1.5in}
          >{\centering\arraybackslash\fontsize{15pt}{15pt}\selectfont}
          p{3in} b{18pt}}
  
        学\hspace{0.36cm} \qquad \qquad 号: & \thestudentnumber &\\
        \cline{2-2} 
        姓\hspace{0.36cm} \qquad \qquad 名: & \theauthor & \\
        \cline{2-2}
        学\hspace{0.36cm} \qquad \qquad 院: & \theschool &\\
        \cline{2-2}
        专\quad \hspace{0.36cm} \qquad \quad 业: & \themajor &\\
        \cline{2-2}
        指\hspace{0.38cm} 导\hspace{0.38cm} 教\hspace{0.38cm} 师: & \theadvisor &\\
        \cline{2-2}
        指\hspace{0.1pt} 导\hspace{0.1pt} 教\hspace{0.1pt} 师\hspace{0.1pt} 职\hspace{0.1pt} 称: & \theprotitle &\\
        \cline{2-2}
      \end{tabular}
      
      \vspace{3cm}
      \fontsize{16pt}{16pt}\selectfont \thedatereply
      
    }{ % 硕博封面信息 👇
    \begin{tabular}
      {>{\bfseries\fontsize{15pt}{15pt}\selectfont}l
        >{\centering\arraybackslash\bfseries\fontsize{15pt}{15pt}\selectfont}
        b{3in} b{15pt}}

      研\quad 究\quad 生\quad 学\quad 号: & \thestudentnumber &\\
      \cline{2-2} 
      研\quad 究\quad 生\quad 姓\quad 名: & \theauthor & \\
      \cline{2-2}
      指导老师姓名、职称: & \theadvisor \enspace \theprotitle &\\
      \cline{2-2}
      申\enspace 请\enspace 学\quad 位\enspace 门\enspace 类: & \thedegreecategories &\\
      \cline{2-2}
      学\qquad 科、专\qquad 业: & \themajor &\\
      \cline{2-2}
      论\enspace 文\enspace 答\quad 辩\enspace 日\enspace 期: & \thedatereply &\\
      \cline{2-2}
    \end{tabular}
    }
    
  \end{center}
    \setcounter{page}{1}
    \setlength{\extrarowheight}{2pt}
    
    %判断是否为电子版。true为电子版，false为打印版。
    \ifOptionPrintVersion
      {}
    \else
      {\blankpage}
    \fi
  }
  
% ====================导入封面PDF文件设置====================
\newcommand{\bindpdfcover}[1]{
  \pdfbookmark{封面}{cover}
  \includepdf[pages=-]{#1}
  \newpage\setcounter{page}{0}
  }

% ====================独创性（或创新性）声明设置====================
\newcommand{\originalitydeclaration}{
  \newpage
  \thispagestyle{empty} %没有页眉页脚，空白页
  \begin{spacing}{1.5}
    \pdfbookmark{独创性（或创新性）声明}{originalitydeclaration}
    \noindent
    \ifbachelor{ % 本科独创性声名👇
      \begin{center} % \noindent无缩进
        \fontsize{14pt}{20pt}\selectfont\bfseries 本科生毕业设计（论文）独创性声名
      \end{center}

      \par{\fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}% % \noindent无缩进
      本人声明所呈交的毕业设计（论文）是我个人在指导老师指导下进行的工作及取得的成果。尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，文中不包含其他人或其它机构已经发表或撰写过的成果；也不包含为获得桂林电子科技大学或其他教育机构的学位或证书而使用过的材料。其他同志对本工作的启发和所做的任何贡献均已在毕业设计（论文）中做了明确的说明并表示了谢意。}
      \\
      \vspace{-1cm}
      \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{19pt} % \noindent无缩进
      毕业设计（论文）若有不实之处，本人承担一切相关责任。
      \\

      \vspace{2cm}
      \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{27pt}本人签名：\hspace{84pt}%
      日期： \\
      \vspace{2cm}
      \noindent
      \begin{center} % \noindent无缩进
        \fontsize{14pt}{24pt}\selectfont\bfseries 本科生毕业设计（论文）使用授权说明
      \end{center}

      \par{\fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}%
      桂林电子科技大学有权保留并向国家有关部门或机构送交毕业设计说明书（论文）的复印件，允许毕业设计（论文）被查阅和借阅。本人授权桂林电子科技大学可以公布毕业设计（论文）的全部或部分内容，可以采用影印、缩印或其它复制手段保存、汇编毕业设计（论文）}
      \\

      \vspace{1.5cm}
      \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}作者签名：   
      \hspace{84pt}%
      日期： \\ \\

      \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}导师签名：         
      \hspace{84pt}%
      日期： \\
  }{ % 硕博独创性声名👇
    \begin{center} % \noindent无缩进
      \fontsize{14pt}{20pt}\selectfont\bfseries 独创性声明
    \end{center}

    \par{\fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}% % \noindent无缩进
    本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果；也不包含为获得桂林电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中做了明确的说明并表示了谢意。}
    \\

    \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt} % \noindent无缩进
    申请学位论文与资料若有不实之处，本人承担一切相关责任。%
    \\

    \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}本人签名：\hspace{84pt}%
    日期： \\

    \vspace{1cm}
    \noindent
    \begin{center} % \noindent无缩进
      \fontsize{14pt}{20pt}\selectfont\bfseries 关于论文使用授权的说明
    \end{center}

    \par{\fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}%
    本人完全了解桂林电子科技大学有关保留和使用学位论文的规定，即：研究生在校攻读学位期间论文工作的知识产权单位属桂林电子科技大学。本人保证毕业离校后，结合学位论文研究成果完成的论文、发明专利等成果，署名单位仍然为桂林电子科技大学。学校有权保留送交论文的复印件，允许查阅和借阅论文；学校可以公布论文的全部或部分内容，可以允许采用影印、缩印或其它复制手段保存论文。（保密的论文在解密后遵守此规定）}\\

    \vspace{1cm}

    \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}作者签名：   
    \hspace{84pt}%
    日期： \\

    \fontsize{12pt}{12pt}\selectfont\noindent\null\hspace{24pt}导师签名：         
    \hspace{84pt}%
    日期： \\
  }
  \end{spacing}
    \ifOptionPrintVersion
      {}
    \else
      {\blankpage}
    \fi
}

% ====================导入独创性声明定义PDF文件设置====================
\newcommand{\signatureofdeclaration}[1]{
  \includepdf[pages=-]{#1}
  \newpage\setcounter{page}{0}
}

% ++++++++++++++++++++++++++++++++++++++++++++++++ 封面设置相关结束 ++++++++++++++++++++++++++++++++++++++++++++++++




% ===============字体设置===============
\newCJKfontfamily{\kaiti}[AutoFakeBold=true]{GB2312.ttf} %楷体
\ifwindows
  \setCJKmainfont[AutoFakeBold=true]{SimSun} %设置xeCJK 中文主字体
  \newCJKfontfamily{\heiti}[AutoFakeBold=true]{SimHei} 
  \newfontfamily{\heiti@letter}{SimHei}
  \setallmainfonts{Times New Roman} %设置英文字体
\else
\ifmacosx
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}[AutoFakeBold=true]{STHeiti}
  \newfontfamily{\heiti@letter}{STHeiti}
  \setallmainfonts{Times New Roman}
\else
  \setCJKmainfont[AutoFakeBold=true]{fzsong.ttf}
  \newCJKfontfamily{\heiti}[AutoFakeBold=true]{fzhei.ttf}
  \newfontfamily{\heiti@letter}{fzhei.ttf}
  \setallmainfonts[
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf}
\fi
\fi

% ===============设置数学字体===============
\DeclareMathAlphabet{\mathbf}{\eu@enc}{\eu@mathrm}{\bfdefault}{it}
\DeclareMathAlphabet{\mathbd}{\eu@enc}{\eu@mathrm}{\bfdefault}{n}
\newcommand{\bm}{\mathbf}

% ===============定义相关线宽===============
\setlength{\heavyrulewidth}{0.9pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\arrayrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}

% ===============enumitem环境设置===============
\AddEnumerateCounter*{\chinese}{\zhnumber}{\arabic} % enumitem 中文编号设置


% ===============不清楚===============
\renewcommand{\thesubfigure}{(\alph{subfigure})} %设置子图标题序号
\newcommand{\floatcontinue}{\end{figure}\clearpage\begin{figure}[tb]\ContinuedFloat}

\urlstyle{rm}
\raggedbottom %顶部对齐

% ===============设置页眉双线===============
%本科页眉是一条横线
\ifbachelor{ % 本科页眉 👇
\newdimen\singlelineskip 
	\setlength\singlelineskip{2pt} 
	\renewcommand\headrule{% 
		\hrule height\headrulewidth width\headwidth% 
		\vskip 1.2\singlelineskip}
}{ % 硕博页眉 👇
  \newdimen\doublelineskip % 两横线间的距离
  \setlength\doublelineskip{1pt}
  \renewcommand\headrule{%
    \hrule height\headrulewidth width\headwidth%
    \vskip 1.2\doublelineskip%
    \hrule height\headrulewidth width\headwidth}
}
  % ===============设置段落格式===============
\setlength{\headheight}{17pt} % 原先设置是15pt
\pagestyle{fancy} % 设置风格为fancy
\linespread{1.389} % 字号大小为12bp，基本行距为12×1.2=14.4bp，欲设置行距为20bp，则因子为20/14.4=1.389
\setlength\parindent{24pt} % % 设置缩进长度 两个小四 pt：磅，bp：大点，pc：pica 

% ===============设置标题段落===============  
\titlespacing{\chapter}{0pt}{0pt}{18pt} 
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}
%标题周距设置，\titlespacing*{标题命令}{左间距}{上间距}{下间距} [右间距]，用它可以设置每种层次标题与四周之间的距离。


% ===============设置标题格式===============  

\ifbachelor{ % 本科小节编号格式 👇
  \renewcommand\thechapter{\arabic{chapter}}
  \renewcommand\thesection{\arabic{chapter}.\arabic{section}} 
}{ % 硕博小节编号格式 👇
  \renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章} %\zhnumber{计数器}，使计数器值输出为汉字格式。
  \renewcommand\thesection{\S\arabic{chapter}.\arabic{section}} 
}
%\the计数器，显示计数器的值，该命令只使用于序号计数器，例如\thepage显示当前页码。\value{计数器}调用计数器的值，无论计数器的计数形式如何都被转换成对应的阿拉伯数字。 \S 标题前加特数符号
\counterwithin{figure}{chapter} % 设置对应计数器每章重置
\counterwithin{table}{chapter} % 设置对应计数器每章重置
\ifbachelor{ % 本科图表公式题注编号格式 👇
  \renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}} %显示公式编号，其格式x-x
  \renewcommand{\thetable}{\arabic{chapter}.\arabic{table}} %显示表格编号，其格式x-x
  \renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} %显示插图编号，其格式x-x
}{ % 硕博图表公式题注编号格式 👇
  \renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}} %显示公式编号，其格式x-x
  \renewcommand{\thetable}{\arabic{chapter}-\arabic{table}} %显示表格编号，其格式x-x
  \renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}} %显示插图编号，其格式x-x
}
%chapter章序号计数器，section节序号计数器，subsection小节序号计数器，subsubsection小小节序号计数器，paragraph段序号计数器，figure插图序号计数器，table表格序号计数器，page页码序号计数器，equation公式序号计数器


% ===============设置图表格式===============  
\captionsetup{width=\textwidth - 60pt}%84pt
\captionsetup[subfigure]{aboveskip=2pt, belowskip=2pt}% , width=36pt 设置子图标题的宽度 
\captionsetup[subfoat]{aboveskip=2pt, belowskip=2pt}
\captionsetup[figure]{aboveskip=3pt, belowskip=0pt} %设置标题与插图或表格之间的垂直距离，设置标题与下文之间的附加垂直距离, 如果标题在插图或表格之下;或标题与上文之间的附加垂直距离, 如果标题在插图或表格之上。该参数的默认值是0pt。为6pt，下面为0pt
\captionsetup[table]{aboveskip=0pt, belowskip=6pt}
\captionsetup[longtable]{aboveskip=0pt, belowskip=6pt}
\setlength{\intextsep}{9pt} % 控制出现在页⾯中间的浮动体（如使⽤了h 选项的浮动体）与上下方文本之间的垂直距离
% \setlength{\textfloatsep}{6pt} % 控制出现在页⾯的顶部或底部的浮动体与⽂本之间的垂直距离


\AtBeginEnvironment{figure}{ %让图环境的内容居中
  \def\@floatboxreset{\centering}%
}
\AtBeginEnvironment{table}{ %让表格环境的内容居中
  \def\@floatboxreset{\centering}%
}
\AtBeginEnvironment{tabular}{\small}%表格字体小五
\AtBeginEnvironment{tabular*}{\small}%表格字体小五
\AtBeginEnvironment{longtable}{\small}%跨页表格字体小五
%\captionsetup{format=hang} %caption工具包在加载时可以修改标题的很多方面，也可以通过 captionsetup命令也可以在工具包选项中修改。\captionsetup[浮动体类型]{参数1=选项, 参数2=选项,…}其中可选参数浮动体类型的选项可以是figure或table,如果省略该参数, 则表示这两种浮动体都适用。format：plain默认值,将标题作为普通段落排版。hang将标题从第二行起悬挂缩进排版，缩进宽度等于标题标志加分隔符的宽度。indention设置从标题第二行起的附加缩进宽度, 例如indention=5mm,其默认值是0pt。
%标题设置\captionsetup


% ===============章节和目录深度设置===============
\setcounter{secnumdepth}{3} %设置章节深度
\setcounter{tocdepth}{2} %设置目录深度



% ===============设置标题字体=============== 
\titleformat{\chapter}[block]
  {\centering\fontsize{16pt}{16pt}\selectfont\heiti\thispagestyle{fancy}}
  {\thechapter}{7.5pt}{} % \thispagestyle{fancy} 需要使用fancyhdr包，并提供了奇偶页不同的风格

\titleformat{\section}[block]
  {\centering\fontsize{14pt}{14pt}\selectfont} %\heiti 设置为粗体
  {\thesection}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont}
  {\thesubsubsection}{6pt}{}
  \renewcommand{\thesubsubsection}{\arabic{subsubsection}.} %四级标题格式设置为 1.
  
% ===============定义计数器=============== 
% \newcounter{pseudopage} %自定义一个名字pseudopage新计数器
% \setcounter{pseudopage}{0} %pseudopage新计数器清零
% \AddToHook {shipout/background}{\stepcounter{pseudopage}} 
%\stepcounter{计数器}，将计数器的值加1，如果计数器是层次标题的序号计数器，还将比其低一层计数器清零。例如\stepcounter{chapter},将chapter序号计数器加1，同时将section以及低于section的序号计数器归零。


%=========================中文摘要
\newenvironment{chineseabstract}{
  \chapter*{摘\quad 要}
  \setcounter{page}{1} % 定义为第一页
  \addcontentsline{toc}{chapter}{\heiti 摘\quad 要} % 设置在目录显示摘要
  \pagenumbering{Roman} % 设置页码显示为罗马数字
  \markright{\centering 摘\quad 要} %手动设置页眉
  \fancyhf{} %初始化页码页脚布局
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 摘\quad 要} %设置页眉
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}} % 罗马页码居中显示
}{
  \ifOptionPrintVersion
    {}
  \else
    \checkoddpage
    \ifoddpage
      \blankpage@number
    \else
      \newpage
    \fi
  \fi

}

%=========================中文关键字
\newcommand{\chinesekeyword}[1]{
\vspace{\baselineskip}
\noindent %无缩进
\@hangfrom{\makebox[48pt][l]{\textbf{关键词：}}}#1
}

%=========================英文摘要
\newenvironment{englishabstract}{
\chapter*{\bfseries ABSTRACT}
\addcontentsline{toc}{chapter}{\bfseries ABSTRACT} % 设置在目录显示
\markright{\centering\rm ABSTRACT} %手动设置页眉
\fancyhf{} 
\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont ABSTRACT}
\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
}{
  \ifOptionPrintVersion
    {}
  \else
    \checkoddpage
    \ifoddpage
      \blankpage@number
    \else
      \newpage
    \fi
  \fi
  }
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%英文关键字
\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent %无缩进
  \@hangfrom{\makebox[2.1cm][l]{\textbf{Keywords:}}}#1
}


%定义加入目录的词语
%\addtocontents{扩展名} {文本}它可以将任意文本和相关格式命令写入目录或在创建目录时（如果是命令）则被执行,但它不会将命令写入目录。 文本可以是任意字符或\vspace、\newpage等调整某一条目格式的命令,一般在命令前加\protect。
\AddToHook {shipout/background}{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddToHook {shipout/background}{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddToHook {shipout/background}{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

%设置奇数和偶数页页眉栏文字%使用计数器
\tocloftpagestyle{fancy} %用户自定义的奇页眉使用桂林电子科技大学xxx，偶数使用标题，页脚页眉居中
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}
\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}
\ifbachelor{ % 本科目录格式 👇
  \linespread{1.389} %本科目录20磅行间距
  
  \cftsetindents{chapter}{0pt}{20pt} %一个空格约为5磅
  \cftsetindents{section}{0pt}{25pt}
  \cftsetindents{subsection}{0pt}{30pt}
  \cftsetindents{subsubsection}{0pt}{41pt}
  %本科目录字体大小
  \renewcommand\cftchapfont{\fontsize{15pt}{15pt}\selectfont\heiti}
  \renewcommand\cftsecfont{\fontsize{14pt}{14pt}\selectfont\heiti}
  \renewcommand\cftsubsecfont{\fontsize{14pt}{15pt}\selectfont\kaiti}
}{ % 硕博目录格式 👇
  \addtolength{\cftchapnumwidth}{25pt}

  \cftsetindents{section}{21pt}{22pt}
  \cftsetindents{subsection}{44pt}{31pt}
  \cftsetindents{subsubsection}{76pt}{41pt}

  \renewcommand{\cfttoctitlefont}{\fontsize{15pt}{15pt}\selectfont\heiti}
  \renewcommand\cftchapfont{\heiti}
}



% ====================正文页眉设置====================
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace*{5.25pt}#1}{}} %修改页眉章节显示内容 %\markboth{<左面页眉>}{<右面页眉>}
\ifbachelor{ % 本科页眉文字 👇
  \newcommand{\standardheader}{
  \fancyhf{}
  \fancyhead[CE,CO]{\fontsize{10.5pt}{12.6pt}\selectfont 桂林电子科技大学毕业设计（论文）}
  \fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref {LastPage} 页 }
  }
}{ % 硕博页眉文字 👇
  \newcommand{\standardheader}{
    \fancyhf{}
    \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\zh@thetitle}
    \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\leftmark} %奇数页页眉使用标题
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
  }
}


% ====================将默认名称改为中文====================


% ===============图表公式引用设置=============== cleveref
% \crefformat{equation}{式#1} %公式引用标签中去掉括号
\crefname{figure}{图}{图} % 更改引用前缀 参数二为单独引用
\crefname{table}{表}{表} % 参数三为多个引用
\crefname{equation}{式}{式}
\crefname{algorithm}{算法}{算法}
\crefname{chapter}{}{}
\crefname{section}{}{}
\crefname{subsection}{}{}
\renewcommand{\contentsname}{目\quad 录} %使默认的Contents改为目 录显示
\renewcommand{\bibname}{参考文献} %使默认的参考文献名字改为参考文献显示
\renewcommand{\figurename}{图} %使默认的图名字改为图显示
\renewcommand{\tablename}{表} %使默认的表名字改为表显示
\renewcommand{\listfigurename}{插图索引}
\renewcommand{\listtablename}{插表索引}

\setlength{\extrarowheight}{2pt} % 行距


% ====================目录设置====================

\newcommand{\thesistableofcontents}{\tableofcontents}
\pretocmd{\tableofcontents}{
  \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 目\quad 录}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
  \pdfbookmark{目录}{toc}
}{}{}


% ====================插图索引格式设置====================
\newcommand{\thesisfigurelist}{\listoffigures} % 自定义调用\listoffigures的命令

\pretocmd{\listoffigures}{ % 图目录是存放在.lof目录的文件下
  \newpage  %新建一页
  \fancyhf{} %初始化页码页脚布局
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{插图索引}}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}} % 罗马页码居中显示
  \addtolength{\cftfignumwidth}{12pt} %设置长度命令，使命令\cftfignumwidth的长度设置为12pt，条目编号与条目内容之间占用的宽度, 例如：图 1-2 [\cftfignumwidth] 电子战飞机
  \renewcommand{\cftfigpresnum}{图} %条目编号前内容  
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}} %将目录深度设置为0 就会在目录中显示
}{}{} 

% ====================插表索引格式设置====================
\newcommand{\thesistablelist}{\listoftables}

\pretocmd{\listoftables}{ % 表目录是存放在.lot目录的文件下
  \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont {插表索引}}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
  \addtolength{\cfttabnumwidth}{12pt} %条目编号占用宽度，条目编号与条目内容之间占用的宽度, 例如：表1-1 [\cftfignumwidth] 参数设置
  \renewcommand{\cfttabpresnum}{表} %条目编号前内容
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}} %将目录深度设置为-1，目录中只显示一级标题 0 为chapter
}{}{}


% ====================符号说明页面设置====================
\newcommand{\thesissymbollist}{ 
  \newpage 
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 符号说明}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
  \renewcommand{\nomname}{符号说明} %修改符号说明标题的名称。
  \begin{small} %\footnotesize % 设置字体大小
    \printnomenclature[1.5 cm]%设置术语与描述之间的距离 
  \end{small}
  \addcontentsline{toc}{chapter}{\heiti 符号说明} % 设置在目录显示符号说明
  \ifOptionPrintVersion
    {}
  \else
    \checkoddpage
    \ifoddpage
      \blankpage@number
    \else
      \newpage
    \fi
  \fi
}

% ====================符号表格式设置====================
% 设置符号说明为双栏显示
\renewcommand*\nompreamble{\begin{multicols}{2}}
\renewcommand*\nompostamble{\end{multicols}}
  
% 更改术语之间的垂直行间距
\newlength{\nomitemorigsep}
\setlength{\nomitemorigsep}{\nomitemsep}
\setlength{\nomitemsep}{-1\parsep} % Baseline skip between items

% 创建符号说明分组
\renewcommand{\nomgroup}[1]{%
  \ifthenelse
    {\equal{#1}{A}}
    {\vspace{9pt} \item[\textbf{希腊字符}]}
    {\ifthenelse
        {\equal{#1}{B}}
        {\vspace{9pt} \item[\textbf{下标}]}
        {\ifthenelse{\equal{#1}{C}}{\vspace{9pt} \item[\textbf{缩略语}]}{}}
    }
  \itemsep\nomitemsep% 应用上面设置的术语垂直行间距
}
\makenomenclature% 应用符号表

% ====================算法栏====================
\SetAlgorithmName{算法}{算法}{算法列表}
\renewcommand\thealgocf{\arabic{chapter}-\arabic{algocf}}
\SetAlgoCaptionSeparator{\null}
\AtBeginEnvironment{algorithm}{\vspace{9pt}}
\AfterEndEnvironment{algorithm}{\vspace{9pt}}






% ====================致谢设置====================
\newcommand{\thesisacknowledgement}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}} %只显示一级标题
  \setcounter{section}{0} %section计数器清零 

  \chapter*{致\quad 谢}
  \addcontentsline{toc}{chapter}{致\quad 谢}
  % \markboth{致谢}{致谢} %\markboth{<左面页眉>}{<右面页眉>}
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 致\quad 谢}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
  \thispagestyle{fancy}
  \input{Chapter/Thanks.tex} %% 致谢文档位置
}

\newcommand{\thesiscontent}{
  \newpage
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardheader
  \pagenumbering{arabic}
}

\pretocmd{\@chapter}{
  \ifdefined\@BODY
  \else
  \ifnum\value{chapter}=0
      \thesiscontent
    \fi
  \fi
}{}{}

% ====================附录设置====================
\newcommand{\thesisappendix}{ %附录格式设置
  \newpage
  \appendix
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

  \renewcommand{\thechapter}{附录\Alph{chapter}}
  \renewcommand{\appendixname}{附录}
  

  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
  \renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
  \renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
  \renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
  \renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
  \renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
  \renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
  \renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
  \renewcommand{\theexample}{\alph{chapter}.\arabic{example}}
}

\newcommand{\thesissingleappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{附\quad 录}{7.5pt}{}
  %\renewcommand{\thechapter}{附\quad 录}

  \renewcommand{\appendixname}{附录}

  \renewcommand{\thesection}{A.\arabic{section}}
  
  \renewcommand{\theequation}{a-\arabic{equation}}
  \renewcommand{\thetable}{a-\arabic{table}}
  \renewcommand{\thefigure}{a-\arabic{figure}}
  \renewcommand{\thetheorem}{a.\arabic{theorem}}
  \renewcommand{\theaxiom}{a.\arabic{axiom}}
  \renewcommand{\thecorollary}{a.\arabic{corollary}}
  \renewcommand{\thelemma}{a.\arabic{lemma}}
  \renewcommand{\thedefinition}{a.\arabic{definition}}
  \renewcommand{\theexample}{a.\arabic{example}}
  

  \chapter*{附\quad 录}
  \addcontentsline{toc}{chapter}{附录}
  \markboth{附录}{附录}

}

%章节目录中的条目是由\chapter和\section等章节命令生成的,插图或表格目录中的条目是由在浮动环境figure或table中的图表标题命令\caption生成的; 而带星号的章节命令和图表标题命令以及摘要! 参考文献等环境创建的无序号标题, 则不能进入目录。如果希望某个无序号标题也能被排入目录, 可在该标题或环境命令之后使用附加条目命令:
%\addcontentsline{扩展名} {条目类型} {条目文本}
%扩展名 标题记录文件的扩展名, 如果所附加条目的是章节目录,扩展名为toc;如果是插图目录, 则为lof; 如果是表格目录则为lot。
%条目类型 所附加条目的格式类型,如果扩展名为toc, 那条目类型可以是chapter、section等不带反斜杠的章节命令名; 如果为lof, 则是figure; 如果为lot, 则是table。
%条目文本可以是带星号命令或摘要等环境生成的无序号标题, 也可以是其他需要向目录添加的文字符号



% ====================参考文献设置====================
\newcommand{\thesisbibliography}{\thesisloadbibliography}
\renewcommand{\bibname}{参考文献} 
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\newenvironment{thesisthebibliography}{
  \begin{thebibliography}{lo}
    \interlinepenalty=10000
    \begin{spacing}{1.667}
      \thispagestyle{fancy}
      \small
  }{
      \end{spacing}
    \end{thebibliography}
  }

  \pretocmd{\bibliography}{
    \newpage
    \fancyhf{}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 参考文献}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
    \interlinepenalty=10000
  \begin{spacing}{1.667}
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}
\setlength{\bibsep}{0pt} % 消除参考文献条目间的额外行间距

\newcommand{\bstlabelmark}{lo}
\newcommand{\thesisloadbibliography}[2][]{
  \small
  \ifthenelse{ %\ifthenelse{判断条件}{肯定结构}{否定结构}
    \equal{#1}{large} %\equal{#1}{nocite} %判断#1是否等于notice
  }{
    \setlength{\labelsep}{3pt}
    \renewcommand{\bstlabelmark}{loo}
    \bibliographystyle{thesis-guet(base-gbt7714-numerical).bst} %插入参考文献的样式.bst文件
    \bibliography{#2}
    \setlength{\labelsep}{6pt}
  }{
    \bibliographystyle{thesis-guet(base-gbt7714-numerical).bst} %插入参考文献的样式.bst文件
    \bibliography{#2} %参考文献格式，用于指定排版参考文献所使用的文献格式文件名.bib
  }
}

\AtBeginDocument{               % 该代码用以解决： multibib 的 resetlabels 功能的 bug
  \def\thebibliography#1{%
    \@isnumber{#1}{%
      \ifnum\mb@biblabelwidth=0
        % \@tempcnta\c@NAT@ctr %% changed here to c@NAT@ctr
        \@tempcnta=#1\relax
        \ifcontinuouslabels
          \advance\@tempcnta\c@NAT@ctr
          % \advance\@tempcnta#1%
        \fi
        \std@thebibliography{\@arabic\@tempcnta}%
      \else
        \std@thebibliography{\@arabic\mb@biblabelwidth}%
        \global\mb@biblabelwidth 0
      \fi
    }{%
      \std@thebibliography{#1}%
    }%
  }%
}


% \newcites{accomplish}{攻读\degreename{}学位期间取得的成果} 

% \newenvironment{thesistheaccomplish}{ %设置thesisaccomplish环境格式
%   \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
%   \renewcommand\thesection{\arabic{section}}
%   \setcounter{section}{0} %section计数器清零
%   \nociteaccomplish{*}
%   \renewcommand{\bibname}{攻读\degreename{}学位期间取得的成果}
%   \begin{thebibliography}{lo}
%     \interlinepenalty=10000
%     \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
%     \begin{spacing}{1.667}
%       \thispagestyle{fancy}
%       \small
%     }{
%     \end{spacing}
%   \end{thebibliography}
%   \renewcommand{\bibname}{参考文献}
% }


% \newcommand{\thesisloadaccomplish}[1]{
%   \nociteaccomplish{*}
%   \renewcommand{\bibname}{攻读\degreename{}学位期间取得的成果}
%   \renewcommand{\bstlabelmark}{lo}
%   \thispagestyle{fancy} %该页含有页眉和页脚
%   \begin{spacing}{1.667}
%   \bibliographystyleaccomplish{thesis-guet} %插入参考文献的样式.bst文件  \bibliographyaccomplish{#1}%参考文献格式，用于指定排版参考文献所使用的文献格式文件名.bib  \end{spacing}
%   \bibliographyaccomplish{#1}
%   \end{spacing}
%   \renewcommand{\bibname}{参考文献}
% }

% \newcommand{\thesisaccomplish}{\thesisloadaccomplish}



% ====================攻读学位期间取得成果====================
% \newenvironment{accomplish}{
%   \protect\setcounter{tocdepth}{0}
%   \setcounter{section}{0} %section计数器清零
%   \chapter*{攻读\degreename{}学位期间取得的成果}
%   \addcontentsline{toc}{chapter}{攻读\degreename{}学位期间取得的成果} 
%   % \markboth{\centering 攻读\degreename{}学位期间取得的成果} %手动设置页眉
%   \fancyhf{} %初始化页码页脚布局
%   \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 攻读\degreename{}学位期间取得的成果}
%   \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
% }{
%   \ifOptionPrintVersion
%     {}
%   \else
%     \checkoddpage
%     \ifoddpage
%       \blankpage
%     \else
%       \newpage
%     \fi
%   \fi
% }

\newcommand{\thesisaccomplish}{
  \normalsize % 设置字体大小为小四
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}} %只显示一级标题
  \setcounter{section}{0} %section计数器清零 

  \chapter*{攻读\degreename{}学位期间取得的成果}
  \addcontentsline{toc}{chapter}{攻读\degreename{}学位期间取得的成果}
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 攻读\degreename{}学位期间取得的成果}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
  \thispagestyle{fancy}
  \input{Chapter/Accomplish.tex} %% 学术成果文档位置
}
{
  \ifOptionPrintVersion
    {}
  \else
    \checkoddpage
    \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
  \fi
}


% ===============定理设置===============
\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\heiti}{}{ }{}
\theoremstyle{dotless}%plain（默认样式）：定理名称是正体，定理内容是斜体。definition：定理名称和定理内容都是正体。remark： 定理名称是斜体，定理内容是正体
%\renewcommand\@upn{\selectfont\heiti@letter}


  \newtheorem{theorem}{定理}[chapter] 
  \newtheorem{axiom}[theorem]{公理}
  \newtheorem{corollary}[theorem]{推论}
  \newtheorem{lemma}[theorem]{引理}
  \newtheorem{definition}[theorem]{定义}
  \newtheorem{example}[theorem]{例子}
  \newtheorem{proposition}[theorem]{命题}

%\newtheorem{环境名} [计数器名] {标题} [排序单位]
%环境名 给所定义的定理类环境起的名称, 它不得与现有环境重名, 否则系统将提示出错。每定义一个环境名, 系统就会自动创建一个同名的计数器, 用于为所定义的定理类环境排序。
%计数器名 可选参数, 如果希望所定义的定理类环境与已定义的某个定理类环境混合排序,就可在其中填写该环境的计数器名, 也就是该定理类环境的环境名;如果省略这个可选参数, 则表示本定理类环境单独排序。
%标题 用于设置定理类表达式的标题, 如theorem定理， 证明和引理等。
%排序单位 可选参数, 用于设定排序单位, 如果是chapter, 则每一新章开始时所定义定理类环境的计数器清零; 该可选参数的默认值是以全文为排序单位

\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
%\renewcommand{\qedsymbol}{$\blacksquare$} %结束符，\blacksquare实心方框，\square空心方框

\renewcommand{\proofname}{证明}
  %定义该模板的证明环境格式

%\renewenvironment{新环境名称}[参数个数][参数默认值]{开始部分定义}{结束部分定义}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed} %这里 \pushQED{\qed} 把 \qed 压入了 QED 这个堆栈，然后在环境结束的地方，通过 \popQED把压入堆栈的最后一个元素弹出来。
  \normalfont %正体
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
    \heiti
  #1\@addpunct{:}]\ignorespaces %\proofname后面:
}%开始部分定义
{
  \popQED\endtrivlist\@endpefalse
}%结束部分定义

%\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}} %\textsuperscript{}文字上标
\setlist{noitemsep}%条目之间无附加的垂直距离
\setlist{nolistsep}

%\noindent表示proof没有缩进，\it表示proof斜体
%\quad表示\proofname后面空四个空格，\hfill表示右对齐，\square表示方框，\par表示结尾空一段.

\AtBeginDocument{
  \setlength{\abovedisplayskip}{8pt}
  \setlength{\belowdisplayskip}{8pt}
  \setlength{\belowdisplayshortskip}{8pt}
  \setlength{\abovedisplayshortskip}{8pt}
}





\endinput
