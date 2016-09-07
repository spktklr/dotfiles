set nocompatible				" be iMproved, required
set encoding=utf-8
filetype on 					" without this vim emits a zero exit status, later, because of :ft off
filetype off

"Plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Shutnik/jshint2.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Solarized' "color scheme
Plugin 'StanAngeloff/php.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'austintaylor/vim-commaobject'
Plugin 'beanworks/vim-phpfmt'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chaoren/vim-wordmotion'
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dbakker/vim-projectroot'
Plugin 'docteurklein/php-getter-setter.vim'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'greg-js/vim-react-es6-snippets'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'inkpot' "color scheme
Plugin 'iovar/vim-csscomb'
Plugin 'isRuslan/vim-es6'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'justinj/vim-react-snippets'
Plugin 'lisposter/vim-blackboard' "color scheme
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'mattn/gist-vim'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sudar/vim-wordpress-snippets'
Plugin 'terryma/vim-expand-region'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tristen/vim-sparkup'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/open-browser.vim'
Plugin 'weierophinney/argumentrewrap'
Plugin 'wikitopian/hardmode'

call vundle#end()

filetype plugin indent on " ensure ftdetect et al work by including this after the Vundle stuff

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
" Colors {{{

syntax enable           		" enable syntax processing

if !has("gui_running")
    set term=xterm-256color
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    set t_Co=256
    syntax on
    colorscheme blackboard
else
    set background=dark
    colorscheme blackboard
endif

" Color scheme customizations
:hi SpecialKey term=bold cterm=bold ctermbg=0

" }}}
" Misc {{{

set ttyfast            			" faster redraw
set backspace=indent,eol,start
set hidden						" hides buffers instead of closing them
set history=1000        		" remember more commands and search history
set undolevels=1000     		" use many muchos levels of undo
set noswapfile
set linebreak
set scrolloff=5
set autochdir                   " auto cd to current file folder

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " do not comment new lines automatically

au BufRead,BufNewFile *.php set ft=php.wordpress "use wordpress snippets on php files

"set undofile					" Contains undo information so you can undo previous actions even after you close and reopen a file.

" }}}
" Spaces & Tabs {{{

set tabstop=4           		" 4 space tab
set softtabstop=4       		" 4 space tab
"set expandtab           		" use spaces for tabs
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

"au FileType php :set expandtab!

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
"set listchars=tab:?\ ,eol:¬ 	" map invisible chars
set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_

set mouse=a						" enable mouse (for scrolling)
if !has("gui_running") 			" let mouse wheel scroll file contents
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
        "set guifont=Powerline_Consolas:h11
        set guifont=hack:h10
    else
        set encoding=utf-8
        set guifont=Consolas:h14
    endif
endif

" cursor for gvim
highlight Cursor guifg=black guibg=green
highlight iCursor guifg=green guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" }}}
" Searching {{{

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap - -
vnoremap -- y/<C-R>"<CR>"

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
nnoremap <C-v> :set paste<CR>"*p :set nopaste<CR>
inoremap <C-v> <Esc>:set paste<CR>"*p:set nopaste<CR>i

" Undo
noremap <C-z> :u<cr>

" Insert rows without insert mode
nmap <C-Enter> O<Esc>j
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

 "Edit scandi layout
