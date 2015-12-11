" -----------------     作者: 杨圣亮
" -----------------     邮箱: fedkey@sina.com
" -----------------     博客: http://yangshengliang.com
" -----------------     创建: 2015年10月22日
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

" 快速定位到行末
imap <C-e> <ESC> A

" 快速定位到行首
imap <C-a> <ESC> I

" 转换成16进制
nmap ,ox :%!xxd<CR>
" 恢复原始制式
nmap ,-ox :%!xxd -r<CR>

"===========《判断是什么样的系统》============================"
function! Mysys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunctio

set completeopt=menuone            "关闭顶部函数参数提示窗口
set completeopt=longest,menu 

"=========================语言与编码===================================
set helplang=cn		            	"中文帮助
if Mysys() == 'windows'
	set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936	"自动识别文件编码
elseif Mysys() == 'linux'
	set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936	"自动识别文件编码
endif
if Mysys() == 'windows'             "winodws系统下执行的配置
    "解决菜单乱码
    set encoding=utf-8  
    set fileencoding=chinese  
	source $VIMRUNTIME/vimrc_example.vim
	" source $VIMRUNTIME/mswin.vim  不使用win的快捷键
    "解决consle输出乱码  
    language messages zh_CN.utf-8  
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
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
		let cmd = '""' . $VIMRUNTIME . '\diff"'
		let eq = '"'
		else
		let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction

endif

"=================《公共配置》==================================
set nocompatible  	            "不使用vi模式"
set linespace=0 	            "字符间插入的像素行数目
set nu
set mouse=a            		    "启动对鼠标的支持
if Mysys() == 'linux'
	set clipboard=unnamedplus   "复制文件
elseif Mysys() == 'windows'
	set clipboard+=unnamed 	    "共享粘贴板
endif
set showcmd                     " 输入的命令显示出来
nnoremap <C-F2> :vert diffsplit "比较文件
set autoread                    " 设置当文件被改动时自动载入
set magic                       " 设置魔术
"语法高亮"
syntax on                       "允许用指定语法高亮
syntax enable                   " 打开语法高亮
filetype plugin indent on       " 开启自动检测文件类型
"=======================自动保存session=========================== 
"自动保存session
if Mysys() == 'linux'
    autocmd VimLeave * mks!  ~/_session.vim
    if exists("session.vim")
        autocmd set  VimEnter * source! ~/_session.vim 
    endif
endif
if Mysys() == 'windows'
    autocmd VimLeave * mks!  $VIM/_session.vim
    if exists("session.vim")
        autocmd set  VimEnter * source! $VIM/_session.vim 
    endif
endif
" 打开上次关闭的文件
" <C-o><C-o><cr>
" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"================《缩进设置》===================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab                 	    "将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set foldmethod=indent		        "折叠方式是使用语法折叠
"set foldlevel=100 			        "折叠的层次是100,也就是打开所有的折叠
"=================《外观设置》===================================
if Mysys() == 'windows'
	au GUIEnter * simalt ~x 	    "窗口全屏
	set columns=80
elseif Mysys() == 'linux'
    autocmd GUIEnter * winsize 167 41
endif

set gcr=n-v-c:ver2-Cursor/lCursor,ve:ver1-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor

"插入模式时是黑色
au InsertLeave * hi Cursor guibg=black

"离开插入模式时是蓝色
au InsertEnter * hi Cursor guibg=blue
set laststatus=2				    "总是显示状态栏
set ruler						    " 显示光标当前位置
set cursorline 					    "高亮所在行
"set cursorcolumn 				    "高亮当前列
set guioptions-=T				    "隐藏工具栏
"set guioptions-=m				    "隐藏菜单
set cmdheight=1					    " 命令行（在状态行下）的高度，默认为1
highlight OverLength ctermbg=red ctermfg=white guibg=#592929  "一行多于79个字符,红色警告
match OverLength /\%79v.\+/
set showmatch                       "高亮显示[] {} ()配对

