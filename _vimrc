scriptencoding utf-8
"-----------------      作者: fedkey
"-----------------      邮箱: fedkey@sina.com
" -----------------     博客: http://huimingcc.com
"系统依赖
"linux-debian fedora ubuntu
"sudo yum install ctags
"sudo yum install build-essential cmake python-dev  #编译YCM自动补全插件依赖
"sudo yum install silversearcher-ag
"软件安装
"python2.7  windows自行安装,linux自带
"java       [http://www.java.com]
"npm        sudo yum install npm
"clang      sudo yum install clang
"cmake      sudo yum install cmake
"python-dev sudo yum install pythoon-dev
"gvim       sudo yum install vim-gtk
" Ctrl + ]                   --转到函数定义
" Ctrl + T                   --返回调用函数
" Tab键                      --插入模式下的全功能语法结构补全
" za                         --打开或关闭当前折叠
" zM                         --关闭所有折叠
" zR                         --打开所有折叠
"使用Python语法检测
"sudo pip install pyflakes
"sudo pip install pylint
"sudo pip install pep8

"==========vim技巧==================================================================================
"=======                                                                                     =======
"== | 一:文字周边加特殊符号                                                                       ==
"== | 1.文本单词中添加符号,如:wwflwlf/fwfwekfek kfwkeowofeow想在wwflwlf/fwfwekfek前后加一个双引号 ==
"== | 操作,光标定位到wwf处：vt空格 S"   以此类推,可以快速添加其他的符号                           ==
"== | 2.进入vim,按两次c-o 即可载入上次关闭vim时编辑的文件                                         ==
"== | 3.代码重构                                                                                  ==
"== | 对多个文件进行统一替换                                                                      ==
"== | :args *.txt                                                                                 ==
"== | :argdo %s/\(foo([^)]*\))/\1, NULL)/g | update                                               ==
"=======                                                                                     =======
"===================================================================================================

"快捷键定制,双键取自emacs按键方式
"双键示例 nmap模式
" nmap <C-x><C-s> :w!<CR>
" 插入模式
" imap <C-x><C-s> <ESC> :w!<cr>
" 普通,不递归映射模式 ,
" nnoremap ,w :w!<cr>
"保存
nmap <C-x><C-s> :w!<CR>
imap <C-x><C-s> <ESC>:w!<CR>

" 文件另存为
nmap <C-x><C-w> :browse confirm saveas<CR>
imap <C-x><C-w> <ESC>:browse confirm saveas<CR>

" 保存并退出文件
nmap <C-x><C-c> :wqa!<CR>
imap <C-x><C-c> <ESC>:wqa!<CR>

" 不保存退出文件
nmap <C-x><C-q> :qa!<CR>
imap <C-x><C-q> <ESC>:qa!<CR>

" 打开文件
nmap <C-x><C-f> :browse confirm e<CR>
imap <C-x><C-f> <ESC>:browse confirm e<CR>

" 打开文件
nmap <C-x><C-f> :browse confirm e<CR>
imap <C-x><C-f> <ESC>:browse confirm e<CR>

" 建立tag文件
nmap <C-x><C-n>  :!ctags -R .<CR>
imap <C-x><C-n> <ESC>:!ctags -R .<CR>

" 修改 _vimrc 后自动生效 
autocmd! bufwritepost _vimrc source %

"===========《判断是什么样的系统》============================
"选择操作系统(os){{{
function! OSX()
    return has('macunix')
endfunction
function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
function! WINDOWS()
    return (has('win16') || has('win32') || has('win64'))
endfunction
"}}}

if WINDOWS()
	set nocompatible
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function MyDiff()
  	let opt = '-a --binary '
  	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  	let arg1 = v:fname_in
  	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  	let arg2 = v:fname_new
  	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  	let arg3 = v:fname_out
  	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  	if $VIMRUNTIME =~ ' '
    	if &sh =~ '\<cmd'
      		if empty(&shellxquote)
        		let l:shxq_sav = ''
        		set shellxquote&
      		endif
      		let cmd = '"' . $VIMRUNTIME . '\diff"'
    	else
      		let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    	endif
  	else
    		let cmd = $VIMRUNTIME . '\diff'
  	endif
  	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  	if exists('l:shxq_sav')
    		let &shellxquote=l:shxq_sav
  	endif
  endfunction
