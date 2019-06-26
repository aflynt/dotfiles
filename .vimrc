" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on

set autoread

let mapleader = ","
let g:maplearder = ","


"fast saving
nnoremap <leader>w :w!<cr>

nnoremap <silent> <leader>s :set spell!<CR>

set spelllang=en_us

:set noswapfile

" VIM UI
set wildmenu
"set wildignore *.o, *~, *.pyc

set ruler

set cmdheight=2

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set incsearch
set lazyredraw

set magic

set mat=2
set noerrorbells
set novisualbell

set tm=500

syntax enable

set encoding=utf8
set ffs=unix,mac,dos


set autoindent
set ts=2
set shiftwidth=2
set wrapmargin=10
set number
set ai
set si
set expandtab
set scrolloff=10
set list
set listchars=tab:>-,trail:-


nnoremap ,wq :wq<CR>
set shiftround
set softtabstop=2

set foldenable
set foldmethod=syntax

" """"""""""""""""
" colors and fonts
" """"""""""""""""
set background=dark
colorscheme desert

" Pair matching
inoremap {<CR> {<CR>}<Esc>0
inoremap {{  {}<Left>

inoremap (<CR> (<CR>)<Esc>0
inoremap ((  ()<Left>

inoremap [<CR> [<CR>]<Esc>0
inoremap [[  []<Left>

inoremap ''  ''<Left>

" Map Esc key
inoremap <Leader>e <esc>
inoremap <Leader><Leader> <esc>
nnoremap <Leader><Leader> <esc>

ab teh the

map <F3> ggVGg?


let @p = ':put =map(range(1,10), ''printf(''''%02d'''', v:val)'')'
let @c = 'k^/"v^yjPA"k0i#j'
let @n = '"ddwbkw"aywjb"ap'





" ~/.vimrc ends here