"--------------------高级技巧-------------------------------------
"autocmd BufWritePre * :%s/\s\+$//e "保存文件时自动去除行末空格
"指定文件类型去除行末空格
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
"================《搜索设置》========================================
set incsearch                       "当输入的时候,跳到你搜索的关键字那去
set hlsearch                        "高亮被搜索的关键字

"=================《字体》=======================================
if Mysys() == 'windows'
    set guifont=courier_new:h11
elseif Mysys() == 'linux'
    " set guifont=DejaVu\Sans\Mono\ 11
    " Droid sans mono需要下载
    set guifont=DroidSansMono\ 11
endif

" ==============《根据后缀名指定文件类型》============================
au BufRead,BufNewFile *.h           	setlocal ft=c
au BufRead,BufNewFile *.i           	setlocal ft=c
au BufRead,BufNewFile *.m           	setlocal ft=objc
au BufRead,BufNewFile *.di          	setlocal ft=d
au BufRead,BufNewFile *.ss          	setlocal ft=scheme
au BufRead,BufNewFile *.cl          	setlocal ft=lisp
au BufRead,BufNewFile *.phpt        	setlocal ft=php
au BufRead,BufNewFile *.inc         	setlocal ft=php
au BufRead,BufNewFile *.sql         	setlocal ft=mysql
au BufRead,BufNewFile *.tpl         	setlocal ft=smarty
au BufRead,BufNewFile *.txt         	setlocal ft=txt
au BufRead,BufNewFile *.log         	setlocal ft=conf
au BufRead,BufNewFile hosts         	setlocal ft=conf
au BufRead,BufNewFile *.conf        	setlocal ft=nginx
au BufRead,BufNewFile http*.conf    	setlocal ft=apache
au BufRead,BufNewFile php-fpm*.conf 	setlocal ft=dosini
au BufRead,BufNewFile *.ini         	setlocal ft=dosini

"==============《配色主题》============================================
" Solarized主题设置
    " git clone git://github.com/altercation/vim-colors-solarized.git
" ------------------------------------------------------------------
let g:solarized_underline=0                 "default value is 1
let g:solarized_contrast="high"             "default value is normal
let g:solarized_visibility="high"           "default value is normal
let g:solarized_diffmode="high"             "default value is normal
syntax enable
set background=light
colorscheme solarized
" solarized 设置
 let g:solarized_termcolors= 256
 let g:solarized_termtrans=0
 let g:solarized_degrade=0
 let g:solarized_bold=1
 let g:solarized_italic=1
 let g:solarized_termcolors=16
 let g:solarized_hitrail=0
 let g:solarized_menu=1

"------------声音---------------
set vb t_vb=		                        "去除报警音
"====文件============
set clipboard+=unnamed                      " 共享剪贴板
set showtabline=2					        "以标签形式打开文件
autocmd BufNewFile * normal G		        "新建文件后 自动定位到文件末尾
set nobackup						        "禁止生成临时文件
setlocal noswapfile					        "不要生成swap文件
set wrap							        "自动换行
"=========按键======="
set backspace=indent,eol,start              "使用退格键

"===========《插件及配置》==========================="
"安装neobundle管理插件，先安装git再安装neobundle
if Mysys() == 'windows'  					 "安装:git clone https://github.com/Shougo/neobundle.vim.git
	set runtimepath+=$VIM/vimfiles/bundle/neobundle.vim 	 " 此处规定neobundle的路径
    call neobundle#begin(expand('$VIM/vimfiles/bundle/')) "插件安装位置
elseif Mysys() == 'linux'  					 "安装: git clone https://github.com/Shougo/neobundle.vim.git
	set runtimepath+=~/.vim/bundle/neobundle.vim/ 	 		 " 此处规定neobundle的路径
    call neobundle#begin(expand('~/.vim/bundle/'))   "插件安装位置
