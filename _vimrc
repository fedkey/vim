" -----------------     作者: 杨圣亮
" -----------------     邮箱: fedkey@sina.com
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

" 快速定位到行末
imap <C-e> <ESC> A

" 快速定位到行首
imap <C-a> <ESC> I

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
let s:settings.colorscheme = 'jellybeans'

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

set completeopt=menuone            "关闭顶部函数参数提示窗口
set completeopt=longest,menu 

"=========================语言与编码===================================
set helplang=cn                 "中文帮助
if WINDOWS()
  set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936  "自动识别文件编码
elseif LINUX()
  set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936  "自动识别文件编码
endif
if WINDOWS()             "winodws系统下执行的配置
  set nocompatible
  behave mswin
  "解决consle输出乱码  
  language messages zh_CN.utf-8  
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
set nocompatible                "不使用vi模式"
set linespace=0                 "字符间插入的像素行数目
set nu
set showmode "Show current mode down the bottom
set gcr=a:blinkon0 "Disable cursor blink
if has('mouse')
  set mouse=a
endif
if LINUX()
  set clipboard=unnamedplus   "复制文件
elseif WINDOWS()
  set clipboard+=unnamed      "共享粘贴板
endif
set showcmd                     " 输入的命令显示出来
nnoremap <C-F2> :vert diffsplit "比较文件
set autoread                    " 设置当文件被改动时自动载入
set magic                       " 设置魔术
set hid
set history=1000
let mapleader = ","
let g:mapleader = ","
" 快速保存
nmap <leader>w :w!<cr>
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set cmdheight=2
"=======================保存session=========================== 
"保存session
if LINUX()
    autocmd VimLeave * mks!  ~/_session.vim
    if exists("session.vim")
        autocmd set  VimEnter * source! ~/_session.vim 
    endif
endif
if WINDOWS()
    autocmd VimLeave * mks!  $VIM/_session.vim
    if exists("session.vim")
        autocmd set  VimEnter * source! $VIM/_session.vim 
    endif
endif
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
set foldmethod=indent           "折叠方式是使用语法折叠
"set foldlevel=100              "折叠的层次是100,也就是打开所有的折叠
"=================《外观设置》===============================
if WINDOWS()
  au GUIEnter * simalt ~x       "窗口全屏
  set columns=80
elseif LINUX()
    autocmd GUIEnter * winsize 167 41
endif

set laststatus=2            "总是显示状态栏
set ruler               " 显示光标当前位置
set cursorline              "高亮所在行
"set cursorcolumn             "高亮当前列
set guioptions-=T            "隐藏工具栏
"set guioptions-=m            "隐藏菜单
set cmdheight=1             " 命令行（在状态行下）的高度，默认为1
set showmatch                       "高亮显示[] {} ()配对
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
set incsearch                       "当输入的时候,跳到你搜索的关键字那去
set hlsearch                        "高亮被搜索的关键字

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
set clipboard+=unnamed                      " 共享剪贴板
set showtabline=2                 "以标签形式打开文件
autocmd BufNewFile * normal G           "新建文件后 自动定位到文件末尾
set nobackup                    "禁止生成临时文件
setlocal noswapfile                 "不要生成swap文件
set wrap                      "自动折行
set textwidth=79
"=========按键======="
set backspace=indent,eol,start              "使用退格键

"===========《插件及配置》==========================="
"安装neobundle管理插件，先安装git再安装neobundle
if WINDOWS()             "安装:git clone https://github.com/Shougo/neobundle.vim.git
  set runtimepath+=$VIM/vimfiles/bundle/neobundle.vim    " 此处规定neobundle的路径
    call neobundle#begin(expand('$VIM/vimfiles/bundle/')) "插件安装位置
elseif LINUX()             "安装: git clone https://github.com/Shougo/neobundle.vim.git
  set runtimepath+=~/.vim/bundle/neobundle.vim/        " 此处规定neobundle的路径
    call neobundle#begin(expand('~/.vim/bundle/'))   "插件安装位置
endif
NeoBundleFetch 'Shougo/neobundle.vim'     "必须启用
"==========《neobundle命令说明》"
":NeoBundleList - 插件列表
":NeoBundleInstall - 安装 (更新) bundles
":NeoBundleClean - confirm (or auto-approve) 移除不使用的插件

"NeoBundle 'weynhamz/vim-plugin-minibufexpl'
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
"let g:bufExplorerSortBy = 'name'       " 按文件名排序
NeoBundle 'taglist.vim'           "Tlist 函数列表
let Tlist_Use_SingleClick=1                 "单击tag就跳到tag定义的位置
let Tlist_Show_Menu=1                       "显示taglist菜单
let Tlist_Auto_Open=0             "默认打开Taglist
"let Tlist_Show_One_File =   1              "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow =  1              "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1              "在右侧窗口中显示taglist窗口
let Tlist_Compart_Format = 1            " 压缩方式
let Tlist_WinWidth = 30
nmap <F6> :Tlist <cr>
if WINDOWS()
    set tags=tags;                          " ';' 不能没有
    let Tlist_Ctags_Cmd = 'ctags'
