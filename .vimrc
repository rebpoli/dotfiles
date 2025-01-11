au BufRead,BufNewFile *.edp set filetype=edp
au BufRead,BufNewFile *.poc set filetype=cmgdat
au BufRead,BufNewFile *.dat set filetype=cmgdat
au BufRead,BufNewFile *.inc set filetype=cmgdat
au BufRead,BufNewFile *.cmm set filetype=cmgdat
au BufRead,BufNewFile *.gat set filetype=cmgdat
au! Syntax cmgdat source $VIM/cmgdat.vim
au! Syntax cmgdat1 source $VIM/cmgdat1.vim

autocmd BufReadPost,FileReadPre *.lib set filetype=clipper
autocmd BufReadPost,FileReadPre *.rcs set filetype=rcslog

set path=.,/usr/include,../include,../../include,../src,../../src,,

set ruler
set foldmethod=diff
set diffopt=filler,context:3
set nofoldenable

"set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
behave xterm
" Sets the backspace behavior

syntax enable

set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

filetype plugin on

set hlsearch
set listchars=tab:>\-
set list

noremap ] <C-]>?DOC<CR>z<CR>/sub<CR>
noremap [ <C-T>zz
noremap { :tp
noremap } :tn 

noremap ] <C-]>
noremap [ <C-T>
noremap { :tp
noremap } :tn 

noremap <C-]> <C-W><C-]>
noremap <C-P> :ts

map \z <Plug>Comment
map \Z <Plug>DeComment
vmap \z <Plug>VisualComment
vmap \Z <Plug>VisualDeComment

""Navigate in buffers
map ( :bp
map ) :bn
""Opens windows (vertical, horizontal)
map \v <C-W>v
map \s <C-W>s
""Distributes the windows vertically equal and maximum (top is buf. browser)
map \= <C-W>=<C-W>_
map \[ 10<C-W><
map \] 10<C-W>>
map \{ 10<C-W>-
map \} 10<C-W>+

""navigate in windows
map \l <C-W>l
map \h <C-W>h

map \j <C-W>j
map \k <C-W>k

map <C-l> zl
map <C-h> zh
map <C-k> <C-y>
map <C-j> <C-E>
"map K <C-W>K
"map J <C-W>J
"map L <C-W>L
"map H <C-W>H
"map <C-C><C-C> :bd
"map <C-C>:close
"map <C-N><C-N> :set nonumber
"map <C-N> :set number

"map <C-T> :TlistToggle

"map \sl 0v$

function FoldBrace()
    if getline(v:lnum+1)[0] == '{'
        return 1 
    endif
    if getline(v:lnum) =~ '{'
        return 1 
    endif
    if getline(v:lnum)[0] =~ '}'
        return '<1'
    endif
    return -1
endfunction

set nowrap

"set grepprg=grep\ -nH\ $*

""Jump to directory which contains current buffer
map \df :lcd %:p:h<cr>

""Map the toggles
map \n :call Toggle_number()<enter>
map \w :call Toggle_wrap()<enter>
map \d :call Toggle_diff()<enter>
map \dm <Esc>:call Add_unique_debug()<enter>@w

"set backspace=start,eol,indent

"map \cn :cn
"map \cp :cp
"map \cf :cnf
"map \cw :cw
"map \m  :mak:cw

""noremap <LeftRelease> <LeftRelease>"*y
set wildmode=longest:full
set wildmenu

set background=dark
"hi Folded ctermbg=gray

"colorscheme desertmod

map <F4> :A<CR>
"set tags=./tags;../tags;../../tags

"fun! ShowFuncName()
"  let lnum = line(".")
"  let col = col(".")
"  echohl ModeMsg
"  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
"  echohl None
"  call search("\\%" . lnum . "l" . "\\%" . col . "c")
"endfun
"map <F1> :call ShowFuncName() <CR>

"set foldmethod=indent
"set foldnestmax=10
"set foldclose=all
"set foldlevel=1
"set foldlevelstart=1
"map <F2> zr
"map <F3> zm
"map <F5> zc

"set encoding=utf-8

"fun! ShowFuncName()
"  let lnum = line(".")
"  let col = col(".")
"  echohl ModeMsg
"  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
"  echohl None
"  call search("\\%" . lnum . "l" . "\\%" . col . "c")
"endfun
"map <C-Q> :call ShowFuncName() <CR>



function Toggle_number()
  if &number == 0
    set number
  else
    set nonumber
  endif
  echo &number == 0 ?  "Line Numbering now OFF" : "Line Numbering now ON" 
  return -1
endfunction

function Toggle_wrap()
  if &wrap == 0
    set wrap
  else
    set nowrap
  endif
  echo &wrap == 0 ?  "Line Wrapping now OFF" : "Line Wrapping now ON" 
  return -1
endfunction

function Add_unique_debug()
  if !exists('g:debug_count')
    let g:debug_count = 23456
  endif

  let g:debug_count = g:debug_count + 1

  let @w = "0Ikidebug(1,'FLOW AT [".g:debug_count."]');=="
endfunction

function Dcount (count)
  if !exists('g:debug_count')
    let g:debug_count = a:count 
  endif

  let g:debug_count = a:count

  let @w = "0Ikidebug(1,'FLOW AT [".g:debug_count."]');=="
endfunction

function Toggle_diff()
  if &diff == 0
    set diff
    set scrollbind
  else
    set nodiff
    set noscrollbind
  endif
  echo &diff == 0 ?  "Diffing now OFF" : "Diffing now ON" 
  return -1
endfunction


""" PLUGIN MANAGER
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'vim-scripts/grep.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
set updatetime=500 " update time do tagbar
map <F8> :Tagbar <CR>
map <F7> :NERDTreeToggle <CR>

map <F5> :w!<CR>

"" Latex stuff
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

call plug#end()

colorscheme desert

map \<Space> :VimtexView<CR>

" SNIPPETS QUICK GUIDE
" - \ll : enable autocompile (everytime file is saved)
" - \<Space> : Compile and view current line in Zathura
" - ~/.vim/UltiSnips/tex.snippets : the available snippets
" Ex:
" - LATEX<tab> : includes latex headers
" - ///<tab>   : fraction
" - align<tab> : begin{align}...
"   etc
