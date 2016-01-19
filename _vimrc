scriptencoding utf-8
"-----------------      作者: 杨圣亮
"-----------------      邮箱: fedkey@sina.com
" -----------------     博客: http://huimingcc.com
"系统依赖
"linux-fedora
"sudo yum install ctags
"sudo yum install build-essential cmake python-dev  #编译YCM自动补全插件依赖
"sudo yum install silversearcher-ag
"软件安装
"python2.7  许多插件依赖python2.7,必装
"java       sudo yum install openjdk-8-jdk
"npm        sudo yum install npm
"clang      sudo yum install clang
"cmake      sudo yum install cmake
"python-dev sudo yum install pythoon-dev
"gvim       sudo yum install vim-gtk
" Ctrl + K                   --光标移上一行末尾
" Ctrl + H                   --光标移行首
" Ctrl + L                   --光标移行尾
" Ctrl + Z                   --取代ESC模式键 [和Lingos快捷键有冲突]
" Ctrl + S                   --保存文件
" Ctrl + C                   --编译 [支持C/C++、Java]
" Ctrl + R                   --运行 [支持C/C++、Java、Lua、Perl、Python、Ruby]
" Ctrl + ]                   --转到函数定义
" Ctrl + T                   --返回调用函数
" Ctrl + E                   --添加注释 [插入模式] [添加的是C语言的多行注释，所以适用于C/C++/Java等]
" Ctrl + E                   --一步加载语法模板和作者、时间信息 [非插入模式]
" <C-P>                      --单词补全
" <C-X><C-L>                 --整行补全
" Tab键                      --插入模式下的全功能语法结构补全 [snipMate插件]
" wm                         --开启文档浏览窗口
" \ww                        --进入vimWiki模式
" za                         --打开或关闭当前折叠
" zM                         --关闭所有折叠
" zR                         --打开所有折叠
" :set syntax=cpp            --手动选择语法高亮 [或 :set filetype=cpp]
" :%!xxd                     --转储二进制文件，以十六进制形式显示
" :%!xxd -r                  --还原二进制文件
"使用Python
"sudo pip install pyflakes
"sudo pip install pylint
"sudo pip install pep8

"快捷键定制,双键取自emacs按键方式
"双按键示例 nmap模式
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


" 转换成16进制
nmap ,ox :%!xxd<CR>
" 恢复原始制式
nmap ,-ox :%!xxd -r<CR>


"vim 设置{{{
"initialize default settings
let s:settings = {}
let s:settings.default_indent = 2
let s:settings.max_column = 120
let s:settings.autocomplete_method = 'neocomplcache'
let s:settings.enable_cursorcolumn = 0
"let s:settings.colorscheme = 'jellybeans'

"===========《判断是什么样的系统》============================"
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

"set completeopt=menuone            "关闭顶部函数参数提示窗口
set completeopt=longest,menu 

filetype plugin indent on
syntax on
"=========================语言与编码===================================
set helplang=cn                 "中文帮助
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"=================《公共配置》==================================
set nocompatible                "不使用vi模式"
set linespace=0                 "字符间插入的像素行数目
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
"=======================保存session=========================== 
"保存session
"if LINUX()
"    autocmd VimLeave * mks!  ~/_session.vim
"    if exists("session.vim")
"        autocmd set  VimEnter * source! ~/_session.vim 
"    endif
"endif
"if WINDOWS()
"    autocmd VimLeave * mks!  $VIM/_session.vim
"    if exists("session.vim")
"        autocmd set  VimEnter * source! $VIM/_session.vim 
"    endif
"endif
"" 打开上次关闭的文件
" <C-o><C-o><cr>
" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"================《缩进设置》===================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab                       "将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
"set foldmethod=indent               "折叠方式是使用语法折叠
"set foldlevel=100                  "折叠的层次是100,也就是打开所有的折叠
"web缩进
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"=================《外观设置》===============================
if WINDOWS()
  au GUIEnter * simalt ~x       "窗口全屏
  set columns=80
