" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2003/05/06 16:37:49 $
" Last Change:	$Date: 2003/06/02 19:40:21 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.6 2003/06/02 19:40:21 fugalh Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="desertmod"

hi Normal	gui=NONE guifg=White guibg=black
hi Error	guibg=blue

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey ctermbg=1
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	gui=NONE guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	gui=NONE guibg=grey30 guifg=gold
hi FoldColumn	gui=NONE guibg=grey30 guifg=tan
hi IncSearch	gui=NONE guifg=slategrey guibg=khaki
"hi LineNr
hi ModeMsg	gui=NONE guifg=goldenrod
hi MoreMsg	gui=NONE guifg=SeaGreen
hi NonText	gui=NONE guifg=LightBlue guibg=grey30
hi Question	gui=NONE guifg=springgreen
hi Search	gui=NONE guibg=peru guifg=wheat
hi SpecialKey	gui=NONE guifg=yellowgreen
hi StatusLine	gui=NONE guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	gui=NONE guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	gui=NONE guifg=indianred
hi Visual	gui=NONE guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg	gui=NONE guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment	gui=NONE guifg=DarkGray
hi Constant	gui=NONE guifg=#ffa0a0
hi Identifier	gui=NONE guifg=palegreen
hi Statement	gui=NONE guifg=khaki
hi PreProc	gui=NONE guifg=indianred
hi Type		gui=NONE guifg=darkkhaki
hi Special	gui=NONE guifg=navajowhite
"hi Underlined
hi Ignore	gui=NONE guifg=grey40
"hi Error
hi Todo		gui=NONE guifg=orangered guibg=yellow2

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=bold ctermfg=yellow ctermbg=blue
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	gui=NONE guifg=darkgray ctermfg=darkgray
hi Question	ctermfg=green
highlight StatusLine     term=bold ctermbg=black   ctermfg=Yellow
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1
hi Comment	ctermfg=red cterm=NONE
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=6
hi Statement	ctermfg=3
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	cterm=bold ctermfg=7 ctermbg=1

"hi cComment	cterm=NONE ctermfg=darkcyan

hi piTag	gui=NONE guifg=khaki
hi innerRef	guifg=palegreen
hi op	guifg=gray
hi divider	guifg=yellow
hi refDef	guifg=Green
hi pageRef	guifg=Green gui=underline
hi well	guifg=black guibg=lightred
hi page	guifg=black guibg=lightyellow
hi fhf	guifg=black guibg=lightgreen
hi params	guifg=skyblue
hi own	guifg=purple
hi colors	guifg=brown
hi values	guifg=darkgray
hi file	guifg=blue

hi PerlControl	 gui=none ctermfg=green cterm=underline
hi perlSharpBang gui=none ctermfg=green cterm=underline
"hi Perl gui=none 
"vim: sw=4