endif

"文件,项目查找,搜索
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kien/ctrlp.vim'                  "快速搜索/文件


NeoBundle 'scrooloose/nerdtree'              "树形目录
nmap <F9> :NERDTreeToggle<CR>               "F9调出
let g:NERDTreeWinSize = 30
let g:NERDTreeHight= 30
let g:NERDTreeMouseMode = 1
let g:NERDTreeMapToggleZoom = '<Space>'

"autocmd VimEnter * WMToggle                 "自动开启WMToggle
" autocmd VimEnter * wincmd w               "光标停留右侧文件
command  WM :WMToggle
nmap <F3> :WMToggle<cr>
set autochdir
"========================================<IDE>========================================
"git 
NeoBundle 'tpope/vim-fugitive'        "git信息
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

NeoBundle 'scrooloose/syntastic'      "语法检查
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
NeoBundle 'Raimondi/delimitMate'      "补全括号和引号
NeoBundle 'mhinz/vim-startify'              "显示上次编辑的文件列表
":SLoad    load a session
":SSave    save a session
":SDelete  delete a session
NeoBundle 'majutsushi/tagbar'       "tagbar
let g:tagbar_sort = 0             "关闭排序[也就是按标签本身在文件中的位置排序]
let g:tagbar_show_linenumbers = -1        "显示行号
let g:tagbar_width=30
let g:tagbar_left = 1
let g:NERDTreeChDirMode=1
nmap <F8> :TagbarToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
NeoBundle 'vim-scripts/YankRing.vim'        "剪贴板增强

" 撤销
NeoBundle 'mbbill/undotree'                 "撤销树
NeoBundle 'sjl/gundo.vim'                   "查看撤销树,类似版本控制系统,可恢复到某一阶段
nnoremap <F2> :GundoToggle<CR>
" 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
let g:tagbar_autopreview = 1
NeoBundle 'tomasr/molokai'          "molokai配色
NeoBundle 'bling/vim-airline'       "状态栏美化
NeoBundle  'Lokaltog/vim-powerline'       "状态栏增强
NeoBundle 'itchyny/lightline.vim'           "状态栏横条美化
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ }
      \ }

" Vim UI {
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme


NeoBundle 'terryma/vim-multiple-cursors'  "多光标编辑
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
NeoBundle 'yegappan/mru'                "使用:MRU命令调出最近打开的文档
highlight link MRUFileName LineNr
let MRU_Max_Entries = 100

"neocomplete补全
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

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

NeoBundle 'tomtom/tcomment_vim'             "快速注释
NeoBundle 'kien/rainbow_parentheses.vim'  "挂号匹配高亮
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3366ff'
let g:indentLine_char = '|'
NeoBundle 'danro/rename.vim'                "重命名插件
NeoBundle 'jiangmiao/auto-pairs'        "自动插入和格式化方括号和圆括号
NeoBundle 'vim-scripts/matchit.zip'             "\ %匹配成对的标签，跳转

"代码块
NeoBundle 'msanders/snipmate.vim'               "spipmate代码片段
"------ snipmate dependencies -------
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

"搜索
NeoBundle 'grep.vim'
" Fast navigation
"-----------------
NeoBundle 'edsono/vim-matchit'
NeoBundle 'Lokaltog/vim-easymotion'

"打开浏览器
NeoBundle 'tyru/open-browser.vim'               "打开浏览器

"项目管理
NeoBundle 'tpope/vim-projectionist'       "项目创建
"添加环绕
NeoBundle 'tpope/vim-surround'              "快速给词加环绕符号,例如引号
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

NeoBundle 'ianva/vim-youdao-translater'         "有道翻译
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

NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"==================python IDE============
    NeoBundle 'vim-scripts/indentpython.vim'        "python自动缩进
    NeoBundle 'klen/python-mode'
    NeoBundle 'yssource/python.vim'
    NeoBundle 'python_match.vim'
    NeoBundle 'pythoncomplete'
    NeoBundle 'amoffat/snake'                       "使vim最大限度支持python写插件
    "快速跳转
    NeoBundle 'easymotion/vim-easymotion'
    " Gif config
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    let g:EasyMotion_use_smartsign_us = 1 " US layout
    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

    NeoBundle 'davidhalter/jedi-vim'            "python补全,需要安装:pip install jedi
    "pip install jedi
    "pip install tox pytest
    let g:jedi#use_tabs_not_buffers = 1

 " PyMode {
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif
        if isdirectory(expand("~/.vim/bundle/python-mode"))
            let g:pymode_lint_checkers = ['pyflakes']
            let g:pymode_trim_whitespaces = 0
            let g:pymode_options = 0
            let g:pymode_rope = 0
        endif
        "}

