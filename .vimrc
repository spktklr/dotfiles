set nocompatible				" be iMproved, required
filetype on 					" without this vim emits a zero exit status, later, because of :ft off
filetype off

" Plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Rainbow-Parenthesis'
Plugin 'Solarized'
Plugin 'Valloric/MatchTagAlways'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'csscomb/vim-csscomb'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wikitopian/hardmode'

call vundle#end()

filetype plugin indent on 		" ensure ftdetect et al work by including this after the Vundle stuff

" }}}
" Colors {{{

syntax enable           		" enable syntax processing
colorscheme Solarized

" }}}
" Misc {{{

set ttyfast            			" faster redraw
set backspace=indent,eol,start
set hidden						" hides buffers instead of closing them
set history=1000        		" remember more commands and search history
set undolevels=1000     		" use many muchos levels of undo
set noswapfile
set linebreak
"set undofile					" Contains undo information so you can undo previous actions even after you close and reopen a file.

" }}}
" Spaces & Tabs {{{

set tabstop=4           		" 4 space tab
set softtabstop=4       		" 4 space tab
set expandtab           		" use spaces for tabs
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

" }}}
" UI Layout {{{

set number              		" show line numbers
set showcmd             		" show command in bottom bar
set ruler						" show the cursor position all the time
set nocursorline        		" highlight current line
set wildmenu
"set lazyredraw
set showmatch           		" higlight matching parenthesis
set list						" show invisible chars
set listchars=tab:?\ ,eol:� 	" map invisible chars

set mouse=a						" enable mouse (for scrolling)
if !has("gui_running") 			" let mouse wheel scroll file contents
    set term=xterm
    set mouse=a
    set nocompatible
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>
endif

if has('gui_running')
	set guioptions-=m  		"remove menu bar
	set guioptions-=T  		"remove toolbar
	set guioptions-=r  		"remove right-hand scroll bar
	set guioptions-=L  		"remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  if has('gui_win32')
    "set encoding=utf-8
    set guifont=Powerline_Consolas:h11
  else
    set guifont=Courier\ Sans\ Mono\ 10
  endif
endif

set background=dark
if has('gui_running')
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16
endif

if !has("gui_running")
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
	syntax on
endif

" }}}
" Searching {{{

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" }}}
" Folding {{{

set foldmethod=marker
set foldlevel=0
set modelines=1
nnoremap <space> za

" }}}
" Line Shortcuts {{{

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <Tab> >>
nnoremap <s-Tab> <<
vnoremap <tab> >

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update!<CR><Esc>
vnoremap <C-S> <C-C>:update!<CR><Esc>
inoremap <C-S> <C-O>:update!<CR><Esc>

" Copy & Paste from clipboard
vnoremap <C-c> "*y
nnoremap <C-v> "*p

" Undo
noremap <C-z> :u<cr>

" Insert rows without insert mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" Easy navigation between splits. Instead of ctrl-w + j. Just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Edit scandi layout
nnoremap � ~
nnoremap � `
nnoremap " @
noremap � $
nnoremap & ^
nnoremap / &
nnoremap ( *
nnoremap ) (
nnoremap = )
nnoremap + -
nnoremap ? _
nnoremap � =
nnoremap ` +
nnoremap � :
nnoremap � ;
nnoremap � '
nnoremap � "
nnoremap ' \
"nnoremap * | 	" Causes no mapping found error
nnoremap � [
nnoremap � {
nnoremap � ]
nnoremap ^ }
nnoremap ; <
nnoremap : >
nnoremap - /
nnoremap _ ?
inoremap � :
inoremap � {
inoremap � ]
inoremap � }
vnoremap � :

" }}}
" Leader Shortcuts {{{