elseif LINUX()
    autocmd GUIEnter * winsize 167 41
endif

"==============《配色主题》==============
colorscheme molokai "主题文件在vim-colorschemes插件下
set t_Co=256

set laststatus=2                            "总是显示状态栏
set ruler                                   " 显示光标当前位置
set cursorline                              "高亮所在行
"set cursorcolumn                           "高亮当前列
set guioptions-=T                           "隐藏工具栏
"set guioptions-=m                          "隐藏菜单
set cmdheight=1                             " 命令行（在状态行下）的高度，默认为1
set showmatch                               "高亮显示[] {} ()配对
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    if !exists('g:override_spf13_bundles')
        set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
"--------------------高级技巧---------------------------------
"autocmd BufWritePre * :%s/\s\+$//e "保存文件时自动去除行末空格
"指定文件类型去除行末空格
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
"================《搜索设置》========================================
set incsearch                               "当输入的时候,跳到你搜索的关键字那去
set hlsearch                                "高亮被搜索的关键字

"=================《字体》================================
if WINDOWS()
    set guifont=courier_new:h11
elseif LINUX()
    " set guifont=DejaVu\Sans\Mono\ 11
    " Droid sans mono需要下载
    set guifont=DroidSansMono\ 11
endif

" ==============《根据后缀名指定文件类型》=================
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
 
 "------------声音---------------
set vb t_vb=                            "去除报警音
"====文件============
set clipboard+=unnamed                  " 共享剪贴板
set showtabline=2                       "以标签形式打开文件
autocmd BufNewFile * normal G           "新建文件后 自动定位到文件末尾
set nobackup                            "禁止生成临时文件
setlocal noswapfile                     "不要生成swap文件
"set wrap                                "自动折行
"set textwidth=79
"=========按键======="
set backspace=indent,eol,start          "使用退格键


"安装neobundle管理插件，先安装git再安装neobundle
if WINDOWS()             "安装:git clone https://github.com/Shougo/neobundle.vim.git
  set runtimepath+=$VIM/vimfiles/bundle/neobundle.vim    " 此处规定neobundle的路径
    call neobundle#begin(expand('$VIM/vimfiles/bundle/')) "插件安装位置
elseif LINUX()             "安装: git clone https://github.com/Shougo/neobundle.vim.git
  set runtimepath+=~/.vim/bundle/neobundle.vim/        " 此处规定neobundle的路径
    call neobundle#begin(expand('~/.vim/bundle/'))   "插件安装位置
endif
NeoBundleFetch 'Shougo/neobundle.vim'       "必须启用
NeoBundle 'taglist.vim'                     "Tlist 函数列表
let g:Tlist_Use_Right_Window = 1
NeoBundle 'wesleyche/SrcExpl'				"窗口文件着色
nmap <F8> :SrcExplToggle<CR> 
let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
    \ ] 
let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsKey = "<F12>" 
let g:SrcExpl_prevDefKey = "<F3>" 
let g:SrcExpl_nextDefKey = "<F4>" 
set tags=tags;                          " ';' 不能没有

"文件,项目查找,搜索
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kien/ctrlp.vim'                  "快速搜索/文件
NeoBundle 'scrooloose/nerdtree'             "树形目录
nmap <F9> :NERDTreeToggle<CR>               "F9调出
let g:NERDTreeWinSize = 30
let g:NERDTreeHight= 30
let g:NERDTreeMouseMode = 1
let g:NERDTreeMapToggleZoom = '<Space>'
set autochdir
"========================================<IDE>========================================
NeoBundle 'vim-scripts/sessionman.vim'		"session管理
"q                        - close session list
"o, <CR>, <2-LeftMouse>   - open session
"d                        - delete session
"e                        - edit session
"x                        - edit extra session script