"----------------------java ide" --------------------------------------
NeoBundle 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UseFQN = 1
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0
NeoBundle 'VJDE/VJDE'
NeoBundle 'wsdjeg/java_getset.vim'
NeoBundle 'JalaiAmitahl/maven-compiler.vim'
autocmd Filetype pom compiler mvn
NeoBundle 'vim-jp/vim-java'

autocmd! FileType java call JavaFileTypeInit()
function! JavaFileTypeInit()
let b:javagetset_setterTemplate =
\ "/**\n" .
\ " * Set %varname%.\n" .
\ " *\n" .
\ " * @param %varname% the value to set.\n" .
\ " */\n" .
\ "%modifiers% void %funcname%(%type% %varname%){\n" .
\ " this.%varname% = %varname%;\n" .
\ "}"
let b:javagetset_getterTemplate =
\ "/**\n" .
\ " * Get %varname%.\n" .
\ " *\n" .
\ " * @return %varname% as %type%.\n" .
\ " */\n" .
\ "%modifiers% %type% %funcname%(){\n" .
\ " return %varname%;\n" .
\ "}"
execute "source ~/.vim/bundle/java_getset.vim/java_getset.vim"
"add openjdk-8-src tags
set tags+=/home/wsdjeg/others/openjdk-8-src/tags
set omnifunc=javacomplete#Complete
"add android16 tags
if filereadable("AndroidManifest.xml")
set tags+=/home/wsdjeg/others/android-sources-6.0r1/tags
let g:JavaComplete_SourcesPath = "target/generated-sources/r"
endif
"nnoremap <leader>] :tag <c-r>=expand("<cword>")<cr><cr>
"nnoremap <leader>[ :tp
inoremap <silent> <buffer> { <C-r>=BracketsFunc()<cr>
inoremap <silent> <buffer> } <C-r>=JavaCloseBracket()<cr>
inoremap <silent> <buffer> <CR> <C-r>=MyEnterfunc()<Cr>
"inoremap <silent> <buffer> <C-u> <esc>bgUwea
inoremap <silent> <buffer> <leader>uu <esc>bgUwea
nnoremap <F4> :JCimportAdd<cr>
inoremap <F4> <esc>:JCimportAddI<cr>
"inoremap <silent> <buffer> . <C-r>=MyDotfunc()<Cr>
"inoremap <silent> <buffer> . <C-r>=WSDAutoComplete('.')<CR>
"inoremap <silent> <buffer> A <C-r>=WSDAutoComplete('A')<CR>
"inoremap <silent> <buffer> B <C-r>=WSDAutoComplete('B')<CR>
"inoremap <silent> <buffer> C <C-r>=WSDAutoComplete('C')<CR>
"inoremap <silent> <buffer> D <C-r>=WSDAutoComplete('D')<CR>
"inoremap <silent> <buffer> E <C-r>=WSDAutoComplete('E')<CR>
"inoremap <silent> <buffer> F <C-r>=WSDAutoComplete('F')<CR>
"inoremap <silent> <buffer> G <C-r>=WSDAutoComplete('G')<CR>
"inoremap <silent> <buffer> H <C-r>=WSDAutoComplete('H')<CR>
"inoremap <silent> <buffer> I <C-r>=WSDAutoComplete('I')<CR>
"inoremap <silent> <buffer> J <C-r>=WSDAutoComplete('J')<CR>
"inoremap <silent> <buffer> K <C-r>=WSDAutoComplete('K')<CR>
"inoremap <silent> <buffer> L <C-r>=WSDAutoComplete('L')<CR>
"inoremap <silent> <buffer> M <C-r>=WSDAutoComplete('M')<CR>
"inoremap <silent> <buffer> N <C-r>=WSDAutoComplete('N')<CR>
"inoremap <silent> <buffer> O <C-r>=WSDAutoComplete('O')<CR>
"inoremap <silent> <buffer> P <C-r>=WSDAutoComplete('P')<CR>
"inoremap <silent> <buffer> Q <C-r>=WSDAutoComplete('Q')<CR>
"inoremap <silent> <buffer> R <C-r>=WSDAutoComplete('R')<CR>
"inoremap <silent> <buffer> S <C-r>=WSDAutoComplete('S')<CR>
"inoremap <silent> <buffer> T <C-r>=WSDAutoComplete('T')<CR>
"inoremap <silent> <buffer> U <C-r>=WSDAutoComplete('U')<CR>
"inoremap <silent> <buffer> V <C-r>=WSDAutoComplete('V')<CR>
"inoremap <silent> <buffer> W <C-r>=WSDAutoComplete('W')<CR>
"inoremap <silent> <buffer> X <C-r>=WSDAutoComplete('X')<CR>
"inoremap <silent> <buffer> Y <C-r>=WSDAutoComplete('Y')<CR>
"inoremap <silent> <buffer> Z <C-r>=WSDAutoComplete('Z')<CR>
compiler mvn
if !filereadable("pom.xml")
inoremap <F5> <esc>:w<CR>:!javac -cp classes/ -Djava.ext.dirs=lib/ -d classes/ % <CR>
nnoremap <F5> :!javac -cp classes/ -Djava.ext.dirs=lib/ -d classes/ % <CR>
nnoremap <F6> :!java -cp classes/ -Djava.ext.dirs=lib/ com.wsdjeg.util.TestMethod
let g:JavaComplete_LibsPath = 'classes/:lib/:/home/wsdjeg/tools/apache-tomcat-8.0.24/lib'
else
"add struts2-core tags
set tags+=/home/wsdjeg/others/struts/core/tags
"add tomcat70 tags
set tags+=/home/wsdjeg/others/tomcat70/tags
"add hibernate-core tags
set tags+=/home/wsdjeg/others/hibernate-orm/hibernate-core/src/main/java/tags
no <F9> :echo system("mvn clean")<CR>
no <F5> <up>:wa<CR> :echo system("mvn clean compile")<CR>
no <silent><F6> :echo system("mvn test")<CR>
endif
endf
function JavaCloseBracket()
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
  "Inserting a quoted quotation mark into the string
  return "}"
  elseif line[col - 1] == "}"
    "Escaping out of the string
    return "\<Right>"
  elseif match(getline(line('.') + 1), '\s*}') < 0
    return "\<CR>}"
  else
    return "\<Esc>j0f}a"
  endif