nnoremap § ~
nnoremap ½ `
nnoremap " @
noremap ¤ $
noremap € $
nnoremap & ^
nnoremap / &
nnoremap ( *
nnoremap ) (
nnoremap = )
nnoremap + -
nnoremap ? _
nnoremap ´ =
nnoremap ` +
nnoremap ö :
nnoremap Ö ;
nnoremap ä '
nnoremap Ä "
nnoremap ' \
"nnoremap * | "Causes no mapping found error
nnoremap å [
nnoremap Å {
nnoremap ¨ ]
nnoremap ^ }
nnoremap ; <
nnoremap : >
nnoremap - /
nnoremap _ ?
inoremap ö :
inoremap Ö {
inoremap ä ]
inoremap Ä }
vnoremap ö :

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
nnoremap <leader>a :Ack
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> "strip all trailing whitespace
"nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR> "sort CSS
nnoremap <leader>v V`] "reselect the text just pasted
nnoremap <leader>q :q<CR>
" Re-indents buffer.
nnoremap <silent> <Leader>i :call Preserve("normal! gg=G")<CR>
" Removes all trailing whitespace in buffer.
nnoremap <silent> <Leader>o :call Preserve("%s/\\s\\+$//e")<CR>
" Sort SCSS
"nnoremap <F7> :g#\({\n\)\@<=#.,/\.*[{}]\@=/-1 sort
" Search the WP Codex with WordPress Vim
nnoremap <leader>co :Wcodexsearch<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" type :e and pre-populate with dir of current file
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" }}}
" Ack {{{

let g:ag_working_path_mode="r"
" Use instead of Grep
if executable('ag')
    " Note we extract the column as well as the file and line number
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

" }}}
" CSSComb {{{

" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css,scss,less noremap <buffer> <leader>bc :CSScomb<CR>
noremap <leader>bc :CSScomb<CR>
" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb<CR>

" }}}
" JSHint & JSX {{{

let jshint2_read = 0
let jshint2_save = 0
let jshint2_confirm = 0
let jshint_esnext = 1
nnoremap <silent><F2> :JSHint<CR>
inoremap <silent><F2> <C-O>:JSHint<CR>
vnoremap <silent><F2> :JSHint<CR>

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" }}}
" Tmux {{{

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

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
" Backups {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=.,$TEMP
set writebackup

" }}}
" Plugin Airline {{{

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

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '?'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '?'
"let g:airline_symbols.crypt = '??'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '?'
"let g:airline_symbols.paste = '?'
"let g:airline_symbols.paste = 'Þ'
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
" Plugin Camelcasemotion {{{

"call camelcasemotion#CreateMotionMappings('')
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"map <silent> ge <Plug>CamelCaseMotion_ge
"sunmap w
"sunmap b
"sunmap e
"sunmap ge

" }}}
" Plugin CtrlP {{{

let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'r'
"let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|*vendor\|git|\.(o|swp|pyc|egg)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vagrant|wp-includes|wp-admin|vendor|target)|(\.(swp|ico|svn|DS_Store|ctrlp))$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" }}}
" Plugin Easy-Align {{{

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif

"\ 'pattern': '@\w+\K(  )|string\K(  )|int\K(  )|mixed\K(  )|array\K(  )|\$\w+\K(  )',
let g:easy_align_delimiters['d'] = {
\ 'pattern': '(@\w+|string|int|mixed|array|\$\w+|\d+.*|[A-Z].+\.)',
\ 'left_margin': 0, 'right_margin': 0
\ }

" }}}
" Plugin Gitgutter {{{

let g:gitgutter_max_signs = 5

" }}}
" Plugin Mustache-Handlebars {{{

let g:mustache_abbreviations = 1

" }}}
" Plugin NERDTree {{{

let g:NERDTreeWinSize = 40 
let NERDTreeIgnore = ['\.pyc$', 'venv', 'egg', 'egg-info/', 'dist']
let NERDTreeShowHidden=1
" Toggle nerdtree with F10
noremap <F10> :NERDTreeToggle<CR>
noremap <F11> :NERDTree<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

" }}}
" Plugin pdv {{{

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>

" }}}
" Plugin php.vim {{{

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" }}}
" Plugin phpfmt {{{

let g:phpfmt_standard = 'WordPress'

" }}}
" Plugin Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = [ 'phpcs', ]
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_yml_checkers = ['yaml_lint']

let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']

let g:syntastic_wordpress_checkers = ['phpcs']
let g:syntastic_wordpress_phpcs_standard = "WordPress" "Default standard
let g:syntastic_wordpress_phpcs_args="--report=csv --standard=WordPress"

let g:syntastic_filetype_map = { "php.wordpress": "wordpress" }

let g:syntastic_aggregate_errors = 1

" }}}
" Plugin Tabularize {{{

" Notice that the \ before the | needs escaping
nnoremap <leader>p :Tabularize/@\w\+\s\+\zs\S\+\\|\%(@\w\+.*\)\@<=\u.*/<CR>

" }}}
" Plugin Tagbar {{{

nnoremap <F8> :TagbarToggle<CR>

" }}}
" Plugin YouCompleteMe {{{

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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

