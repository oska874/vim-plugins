my vim plugin settings.

environment: 

	ubuntu 16.04 (14.04,15.04), Arch,
	
	vim 8.0 (7.4)
	
	cscope, ctags, gtags

screenshot

![](https://github.com/oska874/vim-plugins/blob/master/screen_shot.png)

usage:

1. 将 vim74 目录下的内容直接复制到 vim 安装目录（如 `/usr/share/vim/vim80`）
2. 将 .vimrc 复制到 `~/` 
3. 将 .vim 目录拷贝到 `~/`

plugins:

1. nerdtree:
	
	The NERD tree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.

	from: https://github.com/scrooloose/nerdtree.git
	
	usage: F3, open and close
	
	fix install procedure in ubuntu 16.04(these have been done in this repo):
	
	prepare
	
	```	
	 mkdir -p ~/.vim/autoload ~/.vim/bundle;
	 wget -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	```
	
	`vim /etc/vim/vimrc` (or `~/.vimrc` depends on your configuration) add below(I've added it in .vimrc):
	
	```
	" Pathogen
	execute pathogen#infect()
	call pathogen#helptags() " generate helptags for everything in ‘runtimepath’
	syntax on
	filetype plugin indent on
	```
	
    如果默认的 nerdtree 有问题，可以下载最新版更新/修补

	```
	git clone https://github.com/scrooloose/nerdtree.git
    sudo cp -r nerdtree/* /usr/share/vim/vim74/
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
	
	**attention** ：  before you use SrcExplr ,you should first `ctags -R` first in you source code ,or it cannot find the symbols.

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

7. gtags

    使用方法：在代码目录直接运行 `gtags`，然后在 vim 中按照tags 和cscope 的用法即可

    ps: gtags 的索引效果不如cscope好，但是命令简单

    ps2: 如果不想用gtags的索引可以修改 .vimrc，删除其中和gtags相关的配置项（即120~133 行）
