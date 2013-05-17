set nocompatible
" for windows
set grepprg=internal
set shiftwidth=4 softtabstop=4 expandtab
set incsearch ignorecase hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>:GhcModTypeClear<CR>
syntax on
"lang en
"language mes en
"set langmenu=en_US.UTF-8
:filetype plugin on
:filetype indent on
set gfn=DejaVu_Sans_Mono:h11:b:cANSI
"set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set laststatus=2

" set the background
if has("gui_running")
    set t_Co=256
    set guioptions-=T
    " feel free to choose :set background=light for a different style
    colorscheme peaksea 
    set background=dark
else
    colorscheme zellner
    set background=dark
endif

set rnu
" to display the buffer list
:nnoremap <a-space> :call GoBuf()<CR>:buffer<Space>
:nnoremap <c-tab> :bn<CR>
:nnoremap <c-s-tab> :bp<CR>

" for the nerd tree plugin
nmap <silent> <c-n> :NERDTreeToggle<CR>
" " for the taglist
nmap <silent> <c-l> :TlistToggle<CR>

"set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1

" set the tags
set tags=tags,/,c:/drive_d/share/CCSnapshotViews/clone/1cm_fsw_base_wm/tags_1cm_fsw_base_wm,c:/drive_d/share/CCSnapshotViews/clone/compass_release/tags_compass_release

" ESC key
inoremap jk <esc>
inoremap kj <esc>

" indentation
set smartindent
set backspace=indent,eol,start
"set foldmethod=expr
"set foldcolumn=4

" project plugin configuration
let g:proj_flags='gcimst'

" haskell plugin configuration
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync
:nnoremap _t :GhcModType<CR>
:nnoremap _T :GhcModTypeInsert<CR>
"au BufEnter *.hs,*.lhs compiler ghc 
"let g:haddock_docdir="c:/Program Files/Haskell Platform/2012.2.0.0/doc/html/"
"let g:ghc="c:\Program Files\Haskell Platform\2012.2.0.0\bin\ghc"
"let g:haddock_browser="C:/Documents and Settings/chagniot/Local Settings/Application Data/Google/Chrome/Application/chrome.exe"

" no blinking cursor
set guicursor+=a:blinkon0

" spell checking
set spell spelllang=en_us

" display the buffer
function! GoBuf()
  for buf in range(1, bufnr('$'))
    if buflisted(buf)
        echo printf ('%*u   %-*s %s', 2, bufnr(buf), 50, fnamemodify(bufname(buf),':p:t'), fnamemodify(bufname(buf),':p:h'))
    endif
  endfor
endfunction

set nobackup
set nowb
set noswapfile

set wildmenu
set autowrite

