unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

"  Mine
set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme habamax
" Show whitespace: spaces as dots, tabs as arrows
set list
set listchars=space:·,tab:»\ ,trail:·

" Format C/C++ files with clang-format on save, preserving cursor position

"function! FormatWithClangFormat()
"  let l:curw = winsaveview()
"  silent %!clang-format --style=file
"  if v:shell_error
"    undo
"  endif
"  call winrestview(l:curw)
"endfunction
"
"augroup ClangFormat
"  autocmd!
"  autocmd BufWritePre *.c,*.h,*.cpp,*.hpp call FormatWithClangFormat()
"augroup END
"
