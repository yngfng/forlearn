"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Vundle begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    Plugin 'L9'
    " Git plugin not hosted on GitHub
    Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Avoid a name conflict with L9
    Plugin 'user/L9', {'name': 'newL9'}

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => install plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
Plugin 'derekwyatt/vim-scala'
Plugin 'tomlion/vim-solidity'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Vundle end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => General  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Sets how many lines of history VIM has to remember  
set history=700  
  
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Files, backups and undo  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Turn backup off, since most stuff is in SVN, git anyway...  
set nobackup  
set nowb  
set noswapfile  
  
  
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Text, tab and indent related  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set expandtab  
"set shiftwidth=4  
"set tabstop=4  
set shiftwidth=4  
set tabstop=4  
set smarttab  
  
set lbr  
set tw=500  
  
set ai "Auto indent  
set si "Smart indet  
"set wrap "Wrap lines  
  
" No sound on errors  
set noerrorbells  
set novisualbell  
set t_vb=  
set tm=500  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => yngfng add
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

" for swift begin """""""""""""
function! SwiftSet()
    " foldtext
    function! FoldText()
        let num = v:foldend-v:foldstart
        let txt = getline(v:foldstart)
        return txt." : ".num
    endfunction
    setlocal foldtext=FoldText()
    setlocal foldmethod=marker
    setlocal foldcolumn=3
    setlocal foldlevel=1

    " click open fold
    function! ToggleFold()
        if foldlevel(line('.'))>0
            if match(getline(line('.')), "{{{")>-1
                execute "normal" "za"
            endif
        endif
    endfunction
    noremap <LeftMouse> <LeftMouse>:call ToggleFold()<CR>
endfunction
au BufNewFile,BufRead *.swift call SwiftSet()
" for swift end """""""""""""

" no flash
set gcr=a:blinkon0
set number
set guifont=Courier:h14
"set guifont=Consolas:h14
set guifont=Menlo\ Regular:h13
set linespace=4
set nowrap
set nosi
au BufNewFile,BufRead *.frag    setf c
au BufNewFile,BufRead *.vert    setf c
au BufNewFile,BufRead *.ino     setf cpp
au BufNewFile,BufRead *.pde     setf java
au BufNewFile,BufRead *.pyde    setf python


" map
map gn :NERDTree<cr>
map <C-S> :w<cr>
map <C-S> :w<cr>
map <C-P> :!python %<cr>
map <C-L> :!python %&<cr><cr>
imap <C-J> <left>
imap <C-K> <right>
imap <F1> {{  }}<left><left><left>
imap <F2> {%  %}<left><left><left>
map ˙ <C-w>h
map ¬ <C-w>l
map ∆ <C-w>j
map ˚ <C-w>k

" for python
imap <C-L> []<left>
execute pathogen#infect()


" function----------------------
function! Incr(inc)
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        if a:inc == 1
            exe 'normal! '.c.'|'.a."\<C-a>"
        else
            exe 'normal! '.c.'|'.a."\<C-x>"
        endif
    endif
    normal '<
endfunction
vnoremap <C-a> :call Incr(1)<CR>
vnoremap <C-x> :call Incr(0)<CR>

" syntax----------------------
au BufNewFile,BufRead *.vert,*frag      setf c
au BufNewFile,BufRead *.ino             setf cpp
au BufNewFile,BufRead *.pde             setf java

" pydiction complete
let g:pydiction_location = 'D:\Program Files\Vim\pydiction\complete-dict'

" shot cut
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
map gj jjjjjjjjjj
map gk kkkkkkkkkk
map gn :NERDTree<CR>
map gtt :TlistToggle<CR>
map <A-1> :tabn 1<CR>
map <A-2> :tabn 2<CR>
map <A-3> :tabn 3<CR>
map <A-4> :tabn 4<CR>
map <A-5> :tabn 5<CR>
map <A-6> :tabn 6<CR>
map <A-7> :tabn 7<CR>
map <A-8> :tabn 8<CR>
map <C-N> :s#^\( *\)#\1//#<CR>
map <C-K> :s#^\( *\)//#\1#<CR>
map <C-N> :s/^\( *\)/\1--/<CR>
map <C-K> :s/^\( *\)--/\1/<CR>
map <C-S> :w<CR>
map <F5> :!<CR><CR>
map <C-H> zh
map <C-H> o<C-V>Iyngfngyngfng<ESC>gv:s/yngfngyngfng *//<CR>
map <C-L> zl
imap <C-J> <Left>
imap <C-K> <Right>
map <F4> :!python %<CR><CR>
map <F3> :!python %&<CR><CR>
map <C-m> :hi Comment guifg=#d3e4cb<CR>
map <C-m> :hi Comment guifg=#b3d4ab<CR>
set nohlsearch