endif

"视图
"set completeopt=menuone            "关闭函数preview预览窗口
set completeopt=longest,menu 		"打开函数preview预览窗口
"set previewwindow    				" 标识预览窗口,开启后 python会报错

filetype plugin indent on
syntax on
"map
let mapleader = ","
let g:mapleader = ","
" 快速保存
nmap <leader>w :w!<cr>

"=========================语言与编码===========================
set helplang=cn                 	"中文帮助
set fileencodings=utf-8,ucs-bom,gbk,gb2312,cp936
set termencoding=utf-8  
set ffs=unix,dos,mac				"使用UNIX的标准文件类型
set imcmdline 

"=================《公共配置》=================================
set nocompatible                	"不使用vi模式"
set linespace=0                 	"字符间插入的像素行数目
set nu
set showmode "Show current mode down the bottom
set gcr=a:blinkon0 "Disable cursor blink
if has('mouse')
  set mouse=a
endif
if LINUX()
  set clipboard=unnamedplus     "复制文件
elseif WINDOWS()
  set clipboard+=unnamed        "共享粘贴板
endif
set showcmd                     " 输入的命令显示出来
nnoremap <C-F2> :vert diffsplit "比较文件
set autoread                    " 设置当文件被改动时自动载入
set magic                       " 设置魔术
set hid
set history=1000
" 快速保存
nmap <leader>w :w!<cr>
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set cmdheight=2

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"================《缩进设置》===================================
set ts=2                           "tab 用空格表示,对python编程尤其重要,因为python是以缩进来局限代码块的
set shiftwidth=4		       "缩进为4个空格
set autoindent			"每行的缩进值与上一行相等
set expandtab                      "将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
%retab!
set smarttab

set foldmethod=indent              "折叠方式是使用语法折叠
set foldlevel=100                   "折叠的层次是100,也就是打开所有的折叠

"=================《外观设置》===============================
if WINDOWS()
  au GUIEnter * simalt ~x       "窗口全屏
  set columns=80
elseif LINUX()
    autocmd GUIEnter * winsize 167 41
endif

"==============《配色主题》==============
set t_Co=256


set cursorline                              "高亮所在行
"set cursorcolumn                           "高亮当前列
set guioptions-=T                           "隐藏工具栏
"set guioptions-=m                          "隐藏菜单
"打开原生菜单
"set wildmenu

set cmdheight=1                             " 命令行（在状态行下）的高度，默认为1

set showmatch                               "高亮显示[] {} ()配对

"--------------------高级技巧---------------------------------
"autocmd BufWritePre * :%s/\s\+$//e "保存文件时自动去除行末空格
"指定文件类型去除行末空格
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
"================《搜索设置》========================================
set incsearch                               "当输入的时候,跳到你搜索的关键字那去
set hlsearch                                "高亮被搜索的关键字
set ignorecase								"搜索模式里忽略大小写
set smartcase        						" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
"=================《字体》================================
if WINDOWS()
    set guifont=courier_new:h11
elseif LINUX()
    " set guifont=DejaVu\Sans\Mono\ 11
    " Droid sans mono需要下载
    set guifont=DroidSansMono\ 11
endif

"性能设置
set lazyredraw 								"不重绘执行宏

" ==============《根据后缀名指定文件类型》================
au BufRead,BufNewFile *.h             setlocal ft=c
au BufRead,BufNewFile *.i             setlocal ft=c
au BufRead,BufNewFile *.m             setlocal ft=objc
au BufRead,BufNewFile *.di            setlocal ft=d
au BufRead,BufNewFile *.ss            setlocal ft=scheme
au BufRead,BufNewFile *.cl            setlocal ft=lisp
au BufRead,BufNewFile *.phpt          setlocal ft=php
au BufRead,BufNewFile *.inc           setlocal ft=php
au BufRead,BufNewFile *.sql           setlocal ft=mysql
au BufRead,BufNewFile *.tpl           setlocal ft=smarty
au BufRead,BufNewFile *.txt           setlocal ft=txt
au BufRead,BufNewFile *.log           setlocal ft=conf
au BufRead,BufNewFile hosts           setlocal ft=conf
au BufRead,BufNewFile *.conf          setlocal ft=nginx
au BufRead,BufNewFile http*.conf      setlocal ft=apache
au BufRead,BufNewFile php-fpm*.conf   setlocal ft=dosini
au BufRead,BufNewFile *.ini           setlocal ft=dosini
"鼠标样式
set so=7

