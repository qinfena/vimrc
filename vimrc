syntax on
set nu "设置行号

"vim设置大括号自动补全并换行对齐
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
imap{ {}<ESC>i<CR><ESC>V<O

"=注释一行 -取消一行注释
map = I/* <ESC>A */<ESC>
map - 0xxx$xxx

"E增加函数的注释
map E o/*<CR> *<CR>*/<ESC>ja 

"解决vim的backspace不能正常使用
set backspace=indent,eol,start
