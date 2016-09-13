my vim plugin settings.

environment: 

	ubuntu 15.04(14.04)
	
	vim 7.4
	
	cscope, ctags

usage:

1. 将 vim74 目录下的内容直接复制到 vim 安装目录（如 `/usr/local/share/vim/vim80`）
2. 将 vimrc 复制到 `~/` ，并重命名为 `.vimrc`

plugins:

1. nerdtree:
	
	The NERD tree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.

	from: https://github.com/scrooloose/nerdtree.git
	
	usage: F3, open and close
	
	fix install procedure in ubuntu 16.04:
	
	prepare
	
	```	
	 mkdir -p ~/.vim/autoload ~/.vim/bundle;
	 curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	```
	
	`vim /etc/vim/vimrc` add below:
	
	```
	" Pathogen
	execute pathogen#infect()
	call pathogen#helptags() " generate helptags for everything in ‘runtimepath’
	syntax on
	filetype plugin indent on
	```
	
	install nerdtree
	```
	cd ~/.vim/bundle
	git clone https://github.com/scrooloose/nerdtree.git
	```


2. taglist: 

	The "Tag List" plugin is a source code browser plugin for Vim and
provides an overview of the structure of source code files and allows
you to efficiently browse through source code files for different
programming languages.

	from: https://github.com/vim-scripts/taglist.vim.git
	
	usage: F2,open and close

3. SrcExplr

	The plugin (srcexpl.vim) is a source code explorer based on tags and it provides an overview of the function and type definitions.It has such a mechannism that works like the context window component of "Source Insight" software. 

	from: https://github.com/oska874/vim-plugins.git
	
	usage: F8,open and close

4. cscope
	
	You know.

	usage: cs ... 

5. syntax(c/python)
	change tab width and softtab width

6. 问题：

- 无法记住上次编辑文件的位置？
  已经在～/.vimrc中增加了下面一行：

  ```
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
  ```
  
  但是依然无法记住上次编辑的位置。
  
  原因：
  
  ```
  [zhang@ubuntu: ~]$ll ./.viminfo 
  -rw------- 1 root root 4558 2011-12-09 13:58 ./.viminfo
  ```
  
  原来记录位置的文件仅仅对root开放了读写权限。
  
  解决办法：
  对非root用户增加对~/.viminfo的读写权限
  
  ```
  sudo chmod a+w ./.viminfo 
  sudo chmod a+R ./.viminfo
  ```
