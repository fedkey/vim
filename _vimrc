" -----------------     ����: ��ʥ��
" -----------------     ����: fedkey@sina.com
" -----------------     ����: http://yangshengliang.com
" -----------------     ����: 2015��10��22��
"ϵͳ����
"linux-fedora
"sudo yum install ctags
"sudo yum install build-essential cmake python-dev  #����YCM�Զ���ȫ�������
"sudo yum install silversearcher-ag
"�����װ
"python2.7  ���������python2.7,��װ
"java       sudo yum install openjdk-8-jdk
"npm        sudo yum install npm
"clang      sudo yum install clang
"cmake      sudo yum install cmake
"python-dev sudo yum install pythoon-dev
"gvim       sudo yum install vim-gtk
" Ctrl + K                   --�������һ��ĩβ
" Ctrl + H                   --���������
" Ctrl + L                   --�������β
" Ctrl + Z                   --ȡ��ESCģʽ�� [��Lingos��ݼ��г�ͻ]
" Ctrl + S                   --�����ļ�
" Ctrl + C                   --���� [֧��C/C++��Java]
" Ctrl + R                   --���� [֧��C/C++��Java��Lua��Perl��Python��Ruby]
" Ctrl + ]                   --ת����������
" Ctrl + T                   --���ص��ú���
" Ctrl + E                   --���ע�� [����ģʽ] [��ӵ���C���ԵĶ���ע�ͣ�����������C/C++/Java��]
" Ctrl + E                   --һ�������﷨ģ������ߡ�ʱ����Ϣ [�ǲ���ģʽ]
" <C-P>                      --���ʲ�ȫ
" <C-X><C-L>                 --���в�ȫ
" Tab��                      --����ģʽ�µ�ȫ�����﷨�ṹ��ȫ [snipMate���]
" wm                         --�����ĵ��������
" \ww                        --����vimWikiģʽ
" za                         --�򿪻�رյ�ǰ�۵�
" zM                         --�ر������۵�
" zR                         --�������۵�
" :set syntax=cpp            --�ֶ�ѡ���﷨���� [�� :set filetype=cpp]
" :%!xxd                     --ת���������ļ�����ʮ��������ʽ��ʾ
" :%!xxd -r                  --��ԭ�������ļ�
"ʹ��Python
"sudo pip install pyflakes
"sudo pip install pylint
"sudo pip install pep8

"��ݼ�����,˫��ȡ��emacs������ʽ
"˫����ʾ�� nmapģʽ
" nmap <C-x><C-s> :w!<CR>
" ����ģʽ
" imap <C-x><C-s> <ESC> :w!<cr>
" ��ͨ,���ݹ�ӳ��ģʽ ,
" nnoremap ,w :w!<cr>
"����
nmap <C-x><C-s> :w!<CR>
imap <C-x><C-s> <ESC>:w!<CR>

" �ļ����Ϊ
nmap <C-x><C-w> :browse confirm saveas<CR>
imap <C-x><C-w> <ESC>:browse confirm saveas<CR>

" ���沢�˳��ļ�
nmap <C-x><C-c> :wqa!<CR>
imap <C-x><C-c> <ESC>:wqa!<CR>

" �������˳��ļ�
nmap <C-x><C-q> :qa!<CR>
imap <C-x><C-q> <ESC>:qa!<CR>

" ���ļ�
nmap <C-x><C-f> :browse confirm e<CR>
imap <C-x><C-f> <ESC>:browse confirm e<CR>

" ���ļ�
nmap <C-x><C-f> :browse confirm e<CR>
imap <C-x><C-f> <ESC>:browse confirm e<CR>

" ����tag�ļ�
nmap <C-x><C-n>  :!ctags -R .<CR>
imap <C-x><C-n> <ESC>:!ctags -R .<CR>

" ת����16����
nmap ,ox :%!xxd<CR>
" �ָ�ԭʼ��ʽ
nmap ,-ox :%!xxd -r<CR>

"===========���ж���ʲô����ϵͳ��============================"
function! Mysys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunctio

set completeopt=menuone            "�رն�������������ʾ����
set completeopt=longest,menu 


"=========================���������===================================
set helplang=cn		            	"���İ���
if Mysys() == 'windows'
	set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936	"�Զ�ʶ���ļ�����
