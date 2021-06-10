syntax on
set nu "设置行号
set tags=/home/xxj/Desktop/dev/tags

"vim设置大括号自动补全并换行对齐
set smartindent
set tabstop=4
set shiftwidth=4 
set noexpandtab
imap { {}<ESC>i<CR><ESC>V<O

"vim小括号自动补全
imap ( ()<ESC>i

"python print函数自动补全
"imap print print(''<ESC>i

"python type函数自动补全
"imap type type(

"=注释一行 -取消一行注释
map = I/* <ESC>A */<ESC>
map - 0xxx$xxx

"注释说明一行
map B <ESC>A    /*  */<ESC>hhi

"E增加函数的注释
map E o/*<CR> *<CR>*/<ESC>ka 

"解决vim的backspace不能正常使用
set backspace=indent,eol,start

"创建*.py文件增加注释
autocmd BufNewFile *.py call SetNote()
	func SetNote()
		call setline(1,"#!/usr/bin/env python3")
		call setline(2,"# coding: utf-8")
		"call append(line("."),"#Author:xxj")
		"call append(line("."),"#Email:xxxx@163.com")
		call append(line("."),"#Date:".strftime("%Y年%m月%d日"))
	endfunc
	autocmd BufNewFile * normal G

set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline' 

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required

"------------------------------------------------------------------
"cscope:建立数据库:cscope-Rbq:F5查找c符号; F6查找字符串; 
"F7查找函数定义;F8 查找函数谁调用了
"------------------------------------------------------------------
if has ("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory

	if filereadable ("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR>

" Tagbar
nmap tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" NetRedTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
let NERDTreeWinSize=40
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-l> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d','⚡%d','D OK']

let g:ale_echo_msg_format = '[%linter%]%code:%%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"gutertags
let g:gutertags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutertags_ctags_extra_args = ['--files=+niazS', '--extra=+q']
let g:gutertags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutertags_ctags_extra_args += ['--c-kinds=+px']

"molokai
let g:molokai_original = 1
let g:rehash256 = 1

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
