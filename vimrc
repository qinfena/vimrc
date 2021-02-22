syntax on
set nu "设置行号

"vim设置大括号自动补全并换行对齐
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
imap { {}<ESC>i<CR><ESC>V<O

"vim小括号自动补全
imap ( ()<ESC>i

"python print函数自动补全
imap print print(''<ESC>i

"python type函数自动补全
imap type type(

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