function! JAVALog()
    function! JAVAFoldText()
        "let txt = substitute(getline(v:foldstart), '^.', '+', 1)
        let space = '                                                                             '
        let line = getline(v:foldstart)
        let linenum = v:foldend-v:foldstart
        let lenth = len(line)
        "let txt = line.linenum
        "let txt = line.space[0:(50-lenth)].linenum.' lines folded'
        let txt = line.'  <>---'.linenum.'---<>  }'
        return txt
    endfunction

    setlocal foldmethod=expr
    "setlocal foldexpr=getline(v:lnum)[0:5]=='class\ '
    "setlocal foldexpr=JAVAFoldExpr(v:lnum)
    setlocal foldtext=JAVAFoldText()
    setlocal foldlevel=1
    "setlocal foldcolumn=0
        highlight Folded guifg=#000080 guibg=bg
        highlight FoldColumn guifg=fg guibg=bg
    setlocal fillchars=vert:\|

    function! FoldOpenClose()
        if (col('.') <= 8) 
            if (foldlevel(line('.'))>0)
                "if getline(line('.'))=~'[^class|^def|^    def|^if]'
                if getline(line('.'))=~'{ *$'
                    execute "normal" "za"
                endif
            endif
        endif
    endfunction

    noremap <LeftMouse> <LeftMouse>:call FoldOpenClose()<CR>
endfunction
au BufNewFile,BufRead *.java call JAVALog()
au BufNewFile,BufRead *.sol call JAVALog()
" for log
function! LogSet()
    function! LogFoldText()
        "let txt = substitute(getline(v:foldstart), '^.', '+', 1)
        let txt = substitute(getline(v:foldstart), '{{{\d\+$', '', '')
        let txt = substitute(txt, '-', '+', 1)
        return txt
    endfunction

    setlocal foldmethod=marker
    setlocal foldtext=LogFoldText()
    setlocal foldcolumn=0
    setlocal foldlevel=0
    setlocal fillchars=vert:\|
    "setlocal cursorline
    "highlight cursorline guifg=blue guibg=bg
    "setlocal fillchars=vert:\|,fold:\ 
        highlight Folded guifg=fg guibg=bg
        highlight FoldColumn guifg=fg guibg=bg

    syntax match cFoldMarker /{{{\d\+/
    syntax match cFoldMarker /}}}\d\+/
    highlight cFoldMarker guifg=bg
    "noremap <expr> <LeftMouse> getline(line('.'))[col('.')] == '+' ? 'za' : '\<LeftMouse>'
    function! Echo(varlue)
        "return ":echo ".a:varlue."\<CR>"
        return ":echo afdsafds"
    endfunction

    function! FoldOpenClose()
        if (col('.') <= 30) 
            if (foldlevel(line('.'))>0)
                if (match(getline(line('.')), "{{{"))>-1
                    execute "normal" "za"
                endif
            endif
        endif
    endfunction

    noremap <LeftMouse> <LeftMouse>:call FoldOpenClose()<CR>
endfunction

au BufNewFile,BufRead *.sysmonlog call LogSet()

function! PythonSet()
    function! PythonFoldText()
        "let txt = substitute(getline(v:foldstart), '^.', '+', 1)
        let space = '                                                                             '
        let line = getline(v:foldstart)
        let linenum = v:foldend-v:foldstart
        let lenth = len(line)
        "let txt = line.linenum
        "let txt = line.space[0:(50-lenth)].linenum.' lines folded'
        let txt = line.'  <>--<>'
        return txt
    endfunction
    function! PythonFoldExpr(lnum)
        let lvl = '='

        if getline(a:lnum+1)[0:4]=~'    \S'
            let lvl = '<2'
        endif
        if getline(a:lnum)[0:7]=='    def '
            let lvl = '>2'
        endif

        if getline(a:lnum+1)[0]=~'\S'
            let lvl = '<1'
        endif
        if getline(a:lnum)[0:5]=='class '||getline(a:lnum)[0:3]=='def '||getline(a:lnum)[0:1]=='if'
            let lvl = '>1'
        endif

        "let lvl = getline(a:lnum)[0:5]=='class\ '
        return lvl
    endfunction

    setlocal foldmethod=expr
    "setlocal foldexpr=getline(v:lnum)[0:5]=='class\ '
    setlocal foldexpr=PythonFoldExpr(v:lnum)
    setlocal foldtext=PythonFoldText()
    setlocal foldlevel=1
    setlocal foldcolumn=0
        highlight Folded guifg=#000080 guibg=bg
        highlight FoldColumn guifg=fg guibg=bg
    setlocal fillchars=vert:\|

    function! FoldOpenClose()
        if (col('.') <= 8) 
            if (foldlevel(line('.'))>0)
                "if getline(line('.'))=~'[^class|^def|^    def|^if]'
                if getline(line('.'))=~'^class'||getline(line('.'))=~'^def '||getline(line('.'))=~'^if'||getline(line('.'))=~'^    def'
                    execute "normal" "za"
                endif
            endif
        endif
    endfunction

    noremap <LeftMouse> <LeftMouse>:call FoldOpenClose()<CR>