"{
NeoBundle 'vim-scripts/vim-babel'
NeoBundle 'mattn/webapi-vim'
""}
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'drmikehenry/vim-fontsize'
NeoBundle 'Mizuchi/vim-ranger'

NeoBundle 'Shougo/unite.vim'          
"git 
NeoBundle 'tpope/vim-fugitive'              "git信息
NeoBundle 'airblade/vim-gitgutter'          "git 插件
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 500
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
NeoBundle 'mattn/gist-vim'
let g:gist_detect_filetype = 1

NeoBundle 'vim-scripts/Align'

NeoBundle 'scrooloose/syntastic'            "语法检查
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"java
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

NeoBundle 'syngan/vim-vimlint', {
            \ 'depends' : 'ynkdir/vim-vimlparser'}
let g:syntastic_vimlint_options = {
            \'EVL102': 1 ,
            \'EVL103': 1 ,
            \'EVL205': 1 ,
            \'EVL105': 1 ,
            \}
NeoBundle 'ynkdir/vim-vimlparser'
NeoBundle 'gcmt/wildfire.vim'
noremap <SPACE> <Plug>(wildfire-fuel)
vnoremap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
NeoBundle 'Raimondi/delimitMate'                "补全括号和引号
NeoBundle 'majutsushi/tagbar'                   "tagbar
let g:tagbar_sort = 0                           "关闭排序[也就是按标签本身在文件中的位置排序]
let g:tagbar_show_linenumbers = -1              "显示行号
let g:tagbar_width=30
let g:tagbar_left = 1
let g:NERDTreeChDirMode=1
nmap <F8> :TagbarToggle<CR>
NeoBundle 'vim-scripts/YankRing.vim'        "剪贴板增强
NeoBundle 'vim-scripts/vimgdb'				"gdb
NeoBundle 'vim-scripts/Conque-GDB' 			
" 撤销
NeoBundle 'mbbill/undotree'                 "撤销树
NeoBundle 'sjl/gundo.vim'                   "查看撤销树,类似版本控制系统,可恢复到某一阶段
nnoremap <F2> :GundoToggle<CR>
" 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
let g:tagbar_autopreview = 1
NeoBundle 'tomasr/molokai'                  "molokai配色
NeoBundle 'bling/vim-airline'               "状态栏美化
NeoBundle  'Lokaltog/vim-powerline'         "状态栏增强
NeoBundle 'itchyny/lightline.vim'           "状态栏横条美化
set laststatus=2

NeoBundle 'terryma/vim-multiple-cursors'     "多光标编辑
    " 默认设置
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    
" neocomplete补全
if has('lua')
	NeoBundle 'Shougo/neocomplete.vim'
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
NeoBundle 'kablamo/VimDebug'

NeoBundle 'tomtom/tcomment_vim'             "快速注释
NeoBundle 'kien/rainbow_parentheses.vim'    "挂号匹配高亮
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3366ff'
let g:indentLine_char = '|'
NeoBundle 'danro/rename.vim'                "重命名插件
NeoBundle 'jiangmiao/auto-pairs'            "自动插入和格式化方括号和圆括号
NeoBundle 'vim-scripts/matchit.zip'         "\ %匹配成对的标签，跳转

"代码块
NeoBundle 'msanders/snipmate.vim'           "spipmate代码片段

NeoBundle 'powerline/fonts'
           NeoBundle 'bling/vim-bufferline'
           NeoBundle 'jistr/vim-nerdtree-tabs'
           NeoBundle 'flazz/vim-colorschemes'
           NeoBundle 'nathanaelkane/vim-indent-guides'
"搜索
NeoBundle 'grep.vim'
" Fast navigation
"-----------------
NeoBundle 'edsono/vim-matchit'
NeoBundle 'Lokaltog/vim-easymotion'

"项目管理
NeoBundle 'tpope/vim-projectionist'             "项目创建
"添加环绕
NeoBundle 'tpope/vim-surround'                  "快速给词加环绕符号,例如引号

