syntax on
set nu
set laststatus =2
set ruler "always show current position
set showmode "show current mode
set showmatch "show matching parens etc
set backspace=indent,eol,start "let backspace work normally
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch

filetype plugin indent on

" nasm syntax higlighting
autocmd BufNewFIle,BufRead *.asm setfiletype nasm

set showcmd
set wildmenu

set undofile
set undodir=$HOME/.vim/undodir

let mapleader = " "
let g:indentLine_indentLevel = 4

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" bad tabs
match ExtraWhitespace /[^\t]\zs\t\+/
"trailing whitespace not at the start of a new line
match ExtraWhitespace /\s\+\%#\@<!$/

"tab between open windows
noremap <leader><Tab> <C-w>w

"new vertical window
nnoremap <leader>v <C-w>v

"new hotizonatal window
nnoremap <leader>s <C-w>s

"jumplist back
noremap <leader><BS> <C-o>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" set spellcheck language
set spelllang=en_gb
set spell

function! Tab_Or_Complete()
   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
     return "\<C-N>"
   else
     return "\<Tab>"
   endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! <SID>StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
endfunction
nnoremap <silent> <leader>s :call <SID>StripTrailingWhitespaces()<CR>


augroup CursorLineOnlyInActiveWindow
 autocmd!
 autocmd VimEnter,WinEnter,BufWinEnter * setlocal number
 autocmd WinLeave * setlocal nonumber
augroup END

call plug#begin('~/.vim/plugged')
Plug 'git://github.com/airblade/vim-gitgutter.git'
Plug 'git://github.com/Yggdroot/indentLine.git'
call plug#end()