let mapleader=","
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>u :GundoToggle<CR>
vnoremap <leader>u :sort u<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>t :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make!
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> "strip all trailing whitespace
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR> "sort CSS
nnoremap <leader>v V`] "reselect the text just pasted
nnoremap <leader>q :q<CR>
" Re-indents buffer.
nnoremap <silent> <Leader>i :call Preserve("normal! gg=G")<CR>
" Removes all trailing whitespace in buffer.
nnoremap <silent> <Leader>o :call Preserve("%s/\\s\\+$//e")<CR>

" }}}
" Airline {{{

set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1 		" Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' 	" Show just the filename
"let g:airline_powerline_fonts = 1

" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif

"let g:airline_left_sep = "\u2b80" "use double quotes here
"let g:airline_left_alt_sep = "\u2b81"
"let g:airline_right_sep = "\u2b82"
"let g:airline_right_alt_sep = "\u2b83"
"let g:airline_symbols.branch = "\u2b60"
"let g:airline_symbols.readonly = "\u2b64"
"let g:airline_symbols.linenr = "\u2b61"

" powerline symbols
"let g:airline_left_sep = '?'
"let g:airline_left_alt_sep = '?'
"let g:airline_right_sep = '?'
"let g:airline_right_alt_sep = '?'
"let g:airline_symbols.branch = '?'
"let g:airline_symbols.readonly = '?'
"let g:airline_symbols.linenr = '?'

"let g:airline_left_sep = '�'
"let g:airline_left_sep = '?'
"let g:airline_right_sep = '�'
"let g:airline_right_sep = '?'
"let g:airline_symbols.crypt = '??'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '�'
"let g:airline_symbols.branch = '?'
"let g:airline_symbols.paste = '?'
"let g:airline_symbols.paste = '�'
"let g:airline_symbols.paste = '?'
"let g:airline_symbols.whitespace = '?'

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>T :enew<cr>

" Move to the next buffer
nnoremap <leader>l :bnext<CR>

" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>w :bp <BAR> bd #<CR>

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

" }}}
" CtrlP {{{

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|*vendor\|git|\.(o|swp|pyc|egg)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor|DS_Store|target)|(\.(swp|ico|git|svn))$'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" }}}
" NERDTree {{{

let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
let NERDTreeShowHidden=1
" Toggle nerdtree with F10
noremap <F10> :NERDTreeToggle<CR>
noremap <F11> :NERDTree<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

" }}}
" Mustache-Handlebars {{{

let g:mustache_abbreviations = 1

" }}}
" Syntastic {{{

let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']

" }}}
" Launch Config {{{

"runtime! debian.vim
"call pathogen#infect()

" }}}
" CSSComb {{{

" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css,scss,less noremap <buffer> <leader>bc :CSScomb<CR>
noremap <leader>bc :CSScomb<CR>
" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb<CR>

" }}}
" Easy-Align {{{

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
"" Tmux {{{

"if exists('$TMUX') " allows cursor change in tmux mode
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

"" }}}
" MacVim {{{

set guioptions-=r
set guioptions-=L

" }}}
" AutoGroups {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" }}}
" Backups {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=.,$TEMP
set writebackup

" }}}
" Custom Functions {{{

" Toggle mouse plugin for quickly toggling mouse between Vim and terminal
" Maintainer:   Vincent Driessen <vincent@datafox.nl>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          http://github.com/nvie/vim-togglemouse
"
" Only do this when not done yet for this buffer
if exists("b:loaded_toggle_mouse_plugin")
    finish
endif
let b:loaded_toggle_mouse_plugin = 1

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F12> by default, unless the user
" remapped it already (or a mapping exists already for <F12>)
if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    if !hasmapto('<SID>ToggleMouse()')
        noremap <F12> :call <SID>ToggleMouse()<CR>
        inoremap <F12> <Esc>:call <SID>ToggleMouse()<CR>a
    endif
endif

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

function! RunTestFile()
    if(&ft=='python')
        exec ":!" . ". venv/bin/activate; nosetests " .bufname('%') . " --stop"
    endif
endfunction

function! RunGoFile()
    if(&ft=='go')
        exec ":new|0read ! go run " . bufname('%')
    endif
endfunction

function! RunTestsInFile()
    if(&ft=='php')
        :execute "!" . "/Users/dblack/pear/bin/phpunit -d memory_limit=512M -c /usr/local/twilio/src/php/tests/config.xml --bootstrap /usr/local/twilio/src/php/tests/bootstrap.php " . bufname('%') . ' \| grep -v Configuration \| egrep -v "^$" '
    elseif(&ft=='go')
        exec ":!gp test"
    elseif(&ft=='python')
        exec ":read !" . ". venv/bin/activate; nosetests " . bufname('%') . " --nocapture"
    endif
endfunction

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" indents file
function! IndentFile()
    let l:winview = winsaveview()
    exec "normal gg=G"
    call winrestview(l:winview)
endfunction

" A wrapper function to restore the cursor position, window position,
" and last search after running a command.
function! Preserve(command)
  " Save the last search
  let last_search=@/
  " Save the current cursor position
  let save_cursor = getpos(".")
  " Save the window position
  normal H
  let save_window = getpos(".")
  call setpos('.', save_cursor)

  " Do the business:
  execute a:command

  " Restore the last_search
  let @/=last_search
  " Restore the window position
  call setpos('.', save_window)
  normal zt
  " Restore the cursor position
  call setpos('.', save_cursor)
endfunction

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "np all trailing whitespaceormal! ".a:dir.c."v".a:motion.c
endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0