endif
NeoBundleFetch 'Shougo/neobundle.vim' 		"必须启用
"==========《Vundle.vim命令说明》"
":NeoBundleList - 插件列表
":NeoBundleInstall - 安装 (更新) bundles
":NeoBundleClean - confirm (or auto-approve) 移除不使用的插件

NeoBundle 'vim-scripts/winmanager--Fox'     "winmanager窗口管理
"设置winmanager的宽度，默认为25
"let g:winManagerWidth = 15
let g:AutoOpenWinManager = 1                "自动打开winmanager
let Tlist_Exit_OnlyWindow=1  

"界面分隔
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList" 
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
function! NERDTree_IsValid()  
    return 1  
endfunction  

NeoBundle  'vim-scripts/bufexplorer.zip'    "显示buf列表
"let g:bufExplorerSortBy = 'name'		    " 按文件名排序
NeoBundle  'tisyang/taglist'				"Tlist 函数列表
let Tlist_Use_SingleClick=1                 "单击tag就跳到tag定义的位置
let Tlist_Show_Menu=1                       "显示taglist菜单
let Tlist_Auto_Open=0					    "默认打开Taglist
"let Tlist_Show_One_File = 	 1              "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow =  1              "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1              "在右侧窗口中显示taglist窗口
let Tlist_Compart_Format = 1    		    " 压缩方式
let Tlist_WinWidth = 30
set autochdir
if Mysys() == 'windows'
    set tags=tags;                          " ';' 不能没有
    let Tlist_Ctags_Cmd = 'ctags'
endif
NeoBundle 'kien/ctrlp.vim'                  "快速搜索/文件
NeoBundle 'scrooloose/nerdtree'			         "树形目录
"map <F9> :NERDTreeToggle<CR>               "F9调出
let g:NERDTreeWinSize = 30
let g:NERDTreeHight= 30
let g:NERDTreeMouseMode = 1
let g:NERDTreeMapToggleZoom = '<Space>'

autocmd VimEnter * WMToggle                 "自动开启WMToggle
autocmd VimEnter * wincmd w		            "光标停留右侧文件
command  WM :WMToggle

" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"========================================<IDE>========================================
NeoBundle 'tpope/vim-fugitive'				"git集成
NeoBundle 'scrooloose/syntastic'			"语法检查
NeoBundle 'Raimondi/delimitMate'			"补全括号和引号
NeoBundle  'airblade/vim-gitgutter'         "显示git 更改
NeoBundle 'majutsushi/tagbar'				"tagbar
let g:tagbar_sort = 0					    "关闭排序[也就是按标签本身在文件中的位置排序]
let g:tagbar_show_linenumbers = -1		    "显示行号
NeoBundle 'vim-scripts/YankRing.vim'        "剪贴板增强
NeoBundle 'sjl/gundo.vim'                   "查看撤销树,类似版本控制系统,可恢复到某一阶段
nnoremap <F2> :GundoToggle<CR>
" 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
let g:tagbar_autopreview = 1
NeoBundle 'tomasr/molokai'					"molokai配色
NeoBundle 'bling/vim-airline'				"状态栏美化
NeoBundle  'Lokaltog/vim-powerline'		    "状态栏增强
NeoBundle 'terryma/vim-multiple-cursors'	"多光标多行编辑
    " 默认设置
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    "使用方法
    "fp跳到p处
    "按下 <C-n> 选中光标下的单词
    "继续按下 <C-n> 两次选中另外两个相同的单词
    "按下c进行修改
    "键入修改
    "按下 <Esc> 退出
    "在普通模式下，按下 Ctrl-n 开始进入可视模式并选中光标下的单词，继续按 Ctrl-n 选择下一个相同的单词，按下 Ctrl-p 往回选一个， Ctrl-x 则跳过下一个相同单词。
    "    按下V选中整行
    "按下G到达末行
    "按下 <C-n> 在每行的开头加上一个光标并返回普通模式
    "按下I在每行的头部插入
    "键入”, 按下 <C-e> 到达行末, 键入另一个”和逗号
    "然后将每个光标都下移一行，按下delete