"------------声音---------------
set vb t_vb=                            "去除报警音
set noerrorbells
set novisualbell
set tm=500

"====文件============
set clipboard+=unnamed                  " 共享剪贴板
set showtabline=2                       "以标签形式打开文件
autocmd BufNewFile * normal G           "新建文件后 自动定位到文件末尾
"关闭临时文件和备份
set nobackup                            "禁止生成临时文件
set nowb
setlocal noswapfile                     "不要生成swap文件
"set wrap                               	"自动折行
"set textwidth=79

"保存文件后重新载入文件
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"=========控制退格键======="
set backspace=indent,eol,start          
set whichwrap+=<,>,h,l


"安装vundle管理插件，先安装git再安装vundle
if WINDOWS()             "安装:git clone https://github.com/gmarik/vundle.git
  set runtimepath+=$VIM/vimfiles/bundle/vundle    		" 此处规定vundle的路径
    call vundle#begin(expand('$VIM/vimfiles/bundle/')) 	"插件安装位置
elseif LINUX()             "安装:git clone https://github.com/gmarik/vundle.git
  set rtp+=~/.vim/bundle/vundle         			" 此处规定vundle的路径
    call vundle#begin(expand('~/.vim/bundle/'))   		"插件安装位置
endif
Plugin 'gmarik/vundle'       							"必须启用
Plugin 'taglist.vim'                     				"Tlist 函数列表
let g:Tlist_Use_Right_Window = 1						"位置右栏
"let Tlist_Auto_Open=1									"打开vim时启动

Plugin 'wesleyche/SrcExpl'								"窗口文件着色
nmap <F8> :SrcExplToggle<CR> 
let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
    \ ] 
let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsKey = "<F12>" 
let g:SrcExpl_prevDefKey = "<F6>" 
let g:SrcExpl_nextDefKey = "<F4>" 
set tags=tags;                          " ';' 不能没有

"文件,项目查找,搜索
Plugin 'mileszs/ack.vim'					"工程查找
"使用方法: Ack [options] {pattern} [{directories}]
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

	" 快捷键
	" ?    a quick summary of these keys, repeat to close
	" o    to open (same as Enter)
	" O    to open and close the quickfix window
	" go   to preview file, open but maintain focus on ack.vim results
	" t    to open in new tab
	" T    to open in new tab without moving to it
	" h    to open in horizontal split
	" H    to open in horizontal split, keeping focus on the results
	" v    to open in vertical split
	" gv   to open in vertical split, keeping focus on the results
	" q    to close the quickfix window

if LINUX()	
	Plugin 'rking/ag.vim'							"代码搜索,提供上下文搜索
	let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"
	let g:ag_working_path_mode="r"
endif


Plugin 'ctrlpvim/ctrlp.vim'						"ctrl p查找
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows


"界面
Plugin 'junegunn/vim-github-dashboard.git'
" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'corntrace/bufexplorer'
"QuickFix窗口
nmap <F6> :cn<cr>							"// 切换到下一个结果
nmap <F7> :cp<cr>							"// 切换到上一个结果
Plugin 'scrooloose/nerdtree'             	"树形目录
nmap <F3> :NERDTreeToggle<CR>               "F9调出
let NERDTreeWinSize=25  
let g:NERDTreeHight= 30
let g:NERDTreeMouseMode = 1
set autochdir
Plugin 'fholgado/minibufexpl.vim'
    " MiniBufExpl Colors
    hi MBENormal               guifg=#808080 guibg=fg
    hi MBEChanged              guifg=#CD5907 guibg=fg
    hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
    hi MBEVisibleChanged       guifg=#F1266F guibg=fg
    hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
    hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"