elseif Mysys() == 'linux'
	set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936	"�Զ�ʶ���ļ�����
endif
if Mysys() == 'windows'             "winodwsϵͳ��ִ�е�����
    "����˵�����
    set encoding=utf-8  
    set fileencoding=chinese  
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
    "���consle�������  
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

"=================���������á�==================================
set nocompatible  	            "��ʹ��viģʽ"
set linespace=0 	            "�ַ���������������Ŀ
set nu
set guicursor=n-v-c:hor20
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor
set mouse=a            		    "����������֧��
if Mysys() == 'linux'
	set clipboard=unnamedplus   "�����ļ�
elseif Mysys() == 'windows'
	set clipboard+=unnamed 	    "����ճ����
endif
set showcmd                     " �����������ʾ����
nnoremap <C-F2> :vert diffsplit "�Ƚ��ļ�
set autoread                    " ���õ��ļ����Ķ�ʱ�Զ�����
set magic                       " ����ħ��
"�﷨����"
syntax on                       "������ָ���﷨����
syntax enable                   " ���﷨����
filetype plugin indent on       " �����Զ�����ļ�����
"=======================�Զ�����session=========================== 
"�Զ�����session
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
" ���ϴιرյ��ļ�
" <C-o><C-o><cr>
" ���ļ�ʱ������ viminfo ������ϴιر�ʱ�Ĺ��λ���������ù��
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"================���������á�===================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab                 	    "��Tab�Զ�ת���ɿո� [��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
set foldmethod=indent		        "�۵���ʽ��ʹ���﷨�۵�
"set foldlevel=100 			        "�۵��Ĳ����100,Ҳ���Ǵ����е��۵�
"=================��������á�===================================
if Mysys() == 'windows'
	au GUIEnter * simalt ~x 	    "����ȫ��
	set columns=80
elseif Mysys() == 'linux'
    autocmd GUIEnter * winsize 167 41
endif
set gcr=a:block-blinkon0		    "��ֹ�����˸
set laststatus=2				    "������ʾ״̬��
set ruler						    " ��ʾ��굱ǰλ��
set cursorline 					    "����������
"set cursorcolumn 				    "������ǰ��
set guioptions-=T				    "���ع�����
"set guioptions-=m				    "���ز˵�
set cmdheight=1					    " �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1
highlight OverLength ctermbg=red ctermfg=white guibg=#592929  "һ�ж���80���ַ�,��ɫ����
match OverLength /\%81v.\+/
set showmatch                       "������ʾ[] {} ()���

"--------------------�߼�����-------------------------------------
"autocmd BufWritePre * :%s/\s\+$//e "�����ļ�ʱ�Զ�ȥ����ĩ�ո�
"ָ���ļ�����ȥ����ĩ�ո�
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
"================���������á�========================================
set incsearch                       "�������ʱ��,�����������Ĺؼ�����ȥ
set hlsearch                        "�����������Ĺؼ���

"=================�����塷=======================================
if Mysys() == 'windows'
    set guifont=courier_new:h11
elseif Mysys() == 'linux'
    " set guifont=DejaVu\Sans\Mono\ 11
    " Droid sans mono��Ҫ����
    set guifont=DroidSansMono\ 11
endif

" ==============�����ݺ�׺��ָ���ļ����͡�============================
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

"==============����ɫ���⡷============================================

" Solarized��������
"        " git clone git://github.com/altercation/vim-colors-solarized.git
" ------------------------------------------------------------------
let g:solarized_underline=0                 "default value is 1
let g:solarized_contrast="high"             "default value is normal
let g:solarized_visibility="high"           "default value is normal
let g:solarized_diffmode="high"             "default value is normal
syntax enable
set background=light
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.
 let g:solarized_termcolors= 256
 let g:solarized_termtrans=0
 let g:solarized_degrade=0
 let g:solarized_bold=1
 let g:solarized_italic=1
 let g:solarized_termcolors=16
 let g:solarized_hitrail=0
 let g:solarized_menu=1

"------------����---------------
set vb t_vb=		                        "ȥ��������
"====�ļ�============
set clipboard+=unnamed                      " ���������
set showtabline=2					        "�Ա�ǩ��ʽ���ļ�
autocmd BufNewFile * normal G		        "�½��ļ��� �Զ���λ���ļ�ĩβ
set nobackup						        "��ֹ������ʱ�ļ�
setlocal noswapfile					        "��Ҫ����swap�ļ�
set wrap							        "�Զ�����
"=========����======="
set backspace=indent,eol,start

"===================================����������á�===============================""��װvundle���������Ȱ�װgit�ٰ�װvundle
if Mysys() == 'windows'  					 "��װ:git clone https://github.com/Shougo/neobundle.vim.git
	set runtimepath+=$VIM/vimfiles/bundle/neobundle.vim 	 " �˴��涨neobundle��·��
    call neobundle#begin(expand('$VIM/vimfiles/bundle/')) "�����װλ��
elseif Mysys() == 'linux'  					 "��װ: git clone https://github.com/Shougo/neobundle.vim.git
	set runtimepath+=~/.vim/bundle/neobundle.vim/ 	 		 " �˴��涨neobundle��·��
    call neobundle#begin(expand('~/.vim/bundle/'))   "�����װλ��
endif

NeoBundleFetch 'Shougo/neobundle.vim' 		"��������
"==========��Vundle.vim����˵����"
":NeoBundleList - ����б�
":NeoBundleInstall - ��װ (����) bundles
":NeoBundleClean - confirm (or auto-approve) �Ƴ���ʹ�õĲ��

NeoBundle 'vim-scripts/winmanager--Fox'     "winmanager���ڹ���
"����winmanager�Ŀ�ȣ�Ĭ��Ϊ25
"let g:winManagerWidth = 15
let g:AutoOpenWinManager = 1                "�Զ���winmanager
let Tlist_Exit_OnlyWindow=1  

"����ָ�
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList" 
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
function! NERDTree_IsValid()  
    return 1  
endfunction  

NeoBundle  'vim-scripts/bufexplorer.zip'    "��ʾbuf�б�
"let g:bufExplorerSortBy = 'name'		    " ���ļ�������
NeoBundle  'tisyang/taglist'				"Tlist �����б�
let Tlist_Use_SingleClick=1                 "����tag������tag�����λ��
let Tlist_Show_Menu=1                       "��ʾtaglist�˵�
let Tlist_Auto_Open=0					    "Ĭ�ϴ�Taglist
"let Tlist_Show_One_File = 	 1              "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow =  1              "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1              "���Ҳര������ʾtaglist����
let Tlist_Compart_Format = 1    		    " ѹ����ʽ
let Tlist_WinWidth = 30
set autochdir
if Mysys() == 'windows'
    set tags=tags;                          " ';' ����û��
    let Tlist_Ctags_Cmd = 'ctags'
endif
NeoBundle 'kien/ctrlp.vim'                  "��������/�ļ�
NeoBundle 'scrooloose/nerdtree'			         "����Ŀ¼
"map <F9> :NERDTreeToggle<CR>               "F9����
let g:NERDTreeWinSize = 30
let g:NERDTreeHight= 30
let g:NERDTreeMouseMode = 1
let g:NERDTreeMapToggleZoom = '<Space>'

autocmd VimEnter * WMToggle                 "�Զ�����WMToggle
autocmd VimEnter * wincmd w		            "���ͣ���Ҳ��ļ�
command  WM :WMToggle

" ֻʣ NERDTreeʱ�Զ��ر�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"========================================<IDE>========================================
NeoBundle 'tpope/vim-fugitive'				"git����
NeoBundle 'scrooloose/syntastic'			"�﷨���
NeoBundle 'Raimondi/delimitMate'			"��ȫ���ź�����
NeoBundle  'airblade/vim-gitgutter'         "��ʾgit ����
NeoBundle 'majutsushi/tagbar'				"tagbar
let g:tagbar_sort = 0					    "�ر�����[Ҳ���ǰ���ǩ�������ļ��е�λ������]
let g:tagbar_show_linenumbers = -1		    "��ʾ�к�
NeoBundle 'vim-scripts/YankRing.vim'        "��������ǿ
NeoBundle 'sjl/gundo.vim'                   "�鿴������,���ư汾����ϵͳ,�ɻָ���ĳһ�׶�
nnoremap <F2> :GundoToggle<CR>
" �����Զ�Ԥ�� [���Ź���ڱ�ǩ�ϵ��ƶ������������һ��ʵʱ��Ԥ������]
let g:tagbar_autopreview = 1
NeoBundle 'tomasr/molokai'					"molokai��ɫ
NeoBundle 'bling/vim-airline'				"״̬������
NeoBundle  'Lokaltog/vim-powerline'		    "״̬����ǿ
NeoBundle 'terryma/vim-multiple-cursors'	"������б༭
    " Ĭ������
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    "ʹ�÷���
    "fp����p��
    "���� <C-n> ѡ�й���µĵ���
    "�������� <C-n> ����ѡ������������ͬ�ĵ���
    "����c�����޸�
    "�����޸�
    "���� <Esc> �˳�
    "����ͨģʽ�£����� Ctrl-n ��ʼ�������ģʽ��ѡ�й���µĵ��ʣ������� Ctrl-n ѡ����һ����ͬ�ĵ��ʣ����� Ctrl-p ����ѡһ���� Ctrl-x ��������һ����ͬ���ʡ�
    "    ����Vѡ������
    "����G����ĩ��
    "���� <C-n> ��ÿ�еĿ�ͷ����һ����겢������ͨģʽ
    "����I��ÿ�е�ͷ������
    "���롱, ���� <C-e> ������ĩ, ������һ�����Ͷ���
    "Ȼ��ÿ����궼����һ�У�����delete
NeoBundle 'yegappan/mru'		                "ʹ��:MRU�����������򿪵��ĵ�
highlight link MRUFileName LineNr
let MRU_Max_Entries = 100

NeoBundle 'tomtom/tcomment_vim'                 "����ע��

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3366ff'
let g:indentLine_char = '|'
NeoBundle 'danro/rename.vim'                    "���������
NeoBundle 'jiangmiao/auto-pairs'				"�Զ�����͸�ʽ�������ź�Բ����
NeoBundle 'vim-scripts/matchit.zip'             "\ %ƥ��ɶԵı�ǩ����ת

"��ӻ���
NeoBundle 'tpope/vim-surround'                      "���ٸ��ʼӻ��Ʒ���,��������
"{{
"ʹ�÷����� ysiw"   "����������Ŵ���
"yssb  ���Կ���Ϊһ�а�ΧԲ���� ���� yss" Ϊһ�а�Χ˫����
"cs ָ����Ը��İ�Χ, ���� cs'" �ǽ������ű��˫����, cs"( �ǽ�˫���ű��Բ����
"ds ָ�����ȡ����Χ, ���������Χ������, ds" ��ȥ��˫���Ű�Χ, ``
"��ͨģʽ
"-----------
"ds  - ɾ��һ������
"cs  - �ı�һ������
"ys  - ���һ������
"yS  - ���һ�����ƺ͵ط�����Χ���ı����µ�һ��+����
"yss - ���һ������
"ySs - ������Χ�Ļ��ƣ����õ�һ���µ���+����
"ySS - ͬ ySs

"����ģʽ
"-----------
"s   - ���һ������
"S   - ���һ���µĻ����ı�+����
"����ģʽ
"-----------
"<CTRL-s> - ���һ������
"<CTRL-s><CTRL-s> - ���һ���µĻ����ı�+����
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>
"}}

NeoBundle 'ianva/vim-youdao-translater'        "�е�����
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>
NeoBundle 'godlygeek/tabular'                   " Tabular: �Զ����롣
" ---------------------------------------------------
NeoBundle 'shemerey/vim-project'                "��Ŀ����
NeoBundle 'atom/vim-mode'                       "vim-mode
"==================python IDE======start======
let python_highlight_all = 1                    "python����
NeoBundle 'vim-scripts/indentpython.vim'        "python�Զ�����
"{{
NeoBundle 'nvie/vim-flake8'                     "python������
	"pip install flake8
	"<F7> to run flake8
	let g:flake8_quickfix_location="top"
	let g:flake8_quickfix_height=7
	let g:flake8_show_quickfix=1
	let g:flake8_show_in_gutter=1
	let g:flake8_show_in_file=1
	let g:flake8_max_markers=500
	let flake8_error_marker='��'                "������ʾ����
	let flake8_warning_marker='��'              "������ʾ����
	let flake8_pyflake_marker=''                " �Ƿ����ξ���
	let flake8_complexity_marker=''             "���� McCabe complexity ����
	let flake8_naming_marker=''                 "���� naming ����
"}}

NeoBundle 'davidhalter/jedi-vim'		        "python��ȫ,��Ҫ��װ:pip install jedi
"pip install jedi
"pip install tox pytest
let g:jedi#use_tabs_not_buffers = 1

NeoBundle 'msanders/snipmate.vim'               "spipmate����Ƭ��

NeoBundle 'tyru/open-browser.vim'               "�������
"--------------------��web �����--------------------------------------
"web����
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
NeoBundle 'mattn/emmet-vim'                        "emmet ��д
let g:user_emmet_install_global = 0                                
autocmd FileType html,css EmmetInstall              "ֻ��html��css������
let g:user_emmet_expandabbr_key='<c-j>'  	        "����Ĭ�ϰ���
let g:user_emmet_complete_tag=1
let g:user_emmet_next_key='<c-n>'
let g:user_emmet_prev_key='<c-p>'
NeoBundle 'docunext/closetag.vim'                   "�رձ�ǩ
NeoBundle 'othree/xml.vim'							"xml���
NeoBundle 'ternjs/tern_for_vim'                     "tern js��ȫ
NeoBundle 'cakebaker/scss-syntax.vim'               "scss css���
au BufRead,BufNewFile *.scss set filetype=scss.css
NeoBundle 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
"----------javascript-----------------------
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nono/jquery.vim'                         "jquery����
NeoBundle 'elzr/vim-json'                           "json����
NeoBundle 'guileen/vim-node-dict'					"Node.js �ֵ�
NeoBundle 'maksimr/vim-jsbeautify'                  "JS�����ʽ��
"django
NeoBundle 'django_templates.vim'
NeoBundle 'Django-Projects'

"--------------------PHP IDE-----------------------------------------------
NeoBundle 'ervandew/supertab'                      "����tab
" ======================����Բ�����������ֵ䲹ȫ��=======================
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
call neobundle#end()                        "�������в�����
"=========================================��ʵ�����á�=================================="
"���ʾ���
":abbr Lunix Linux
":abbr accross across
"=========================================<�Զ�������>==================================="
command T :tabnew | WMToggle	"���±�ǩҳ,������WMToggle

"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ
autocmd BufNewFile *.c,*.cpp,*.[ch],*.sh,*.py,*.php  exec ":call SetTitle()"
""���庯��SetTitle���Զ������ļ�ͷ
func SetTitle()
	"����ļ�����Ϊ.sh�ļ�
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
        call append(1,"# ����:" .    "  ��ʥ��")
        call append(2,"# ����:" .    "  fedkey@sina.com")
        call append(3,"# ����:" .    "  yangshengliang.com")
        call append(4,"# ��������:" .strftime("%Y-%m-%d"))

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(1,"# coding=utf-8")
        call append(2, "\"\"\"")
		call append(3,"�ļ���:      ".expand("%"))
        call append(4,"��������:    " . strftime("%Y-%m-%d"))
	    call append(5,"����:        ��ʥ��")
	    call append(6,"����:        fedkey@sina.com")
        call append(7,"���ͣ�       yangshengliang.com")
        call append(8, "\"\"\"")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")

     elseif &filetype == 'php'
		call setline(1, "<?php")
		call append(line("."),"/*")
		call append(line(".")+1,"�ļ���:  ".expand("%"))
		call append(line(".")+2,"����:    ��ʥ��")
		call append(line(".")+3,"����:    fedkey@sina.com ")
		call append(line(".")+4,"����:    yangshengliang.com ")
		call append(line(".")+5,"��������:" . strftime("%Y-%m-%d"))
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
"==========================================F5 һ������=====================================================
func! RunScript()
if &filetype == 'python'
    exec "!python %"
endif
endfunc
map <F5> :call RunScript()<CR>

"����
"�ı���������ӷ���,�磺wwflwlf/fwfwekfek kfwkeowofeowoee ����wwflwlf/fwfwekfekǰ���һ��˫����
"����,��궨λ��wwf����vt�ո� S"   �Դ�����,���Կ�����������ķ��� 