NeoBundle 'yegappan/mru'		                "使用:MRU命令调出最近打开的文档
highlight link MRUFileName LineNr
let MRU_Max_Entries = 100

NeoBundle 'tomtom/tcomment_vim'                 "快速注释

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3366ff'
let g:indentLine_char = '|'
NeoBundle 'danro/rename.vim'                    "重命名插件
NeoBundle 'jiangmiao/auto-pairs'				"自动插入和格式化方括号和圆括号
NeoBundle 'vim-scripts/matchit.zip'             "\ %匹配成对的标签，跳转

"添加环绕
NeoBundle 'tpope/vim-surround'                      "快速给词加环绕符号,例如引号
"{{
"使用方法： ysiw"   "可用任意符号代替
"yssb  可以快速为一行包围圆括号 比如 yss" 为一行包围双引号
"cs 指令可以更改包围, 比如 cs'" 是将单引号变成双引号, cs"( 是将双引号变成圆括号
"ds 指令可以取出包围, 后面需跟包围的内容, ds" 是去除双引号包围, ``
"普通模式
"-----------
"ds  - 删除一个环绕
"cs  - 改变一个环绕
"ys  - 添加一个环绕
"yS  - 添加一个环绕和地方被包围的文本从新的一行+缩进
"yss - 添加一个环绕
"ySs - 加上周围的环绕，放置到一个新的行+缩进
"ySS - 同 ySs

"可视模式
"-----------
"s   - 添加一个环绕
"S   - 添加一个新的环绕文本+缩进
"插入模式
"-----------
"<CTRL-s> - 添加一个环绕
"<CTRL-s><CTRL-s> - 添加一个新的环绕文本+缩进
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>
"}}

NeoBundle 'ianva/vim-youdao-translater'        "有道翻译
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>
NeoBundle 'godlygeek/tabular'                   " Tabular: 自动对齐。

NeoBundle 'shemerey/vim-project'                "项目管理
NeoBundle 'atom/vim-mode'                       "vim-mode
NeoBundle 'ervandew/supertab'                   "按<tab>可实现代码提示
NeoBundle 'Shougo/neocomplcache.vim'            "终极代码补全
let g:acp_enableAtStartup = 0                   "禁用自启
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
 "Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP              "php补全
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#Complete                     "python 用jedi补全
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"==================python IDE======start======
let python_highlight_all = 1                    "python高亮
NeoBundle 'vim-scripts/indentpython.vim'        "python自动缩进
"{{
NeoBundle 'nvie/vim-flake8'                     "python代码检查
	"pip install flake8
	"<F7> to run flake8
	let g:flake8_quickfix_location="top"
	let g:flake8_quickfix_height=7
	let g:flake8_show_quickfix=1
	let g:flake8_show_in_gutter=1
	let g:flake8_show_in_file=1
	let g:flake8_max_markers=500
	let flake8_error_marker='Δ'                "错误提示符号
	let flake8_warning_marker='×'              "警告提示符号
	let flake8_pyflake_marker=''                " 是否屏蔽警告
	let flake8_complexity_marker=''             "屏蔽 McCabe complexity 警告
	let flake8_naming_marker=''                 "屏蔽 naming 警告
"}}

NeoBundle 'davidhalter/jedi-vim'		        "python补全,需要安装:pip install jedi
"pip install jedi
"pip install tox pytest
let g:jedi#use_tabs_not_buffers = 1

NeoBundle 'msanders/snipmate.vim'               "spipmate代码片段

