 " vim pathogen
call pathogen#infect('~/.vim/bundle/{}')





set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set background=dark " we plan to use a dark background
set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch)
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name
syntax on " syntax highlighting on






filetype plugin indent on " load filetype plugins/indent settings
"set autochdir " always switch to the current file directory
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set backupdir=~/.vim/backup " where to put backup files
set clipboard+=unnamed " share windows clipboard
set directory=~/.vim/tmp " directory to place swap files in
set undofile " save undo history to disk
set undodir=~/.vim/undo " directory to place undo history files
set history=1000
set undolevels=2000
set undoreload=20000
set fileformats=unix,dos,mac " support all three, in this order
set hidden " you can change buffers without saving
set iskeyword+=_,$,@,%,# " none of these are word dividers
set noerrorbells " don't make noise
set whichwrap=b,s,<,>,~,[,]
"set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"              | | | | | | | | |
"              | | | | | | | | +-- "]" Insert and Replace
"              | | | | | | | +-- "[" Insert and Replace
"              | | | | | | +-- "~" Normal
"              | | | | | +-- <Right> Normal and Visual
"              | | | | +-- <Left> Normal and Visual
"              | | | +-- "l" Normal and Visual (not recommended)
"              | | +-- "h" Normal and Visual (not recommended)
"              | +-- <Space> Normal and Visual
"              +-- <BS> Normal and Visual
set wildmenu " turn on command line completion wild style
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=list:longest " turn on wild mode huge list





" UI
set cursorcolumn " highlight the current column
set cursorline " highlight current line
set incsearch " BUT do highlight as you type you
              " search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines
                " betweens rows
set list " we do what to show tabs, to ensure we get them
         " out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
set matchtime=5 " how many tenths of a second to blink
                " matching brackets for
set nohlsearch " do not highlight searched for phrases
set nostartofline " leave my cursor where it was
set novisualbell " don't blink
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set report=0 " tell us when anything is changed via :...
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid
                    " 'press a key' prompt
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the size
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer
syntax match Tab /\t/ " tabs are tabs, and nothing else
hi Tab ctermfg=7
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red





" Text Formatting/Layout
set completeopt=longest,menuone " don't use a pop up menu for completions
set expandtab " expand tabs to spaces
set formatoptions=rq " Automatically insert comment leader on return,
                     " and let gq format comments
set ignorecase " case insensitive by default
set infercase " case inferred by default
set nowrap " do not wrap line
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=2 " auto-indent amount when using cindent,
                 " >>, << and stuff like that
set softtabstop=2 " when hitting tab or backspace, how many spaces
                  "should a tab be (see expandtab)
set tabstop=2 " real tabs should be 8, and they will show with
              " set list on
highlight OverLength ctermfg=red
match OverLength /\%81v.\+/


" Mappings
" space / shift-space scroll in normal mode
noremap <S-space> <C-b>
noremap <space> <C-f>

" shift+tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

" F2 for jumping between source and header files
nmap <F2> :A<CR>

" navigate between buffers using ctrl+arrow keys
nmap <C-left> :bprev<CR>
nmap <C-right> :bnext<CR>
" navigate between tabs using alt+arrow keys
nmap <A-left> :tabp<CR>
nmap <A-right> :tabn<CR>

" Autocommands
" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
" special for txt
au BufRead,BufNewFile *.txt set foldlevel=2
au BufRead,BufNewFile *.txt set foldmethod=indent
au BufRead,BufNewFile *.txt set foldtext=foldtext()
au BufRead,BufNewFile *.txt set listchars=tab:\ \
au BufRead,BufNewFile *.txt set noexpandtab
au BufRead,BufNewFile *.txt set shiftwidth=4
au BufRead,BufNewFile *.txt set softtabstop=4
au BufRead,BufNewFile *.txt set tabstop=4
au BufRead,BufNewFile *.txt set syntax=notes
au BufRead,BufNewFile *.txt set nocursorcolumn
au BufRead,BufNewFile *.txt set nocursorline
au BufRead,BufNewFile *.txt set guifont=Consolas:h12
au BufRead,BufNewFile *.txt set spell


" Gundo is a plugin to make browsing this ridiculously powerful undo tree less
" painful.
nnoremap <F5> :GundoToggle<CR>

" cscope:
" Stop cscope from saying saying the database already has been read
set nocscopeverbose
" F3 for searching index for current marked symbole
nmap <F3> <C-\>s
" F4 for poping back in the F3 history
nmap <F4> <C-t>