endfunction
au BufNewFile,BufRead *.py call PythonSet()


function! SVLog()
    function! SVFoldText()
        "let txt = substitute(getline(v:foldstart), '^.', '+', 1)
        let space = '                                                                             '
        let line = getline(v:foldstart)
        let linenum = v:foldend-v:foldstart
        let lenth = len(line)
        "let txt = line.linenum
        "let txt = line.space[0:(50-lenth)].linenum.' lines folded'
        let txt = line.'  <>--<>'
        return txt
    endfunction
    function! SVFoldExpr(lnum)
        let lvl = '='

        if getline(a:lnum)=~'^ *endfunction'||getline(a:lnum)=~'^ *endtask'
            let lvl = '<2'
        endif
        if getline(a:lnum)=~'^ *function'||getline(a:lnum)=~'^ *task'
            let lvl = '>2'
        endif

        if getline(a:lnum)=~'^ *class '
            let lvl = '>1'
        endif
        if getline(a:lnum)=~'^ *endclass '
            let lvl = '<1'
        endif

        "let lvl = getline(a:lnum)[0:5]=='class\ '
        return lvl
    endfunction

    setlocal foldmethod=expr
    "setlocal foldexpr=getline(v:lnum)[0:5]=='class\ '
    setlocal foldexpr=SVFoldExpr(v:lnum)
    setlocal foldtext=SVFoldText()
    setlocal foldlevel=1
    "setlocal foldcolumn=0
        highlight Folded guifg=#000080 guibg=bg
        highlight FoldColumn guifg=fg guibg=bg
    setlocal fillchars=vert:\|

    function! FoldOpenClose()
        if (col('.') <= 8) 
            if (foldlevel(line('.'))>0)
                "if getline(line('.'))=~'[^class|^def|^    def|^if]'
                if getline(line('.'))=~'^class'||getline(line('.'))=~'function '||getline(line('.'))=~'task'
                    execute "normal" "za"
                endif
            endif
        endif
    endfunction

    noremap <LeftMouse> <LeftMouse>:call FoldOpenClose()<CR>
endfunction
au BufNewFile,BufRead *.sv call SVLog()

function! VLog()
    function! SVFoldText()
        "let txt = substitute(getline(v:foldstart), '^.', '+', 1)
        let space = '                                                                             '
        let line = getline(v:foldstart)
        let linenum = v:foldend-v:foldstart
        let lenth = len(line)
        "let txt = line.linenum
        "let txt = line.space[0:(50-lenth)].linenum.' lines folded'
        let txt = line.'  <>--<>'
        return txt
    endfunction

    "setlocal foldmethod=expr
    "setlocal foldexpr=getline(v:lnum)[0:5]=='class\ '
    "setlocal foldexpr=SVFoldExpr(v:lnum)
    setlocal foldtext=SVFoldText()
    "setlocal foldlevel=1
    "setlocal foldcolumn=0
        highlight Folded guifg=#000080 guibg=bg
        highlight FoldColumn guifg=fg guibg=bg
    setlocal fillchars=vert:\|

    function! FoldOpenClose()
        if (col('.') <= 8) 
            if (foldlevel(line('.'))>0)
                "if getline(line('.'))=~'[^class|^def|^    def|^if]'
                if getline(line('.'))=~'// {{{'
                    execute "normal" "za"
                endif
            endif
        endif
    endfunction

    noremap <LeftMouse> <LeftMouse>:call FoldOpenClose()<CR>
endfunction
au BufNewFile,BufRead *.v call VLog()

function! JAVALog()
    function! JAVAFoldText()
        "let txt = substitute(getline(v:foldstart), '^.', '+', 1)
        let space = '                                                                             '
        let line = getline(v:foldstart)
        let linenum = v:foldend-v:foldstart
        let lenth = len(line)
        "let txt = line.linenum
        "let txt = line.space[0:(50-lenth)].linenum.' lines folded'
        let txt = line.'  <>---'.linenum.'---<>  }'
        return txt
    endfunction

    setlocal foldmethod=expr
    "setlocal foldexpr=getline(v:lnum)[0:5]=='class\ '
    "setlocal foldexpr=JAVAFoldExpr(v:lnum)
    setlocal foldtext=JAVAFoldText()
    setlocal foldlevel=1
    "setlocal foldcolumn=0
        highlight Folded guifg=#000080 guibg=bg
        highlight FoldColumn guifg=fg guibg=bg
    setlocal fillchars=vert:\|

    function! FoldOpenClose()
        if (col('.') <= 8) 
            if (foldlevel(line('.'))>0)
                "if getline(line('.'))=~'[^class|^def|^    def|^if]'
                if getline(line('.'))=~'{ *$'
                    execute "normal" "za"
                endif
            endif
        endif
    endfunction

    noremap <LeftMouse> <LeftMouse>:call FoldOpenClose()<CR>
endfunction
au BufNewFile,BufRead *.java call JAVALog()
au BufNewFile,BufRead *.tcl call JAVALog()
