1. mv vimrc ~/.vimrc
2. mv vim ~/.vim
3.open vim and :PluginInstall
read below
https://blog.csdn.net/qq_33160790/article/details/81152943
////////////////////////////////////////////////////////////////////////////////
set nocompatible              " required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"frank vim plugin to be installed
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'taglist.vim'
Plugin 'Yggdroot/indentLine'
 
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

"cscope config
if has("cscope")
    if filereadable("cscope.out")
        cs add cscope.out
    endif
endif

syntax on			"语法高亮
colorscheme zellner		"主题
set nu!				"显示行号
set hlsearch			"查找高亮显示
set incsearch			"查找时跳转
set mouse=a			"always use mouse 

" frank mvim plugin config
" -------- pulgin NERDTree 
"使用F12键快速调出和隐藏它
map <F12> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=20 "25
" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
 
"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree           
 
"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 
" 开发的过程中，我们希望git信息直接在NERDTree中显示出来， 和Eclipse一样，修改的文件和增加的文件都给出相应的标注， 这时需要安装的插件就是 nerdtree-git-plugin,配置信息如下
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
 
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" 显示在右边
let NERDTreeWinPos=1

" -------- plugin Tlist
"let Tlist_Use_Right_Window = 1          "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1      "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件
					"tag，其它文件的tag都被折叠起来。

let Tlist_Show_One_File = 1             "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name'             "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序

let Tlist_GainFocus_On_ToggleOpen = 1       "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim

let Tlist_WinWidth = 23             "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，>而是我们用homebrew安装的那个

"自动打开Tlist
autocmd vimenter * TlistToggle

"使用F10键快速调出和隐藏它
map <F10> :TlistToggle<CR>

"map t :TlistToggle<CR>              "热键设置，我设置成Leader+t来呼出和关闭Taglist

" -------- plugin indentline
"" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'
" 使indentline生效
let g:indentLine_enabled = 1