"========================================<IDE>========================
"colorscheme
"colorscheme murphy
Plugin 'mhinz/vim-startify'				"显示最近使用的文件列表
Plugin 'vim-scripts/sessionman.vim'		"session管理
let g:session_menu = 1
"q                        - close session list
"o, <CR>, <2-LeftMouse>   - open session
"d                        - delete session
"e                        - edit session
"x                        - edit extra session script
"{

"AWK,Bash,C/C++,LaTeX,Perl ,Vim-Script  IDE并集成git插件
Plugin 'WolfgangMehner/vim-plugins'        

Plugin 'jceb/vim-orgmode'  

Plugin 'scrooloose/syntastic'            	"语法检查
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 			"自动开启检查
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_delete_output = 0
let g:syntastic_java_javac_config_file_enabled = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
Plugin 'syngan/vim-vimlint', {
            \ 'depends' : 'ynkdir/vim-vimlparser'}
let g:syntastic_vimlint_options = { 
            \'EVL102': 1 ,
            \'EVL103': 1 ,
            \'EVL205': 1 ,
            \'EVL105': 1 ,
            \}

Plugin 'Raimondi/delimitMate'                "补全括号和引号
Plugin 'majutsushi/tagbar'                   "tagbar
let g:tagbar_sort = 0                        "关闭排序[也就是按标签本身在文件中的位置排序]
"let g:tagbar_show_linenumbers = -1          "显示行号
let g:tagbar_width=30
let g:tagbar_left = 1


"快速文件切换插件a.vim 
Plugin 'vim-scripts/a.vim'		
" 撤销
Plugin 'mbbill/undotree'                 "撤销树
Plugin 'sjl/gundo.vim'                   "查看撤销树,类似版本控制系统,可恢复到某一阶段
nnoremap <F7> :GundoToggle<CR>
" 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
let g:tagbar_autopreview = 1
"状态栏
Plugin 'bling/vim-airline'               "状态栏美化
"Plugin  'Lokaltog/vim-powerline'         "状态栏增强
Plugin 'itchyny/lightline.vim'           "状态栏横条美化
set laststatus=2                      	 "总是显示状态栏
set ruler                                   " 显示光标当前位置

Plugin 'pbrisbin/vim-mkdir'				 "新建文件时,自动创建不存在的目录
"编辑
Plugin 'xolox/vim-misc'

Plugin 'terryma/vim-multiple-cursors'    "多光标编辑
    " 默认设置
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    
" neocomplete补全
if has('lua')
	Plugin 'Shougo/neocomplete.vim'
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
		let g:neocomplete#keyword_patterns['default'] = '\h\w*'
		" Plugin key-mappings.
		inoremap <expr><C-g>     neocomplete#undo_completion()
		inoremap <expr><C-l>     neocomplete#complete_common_string()
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
endif
Plugin 'donnemartin/dev-setup'
"终端
Plugin 'Shougo/vimshell.vim'

"---------------------------------
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3366ff'
let g:indentLine_char = '|'
Plugin 'danro/rename.vim'                "重命名插件
Plugin 'jiangmiao/auto-pairs'            "自动插入和格式化方括号和圆括号
Plugin 'vim-scripts/matchit.zip'         "\ %匹配成对的标签，跳转

"代码块
Plugin 'msanders/snipmate.vim'           "spipmate代码片段

Plugin 'nathanaelkane/vim-indent-guides'

"添加环绕
Plugin 'tpope/vim-surround'                  "快速给词加环绕符号,例如引号

Plugin 'godlygeek/tabular'                   " Tabular: 自动对齐。

Plugin 'shemerey/vim-project'                "项目管理

Plugin 'ervandew/supertab'                   "按<tab>可实现代码提示
"使用tab可补全,使用supertab不占用<tab>键
let g:SuperTabRetainCompletionType = 2 
let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 

"go语言
Plugin 'fatih/vim-go'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"

"go 检查
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


"==================python IDE============
"Plugin 'klen/python-mode'
" Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
"let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
"let g:pymode_doc_bind = "<C-S-d>"


"快速跳转
Plugin 'easymotion/vim-easymotion'
" Gif config
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    let g:EasyMotion_use_smartsign_us = 1 " US layout
    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"--------------------《web 插件》--------------------------------------
