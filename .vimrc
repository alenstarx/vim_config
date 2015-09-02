" pathogen 可能造成语法高亮失效
execute pathogen#infect()

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
"配色方案 
" colorscheme peachpuff
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" 自动换行
set wrap
" 整词换行
set linebreak
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fileencodings=utf8,cp936,gb18030,big5
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set helplang=cn
set encoding=utf8 
set langmenu=zh_CN.UTF-8 
set imcmdline 
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim
" 设置字体。
set guifont=Liberation\Mono\ 12
"set  guifont=Fixedsys\Excelsior\3.01\ 14

nnoremap <silent> <F3> :Grep<CR>

if has("gui_running")
"au GUIEnter * simalt ~x  " 窗口启动时自动最大化
"winpos 20 20            "指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=20 columns=90 "指定窗口大小，lines为高度，columns为宽度
"set guioptions-=m       " 隐藏菜单栏
"set guioptions-=T       " 隐藏工具栏
set guioptions-=L       " 隐藏左侧滚动条
set guioptions-=r       " 隐藏右侧滚动条
set guioptions-=b	" 隐藏底部滚动条
"set showtabline=0	" 隐藏Tab栏
endif

set tags=./tags
" ct build ctags (ctags -R)
"nmap <F9> <Esc>:!ctags -R *<CR>
map ct :call BuildTags()<CR>
func! BuildTags()
exec "!ctags -R "
endfunc

set cscopequickfix=s-,c-,d-,i-,t-,e-
"cs add ./cscope.out
" cs build cscope (cscope -Rbq )
map cs :call BuildCscope()<CR>
func! BuildCscope()
"exec "!rm csope.out"
exec "!cscope -Rbq "
cs add ./cscope.out
endfunc
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
" set vim to chdir for each file
if exists('+autochdir')
	set autochdir
else
	autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
"cs add ./cscope.out
"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>
"" let g:winManagerWindowLayout='FileExplorer'
"" nmap wm :WMToggle<cr>
"" nmap tl :Tlist<cr>


" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 在编辑过程中，在右下角显示光标位置的状态行
set ruler           
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"''set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
set number

" F5编译和运行C程序，F6编译和运行C++程序
" C的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc -Wall % -o %<"
exec "! ./%<"
endfunc

 

" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ -Wall % -o %<"
exec "! ./%<"
endfunc
" 能够漂亮地显示.NFO文件
set encoding=utf-8
function! SetFileEncodings(encodings)
let b:myfileencodingsbak=&fileencodings

let &fileencodings=a:encodings

endfunction
function! RestoreFileEncodings()
let &fileencodings=b:myfileencodingsbak

unlet b:myfileencodingsbak

endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

" 为C程序提供自动缩进
" set smartindent 
"
"代码补全
" set completeopt=preview,menu 
" function! ClosePair(char) 
" if getline('.')[col('.') - 1] == a:char 
" return "\<Right>" 
" else 
" return a:char 
" endif 
" endfunction 
" filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
" set completeopt=longest,menu 
" let g:AutoComplPop_Behavior = {
\ 'c': [ {'command' : "\<C-x>\<C-o>",
\ 'pattern' : ".",
\ 'repeat' : 0}
\ ]
\}
"
"
"


" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1
"
" " Enable comment strings
let vala_comment_strings = 1
"
" " Highlight space errors
let vala_space_errors = 1
" " Disable trailing space errors
" "let vala_no_trail_space_error = 1
" " Disable space-tab-space errors
let vala_no_tab_space_error = 1

" " Minimum lines used for comment syncing (default 50)
" "let vala_minlines = 120

" pathogen
"execute pathogen#infect()


"" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Track the engine.
" Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

""""youcompleteme  默认tab  s-tab 和自动补全冲突
"""let g:ycm_key_list_select_completion=['<c-n>']
""" let g:ycm_key_list_select_completion = ['<Down>']
"""let g:ycm_key_list_previous_completion=['<c-p>']
""" let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_key_list_select_completion=['<A-n>']
"let g:ycm_key_list_previous_completion=['<A-p>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

"let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
"let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"""nnoremap <leader>lo :lopen<CR>	"open locationlist
"""nnoremap <leader>lc :lclose<CR>	"close locationlist
"inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0

"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let g:go_disable_autoinstall = 0
let g:neocomplete#enable_at_startup = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

let $GOPATH = "/opt/workspace/beego"

"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabDefaultCompletionType = "<c-n>"
