syntax on
set nu "设置行号

"vim设置大括号自动补全并换行对齐
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
imap{ {}<ESC>i<CR><ESC>V<O

"=注释一行 -取消一行注释
map = I/* <ESC>A */<ESC>
map - 0xxx$xxx

"注释说明一行
map B <ESC>A    /*  */<ESC>hhi

"E增加函数的注释
map E o/*<CR> *<CR>*/<ESC>ka 

"解决vim的backspace不能正常使用
set backspace=indent,eol,start