NeoBundle 'ianva/vim-youdao-translater'         "有道翻译
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>
NeoBundle 'godlygeek/tabular'                   " Tabular: 自动对齐。
NeoBundle 'vim-scripts/ZoomWin'					"窗口最大化
" Press <c-w>o : 最大化当前窗口
" Press <c-w>o again: 前一组窗口恢复
NeoBundle 'shemerey/vim-project'                "项目管理
NeoBundle 'atom/vim-mode'                       "vim-mode
NeoBundle 'ervandew/supertab'                   "按<tab>可实现代码提示

" ============ c/c++ ide
NeoBundle 'vim-scripts/c.vim'
NeoBundle 'vim-scripts/OmniCppComplete'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'vim-scripts/cpp.vim'
"==================python IDE============
    NeoBundle 'vim-scripts/indentpython.vim'        "python自动缩进
    NeoBundle 'yssource/python.vim'
    NeoBundle 'pythoncomplete'
    "快速跳转
    NeoBundle 'easymotion/vim-easymotion'
    " Gif config
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    let g:EasyMotion_use_smartsign_us = 1 " US layout
    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

    NeoBundle 'davidhalter/jedi-vim'                "python补全,需要安装:pip install jedi
    "pip install jedi
    "pip install tox pytest
    let g:jedi#use_tabs_not_buffers = 1

"--------------------《web 插件》--------------------------------------
NeoBundle 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
NeoBundle 'mattn/emmet-vim'                         "emmet 速写
let g:user_emmet_install_global = 0                                
autocmd FileType html,css EmmetInstall              "只在html和css中启用
let g:user_emmet_expandabbr_key='<c-e>'              "更改默认按键
let g:user_emmet_complete_tag=1
let g:user_emmet_next_key='<c-n>'
let g:user_emmet_prev_key='<c-p>'
NeoBundle 'docunext/closetag.vim'                    "关闭标签
NeoBundle 'othree/xml.vim'                           "xml插件
NeoBundle 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}

"----------javascript-----------------------
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nono/jquery.vim'                         "jquery高亮

call neobundle#end()
NeoBundleCheck

"=============<自定义命令>================
filetype plugin indent on                           " 开启自动检测文件类型
autocmd BufNewFile *.c,*.cpp,*.[ch],*.sh,*.py,*.java,*.php  exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,"\#!/bin/bash")
        call append(1,"# 作者:" .    "  杨圣亮")
        call append(2,"# 邮箱:" .    "  fedkey@sina.com")
        call append(3,"# 博客:" .    "  huimingcc.com")
        call append(4,"# 创建日期:" .strftime("%Y-%m-%d"))

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(1,"# coding=utf-8")
        call append(2, "\"\"\"")
    call append(3,"文件名:      ".expand("%"))
        call append(4,"创建日期:    " . strftime("%Y-%m-%d"))
      call append(5,"作者:        杨圣亮")
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
    call append(line(".")+2,"作者:    杨圣亮")
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
    call append(4,"作者:        杨圣亮")
    call append(5,"邮箱:        fedkey@sina.com")
    call append(6,"博客：       huimingcc.com")
    call append(7, "*/")
  endif

  if &filetype == 'c'
        call setline(1,"#include<stdid.h>")
    endif
endfun
autocmd BufNewFile * normal G
" ====F5 一键运行=====
func! RunScript()
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'c'
        exec "w"
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "w"
        exec "!g++ % -o %<"
        exec "! ./%<"
    endif
endfunc

map <F5> :call RunScript()<CR>

"技巧
"文本单词中添加符号,如：wwflwlf/fwfwekfek kfwkeowofeowoee 想在wwflwlf/fwfwekfek前后加一个双引号
"操作,光标定位到wwf处：vt空格 S"   以此类推,可以快速添加其他的符号 
