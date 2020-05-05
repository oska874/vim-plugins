
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'uarun/vim-protobuf'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'ycm-core/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.




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
nmap <F4> :SrcExplToggle<CR>



"gtags 
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope
set nocsverb
if filereadable("GTAGS")
    cs add GTAGS
endif
set csverb


set backspace=indent,eol,start
" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" rainbow
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" lightline

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!'
      \ },
      \ }
" nerd commenter
" filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" gitgutter
let num = 500
sign define Foo text=*

new

call append(0, range(1, num))

set updatetime=100
for i in range(1, num)
  execute "sign place ".i." line=".i." name=Foo buffer=".bufnr('')
endfor

let start = reltime()
for i in range(1, num)
  execute "sign unplace ".i
endfor
let elapsed = reltime(start)

bdelete!




"echom split(reltimestr(elapsed))[0]."s to remove ".num." signs"
"echom string(reltimefloat(elapsed) * 1000 / num).' ms/sign'
"echom string(float2nr(num / reltimefloat(elapsed))).' sign/s'
