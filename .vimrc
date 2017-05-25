" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set termencoding=utf-8
set encoding=utf-8
   
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("cscope")
        set csprg=/usr/bin/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory 
        if filereadable("cscope.out")
            cs add ./cscope.out
        " else add database pointed to by environment 
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb
"        set cscopetag 
"       set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i- 
endif

set expandtab
set tabstop=4
set shiftwidth=4
"set number

set nu
colorscheme desert

"Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in ‘runtimepath’
syntax on
filetype plugin indent on


"map keys
"nerdtree
"map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeCaseSensitiveSor=1
let NERDTreeHighlightCursorline=1
let NERDTreeWinSize=20

"taglist
"map <F2> :TlistOpen<CR>
map <F2> :TlistToggle <CR>
"禁止自动改变当前Vim窗口的大小
let Tlist_Inc_Winwidth=0 
"把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1 
"让当前不被编辑的文件的方法列表自动折叠起来， 这样可以节约一些屏幕空间
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
"let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=30
"srcexplr
nmap <F8> :SrcExplToggle<CR>



"gtags 
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope
set nocsverb
if filereadable("GTAGS")
    cs add GTAGS
endif
set csverb


" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
