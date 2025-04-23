

syn keyword cType uint string sint suint

syn match cppScopeResolution "\<[a-zA-Z0-9_]\+\>::[a-zA-Z0-9_~]\+"
hi link cppScopeResolution Operator

hi cppScopeResolution ctermfg=cyan guifg=#00ffff