endf

function! OnmiConfigForJsp()
  let pos1 = search("</script>","nb",line("w0"))
  let pos2 = search("<script","nb",line("w0"))
  let pos3 = search("</script>","n",line("w$"))
  let pos4 = search("<script","n",line("w$"))
  let pos0 = line('.')
  if pos1 < pos2 && pos2 < pos0 && pos0 < pos3
    set omnifunc=javascriptcomplete#CompleteJS
    return "\<esc>a."
  else
  set omnifunc=javacomplete#Complete
  return "\<esc>a."
  endif
endf


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
NeoBundle 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
NeoBundle 'mattn/emmet-vim'                         "emmet 速写
let g:user_emmet_install_global = 0                                
autocmd FileType html,jsp,css EmmetInstall              "只在html和css中启用
let g:user_emmet_expandabbr_key='<c-j>'           "更改默认按键
let g:user_emmet_complete_tag=1
let g:user_emmet_next_key='<c-n>'
let g:user_emmet_prev_key='<c-p>'
NeoBundle 'docunext/closetag.vim'                   "关闭标签
NeoBundle 'othree/xml.vim'              "xml插件
"NeoBundle 'ternjs/tern_for_vim'                     "tern js补全
NeoBundle 'cakebaker/scss-syntax.vim'               "scss css检查
au BufRead,BufNewFile *.scss set filetype=scss.css
NeoBundle 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}

NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}

"----------javascript-----------------------
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nono/jquery.vim'                         "jquery高亮
NeoBundle 'elzr/vim-json'                           "json高亮
NeoBundle 'guileen/vim-node-dict'               "Node.js 字典
"django
NeoBundle 'django_templates.vim'
NeoBundle 'Django-Projects'
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}} "{{{
nnoremap <leader>fjs :call JsBeautify()<cr>
"}}}
NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}

"==============《配色主题》==============
colorscheme molokai
"colorscheme
NeoBundle 'morhetz/gruvbox'
call neobundle#end()
NeoBundleCheck
filetype plugin indent on
syntax on
"===========《实用设置》===================
"单词纠正
":abbr Lunix Linux
":abbr accross across
"=============<自定义命令>================
command T :tabnew | WMToggle  "打开新标签页,并加载WMToggle

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
" ====F5 一键运行=====
func! RunScript()
if &filetype == 'python'
    exec "!python %"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!java %<"
endif
endfunc
map <F5> :call RunScript()<CR>

"技巧
"文本单词中添加符号,如：wwflwlf/fwfwekfek kfwkeowofeowoee 想在wwflwlf/fwfwekfek前后加一个双引号
"操作,光标定位到wwf处：vt空格 S"   以此类推,可以快速添加其他的符号 
