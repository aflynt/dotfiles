" ~/.vimrc (configuration file for vim only)
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'thoughtstream/Damian-Conway-s-Vim-Setup'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
"set list
"set listchars=tab:>-,trail:-
"set listchars=trail:-


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
let @d = '80lbEa'   " cut lines off at ~80chars


"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 2

set splitbelow
set splitright


" max out height/ width or equalize
"ctrl + w _
"ctrl + w |
"ctrl + w =

" ~/.vimrc ends here
