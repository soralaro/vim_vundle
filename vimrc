set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" "frank vim plugin to be installed
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'taglist.vim'
Plugin 'Yggdroot/indentLine'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" " All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
" "cscope config
if has("cscope")
	if filereadable("cscope.out")
		cs add cscope.out
	endif
endif

syntax on               "
colorscheme darkblue    "
"set nu!                 "
set hlsearch            "
set incsearch           "
"set mouse=a            " 

" frank mvim plugin config
" " -------- pulgin NERDTree 
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=20 "25
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '^'

"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree           

" "How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : ".",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : "->",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "x",
    \ "Clean"     : "v",
    \ "Unknown"   : "?"
    \ }

"let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeWinPos=1

"let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type ='name'
"let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 32
autocmd vimenter * TlistToggle
map <F1> :TlistToggle<CR>
let g:indentLine_char='¦'
let g:indentLine_enabled = 1
autocmd BufReadPost *
	\ if line("'\"")>0&&line("'\"")<=line("$") |
	\   exe "normal g'\"" |
	\ endif
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