NeoBundle 'tyru/open-browser.vim'               "打开浏览器
"--------------------《web 插件》--------------------------------------
"web缩进
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
NeoBundle 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END
NeoBundle 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundle 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
NeoBundle 'mattn/emmet-vim'                        "emmet 速写
let g:user_emmet_install_global = 0                                
autocmd FileType html,css EmmetInstall              "只在html和css中启用
let g:user_emmet_expandabbr_key='<c-j>'  	        "更改默认按键
let g:user_emmet_complete_tag=1
let g:user_emmet_next_key='<c-n>'
let g:user_emmet_prev_key='<c-p>'
NeoBundle 'docunext/closetag.vim'                   "关闭标签
NeoBundle 'othree/xml.vim'							"xml插件
"NeoBundle 'ternjs/tern_for_vim'                     "tern js补全
NeoBundle 'cakebaker/scss-syntax.vim'               "scss css检查
au BufRead,BufNewFile *.scss set filetype=scss.css
NeoBundle 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
"----------javascript-----------------------
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nono/jquery.vim'                         "jquery高亮
NeoBundle 'elzr/vim-json'                           "json高亮
NeoBundle 'guileen/vim-node-dict'					"Node.js 字典
NeoBundle 'maksimr/vim-jsbeautify'                  "JS代码格式化
"django
NeoBundle 'django_templates.vim'
NeoBundle 'Django-Projects'

"--------------------PHP IDE-----------------------------------------------

" ======================《针对部分语言添加字典补全》=======================
"autocmd FileType c          call AddCDict()
"if Mysys() == 'windows'
"	function AddCDict()
"        setlocal dict+=$VIM/vimfiles/dict/c.txt
"	endfunction
"
"	function AddCPPDict()
"        setlocal dict+=$VIM/vimfiles/dict/c.txt
"        setlocal dict+=$VIM/vimfiles/dict/cpp-stdlib.txt
"        setlocal dict+=$VIM/vimfiles/dict/cpp-boost.txt
"	endfunction
"
"elseif Mysys() == 'linux'
"	function AddCDict()
"        setlocal dict+=~/.vim/dict/c.txt
"	endfunction
"endif
NeoBundleCheck
call neobundle#end()                        "用于所有插件最后
"=========================================《实用设置》=================================="
"单词纠正
":abbr Lunix Linux
":abbr accross across
"=========================================<自定义命令>==================================="
command T :tabnew | WMToggle	"打开新标签页,并加载WMToggle

filetype plugin indent on       " 开启自动检测文件类型
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.c,*.cpp,*.[ch],*.sh,*.py,*.php  exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
        call append(1,"# 作者:" .    "  杨圣亮")
        call append(2,"# 邮箱:" .    "  fedkey@sina.com")
        call append(3,"# 博客:" .    "  yangshengliang.com")
        call append(4,"# 创建日期:" .strftime("%Y-%m-%d"))

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(1,"# coding=utf-8")
        call append(2, "\"\"\"")
		call append(3,"文件名:      ".expand("%"))
        call append(4,"创建日期:    " . strftime("%Y-%m-%d"))
	    call append(5,"作者:        杨圣亮")
	    call append(6,"邮箱:        fedkey@sina.com")
        call append(7,"博客：       yangshengliang.com")
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
		call append(line(".")+4,"博客:    yangshengliang.com ")
		call append(line(".")+5,"创建日期:" . strftime("%Y-%m-%d"))
		call append(line(".")+6, "*/")
	endif
	if expand("%:e") == 'cpp'
		call setline(1, "#include<iostream>")
		call append(line("."), "using namespace std;")
		call append(line(".")+1, "")
	endif
	if &filetype == 'c'
        call setline(1,"#include<stdid.h>")
    endif
	if expand("%:e") == 'h'
		call setline(1, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line("."), "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+1, "#endif")
	endif
endfun
autocmd BufNewFile * normal G
"==========================================F5 一键运行=====================================================
func! RunScript()
if &filetype == 'python'
    exec "!python %"
endif
endfunc
map <F5> :call RunScript()<CR>

"技巧
"文本单词中添加符号,如：wwflwlf/fwfwekfek kfwkeowofeowoee 想在wwflwlf/fwfwekfek前后加一个双引号
"操作,光标定位到wwf处：vt空格 S"   以此类推,可以快速添加其他的符号 
