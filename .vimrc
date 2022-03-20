" ~/.vimrc (configuration file for vim only)
set nocompatible
filetype off
let mapleader = ","
let g:maplearder = ","

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
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
Plugin 'aflynt/vim-dichromatic'
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

" Vimscript file settings ------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html setlocal foldmethod=manual
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  "autocmd FileType html nnoremap <buffer> <leader>f Vatzf
augroup END
" }}}
" leader c == comment --------------{{{
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
autocmd FileType c          nnoremap <buffer> <leader>c I//<esc>
autocmd FileType cpp        nnoremap <buffer> <leader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <leader>c I#<esc>
autocmd FileType html       nnoremap <buffer> <leader>c I<!--A-->0
autocmd FileType css        nnoremap <buffer> <leader>c I/*A*/0

autocmd FileType python     iabbrev  <buffer>  iff if:<left>
autocmd FileType javascript iabbrev  <buffer>  iff if ()<left>
autocmd FileType c          iabbrev  <buffer>  iff if ()<left>
autocmd FileType cpp        iabbrev  <buffer>  iff if ()<left>
" }}}

"edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sm :set fdm=marker<cr>

"chop linewidths to ~80 chars
nnoremap <leader>xx 80lea

"insert checkmark
nnoremap <leader>ok 0/[lct]OK0
nnoremap <leader>ng 0/[lct]XX0
nnoremap <leader>td 0/[lct]<Space>0
nnoremap <leader>mm 0i- [ ] 0
inoremap ,mm - [ ]

"remap escaping insert mode
inoremap jk <esc>
inoremap <Leader>e  <esc>
inoremap <Leader><Leader>  <esc>
nnoremap <Leader><Leader>  <esc>

" remap window movement
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

"window widening
nnoremap <leader>s <
nnoremap <leader>b >

"open tab
nnoremap <leader>tn :tabnew<cr>

"change dir
nnoremap <leader>cd :cd %:h<cr>

" set foldmethod marker
nnoremap <leader>fm :set fdm=marker<cr>

autocmd BufNewFile * :write
autocmd BufWritePre * %s/\s\+$//e

" grepOperator --------------{{{
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let fname = @%
    let myfdir  = expand('%:p:h')

    "silent execute "grep! -R " . shellescape(@@) . " ."
    "silent execute "grep! " . " /c:" . shellescape(@@) . " \\" . myfdir . "\\" . fname
    silent execute "grep! " . " /c:" . shellescape(@@) . " " . myfdir . "\\" . fname
    copen
endfunction
"---------------}}}
"-- quick fix toggle {{{
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
"---------------}}}

" file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

""""""""""""""""""" OLD STUFF """""""""""""""""""""""""
" filetypes
filetype plugin on
filetype indent on

set autoread



"fast saving
nnoremap <leader>w :w!<cr>

nnoremap <silent> <leader>s :set spell!<CR>

set spelllang=en_us

set noswapfile

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
"colorscheme desert
colorscheme darkblue

" Pair matching
inoremap {<CR> {<CR>}<Esc>0
inoremap {{  {}<Left>

inoremap (<CR> (<CR>)<Esc>0
inoremap ((  ()<Left>

inoremap [<CR> [<CR>]<Esc>0
inoremap [[  []<Left>

inoremap ''  ''<Left>

" Map Esc key

ab teh the

map <F3> ggVGg?


let @p = ':put =map(range(1,10), ''printf(''''%02d'''', v:val)'')'
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

set nostartofline
set ve=block

" max out height/ width or equalize
"ctrl + w _
"ctrl + w |
"ctrl + w =

" ~/.vimrc ends here