Plugin 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
Plugin 'mattn/emmet-vim'                         "emmet 速写
let g:user_emmet_install_global = 0                                
autocmd FileType html,css EmmetInstall              "只在html和css中启用
let g:user_zen_mode='a'
let g:user_emmet_expandabbr_key='<c-e>'             "更改默认按键
let g:user_emmet_complete_tag=1
let g:user_emmet_next_key='<c-n>'
let g:user_emmet_prev_key='<c-p>'
Plugin 'docunext/closetag.vim'                    	"关闭标签
"-----------------------java ide -------------------------------------
Plugin 'fedkey/vjde' "vjde
Plugin 'fedkey/maven-ide' "vim maven 插件
Plugin 'wsdjeg/java_getset.vim'
Plugin 'vim-scripts/JavaBrowser'
Plugin 'vim-jp/vim-java'
Plugin 'vim-scripts/Vim-JDE'
Plugin 'jostillmanns/javacomplete'
Plugin 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"other
Plugin 'evanmiller/nginx-vim-syntax'                "nginx
call vundle#end()

"=============<自定义命令>================
filetype plugin indent on                           " 开启自动检测文件类型
autocmd BufNewFile *.cpp,*.sh,*.py,*.java,*.php  exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,"\#!/bin/bash")
        call append(1,"# 作者:" .    "  fedkey")
        call append(2,"# 邮箱:" .    "  fedkey@sina.com")
        call append(3,"# 博客:" .    "  huimingcc.com")
        call append(4,"# 创建日期:" .strftime("%Y-%m-%d"))

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(1,"# coding=utf-8")
        call append(2, "\"\"\"")
    call append(3,"文件名:      ".expand("%"))
        call append(4,"创建日期:    " . strftime("%Y-%m-%d"))
      call append(5,"作者:        fedkey")
      call append(6,"邮箱:        fedkey@sina.com")
        call append(7,"博客：       huimingcc.com")
        call append(8, "\"\"\"")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")

     elseif &filetype == 'php'
    call setline(1, "<?php")
    call append(line("."),"/*")
    call append(line(".")+1,"文件名:  ".expand("%"))
    call append(line(".")+2,"作者:    fedkey")
    call append(line(".")+3,"邮箱:    fedkey@sina.com ")
    call append(line(".")+4,"博客:    huimingcc.com ")
    call append(line(".")+5,"创建日期:" . strftime("%Y-%m-%d"))
    call append(line(".")+6, "*/")
  endif
  if expand("%:e") == 'cpp'
    call setline(1, "#include<iostream>")
    call append(line("."), "using namespace std;")
    call append(line(".")+1, "")
  endif

  if expand("%:e") == 'java'
      call setline(1,"/*")
    call append(1, "\"\"\"")
    call append(2,"文件名:      ".expand("%"))
    call append(3,"创建日期:    " . strftime("%Y-%m-%d"))
    call append(4,"作者:        fedkey")
    call append(5,"邮箱:        fedkey@sina.com")
    call append(6,"博客：       huimingcc.com")
    call append(7,"*/")
    call append(8,"public class ".expand("%<"))
    call append(9,"{")
    call append(10,"    public static void main(String[] args)")
    call append(11,"    {")
    call append(12,"        //todo")
    call append(13,"    }")
    call append(14, "}")
  endif

	if &filetype == 'c'
        call setline(1,"#include<stdid.h>")
    endif
endfun
autocmd BufNewFile * normal G

"====F5 一键运行=====
func! RunScript()
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'c'
		if LINUX()
			exec "w"
			exec "!gcc -g % -o  %< && ./%<"
		elseif WINDOWS() "添加dgb
			exec "w"
      exec "!gcc %<"
			exec "! %<.exe"
		endif
		
    elseif &filetype == 'cpp'
		if LINUX()
			exec "w"
			exec "!gcc -g % -o %< && ./%<"
		elseif WINDOWS()
			exec "!gcc -g % -o %< && %<"
		endif
		"golang
	elseif &filetype == 'go'
		if LINUX()
			exec "w"
			exec "!go build % && ./%<"
		elseif WINDOWS()
			exec "!go build % && !%<"
		endif
	elseif &filetype == 'java'
		exec "!javac % && java %<"

    endif
endfunc
map <F5> :call RunScript()<CR>

"设置自定义字典
"au FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
"set complete-=k complete +=k
