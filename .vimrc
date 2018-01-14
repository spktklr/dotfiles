" {{{ Init

set nocompatible			" be iMproved, required
set encoding=utf-8
filetype on 					" without this vim emits a zero exit status, later, because of :ft off
filetype off

" }}}
"Plugins {{{

" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug '2072/PHP-Indenting-for-VIm', "Up-to-date PHP syntax file
Plug 'Lokaltog/vim-easymotion' "Easily move around
Plug 'SirVer/ultisnips' "Use snippets
Plug 'StanAngeloff/php.vim', "Up-to-date PHP syntax file
Plug 'Valloric/MatchTagAlways' "A Vim plugin that always highlights the enclosing html/xml tags
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "A code-completion engine for Vim
Plug 'airblade/vim-gitgutter' "Git in the gutter
Plug 'airblade/vim-rooter' "Changes Vim working directory to project root
Plug 'alampros/vim-styled-jsx' "Vim syntax for [styled-jsx](https://github.com/zeit/styled-jsx)
Plug 'austintaylor/vim-commaobject' "Add comma as a Vim object
Plug 'beanworks/vim-phpfmt' "PHP (phpcbf) auto format plugin for vim
Plug 'cakebaker/scss-syntax.vim' "Vim syntax file for scss (Sassy CSS)
Plug 'captbaritone/better-indent-support-for-php-with-html', "Better PHP HTML indent
Plug 'chaoren/vim-wordmotion' "More useful word motions for Vim
Plug 'christoomey/vim-sort-motion' "Vim mapping for sorting a range of text
Plug 'christoomey/vim-tmux-navigator' "Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-runner' "Vim and tmux, sittin' in a tree...
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder
Plug 'dbakker/vim-projectroot' "Find out which project a file belongs to
Plug 'digitaltoad/vim-pug', "Vim Pug (formerly Jade) template engine syntax highlighting and indention
Plug 'docteurklein/php-getter-setter.vim' "generate php getters and setters from class properties
Plug 'dsawardekar/wordpress.vim', "Vim Plugin for WordPress Development
Plug 'editorconfig/editorconfig-vim' "EditorConfig plugin for Vim http://editorconfig.org
Plug 'elzr/vim-json', "A better JSON for Vim
Plug 'epilande/vim-es2015-snippets', "Vim es2015 snippets
Plug 'epilande/vim-react-snippets', "Vim react snippets
Plug 'ervandew/supertab' "Perform all your vim insert mode completions with Tab
Plug 'fatih/vim-nginx', "Vim Nginx
Plug 'fleischie/vim-styled-components', { 'branch': 'rewrite' } "Vim bundle for http://styled-components.com based javascript files.
Plug 'godlygeek/tabular' "Vim script for text filtering and alignment
Plug 'groenewege/vim-less' "Vim syntax for LESS
Plug 'hail2u/vim-css3-syntax' "Add CSS3 syntax support to vim's built-in `syntax/css.vim`
Plug 'heavenshell/vim-jsdoc' "Generate JSDoc to your JavaScript code.
Plug 'jeetsukumaran/vim-buffergator' "More useful word motions for Vim
Plug 'jiangmiao/auto-pairs' "Vim plugin to insert or delete brackets, parens and quotes in pairs
Plug 'jistr/vim-nerdtree-tabs' "Handle NERDTree tab better
Plug 'jparise/vim-graphql', "A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
Plug 'junegunn/vim-easy-align' "A Vim alignment plugin
Plug 'kewah/vim-stylefmt' "Format your stylesheets using stylefmt inside Vim
Plug 'lisposter/vim-blackboard' "Color scheme
Plug 'majutsushi/tagbar' "Vim plugin that displays tags in a window, ordered by scope.
Plug 'mattn/emmet-vim' "Emmet for vim: http://emmet.io/
Plug 'mattn/gist-vim' "Vimscript for gist
Plug 'mileszs/ack.vim' "Vim plugin for the Perl module / CLI script 'ack'
Plug 'mustache/vim-mustache-handlebars' "mustache and handlebars mode for vim http://mustache.github.io
Plug 'mxw/vim-jsx', "React JSX syntax highlighting and indenting for vim.
Plug 'othree/html5.vim' "HTML5 omnicomplete and syntax
Plug 'pangloss/vim-javascript' "Vastly improved Javascript indentation and syntax support in Vim
Plug 'sbdchd/neoformat' "✨ A (Neo)vim plugin for formatting code.
Plug 'scrooloose/nerdcommenter' "Vim plugin for intensely orgasmic commenting.
Plug 'scrooloose/nerdtree' "A tree explorer plugin for vim
Plug 'shawncplus/phpcomplete.vim', "Improved PHP omnicompletion.
Plug 'spktklr/vim-flip-comparands' "Flip two comparands around a comparison operator in Vim
Plug 'sudar/vim-wordpress-snippets', "Collection of Vim Snipmate snippets for WordPress.
Plug 'terryma/vim-expand-region' "Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination
Plug 'terryma/vim-multiple-cursors' "True Sublime Text style multiple selections for Vim
Plug 'tobyS/pdv', "PHP Documentor for VIM - Generates PHP docblocks
Plug 'tobyS/vmustache' "Required for pdv plugin
Plug 'tommcdo/vim-fubitive' "Add Bitbucket URL support to fugitive.vim's :Gbrowse command
Plug 'tomtom/tlib_vim' "Some utility functions for VIM
Plug 'tpope/vim-abolish' "Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-fugitive' "A git wrapper so awesome, it should be illegal
Plug 'tpope/vim-markdown', "Vim Markdown runtime files
Plug 'tpope/vim-repeat' "repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' "Quoting/parenthesizing made simple.
Plug 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air
Plug 'vim-ruby/vim-ruby' "Vim/Ruby Configuration Files
Plug 'vim-scripts/open-browser.vim' "Open URI with your favorite browser from your favorite editor.
Plug 'w0rp/ale' "Asynchronous Lint Engine
Plug 'weierophinney/argumentrewrap' "Vim plugin to automatically rewrap argument lists to multiple lines
Plug 'wikitopian/hardmode' "Vim: Hard Mode

call plug#end()

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

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " do not comment new lines automatically

  " Automatically fmt styles on save
  autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :Stylefmt<CR>

  au BufRead,BufNewFile *.php set ft=php.wordpress "use wordpress snippets on php files

  "set undofile					" Contains undo information so you can undo previous actions even after you close and reopen a file.

  autocmd!
  autocmd BufWritePre * undojoin | Neoformat

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
  set background=dark
  colorscheme blackboard
else
  set background=dark
  colorscheme blackboard
endif

" Color scheme customizations
hi SpecialKey term=bold cterm=bold ctermbg=0
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

" }}}
" Misc {{{

set ttyfast          " faster redraw
set backspace=indent,eol,start
set hidden           " hides buffers instead of closing them
set history=1000     " remember more commands and search history
set undolevels=1000  " use many muchos levels of undo
set noswapfile
set linebreak
set scrolloff=5
set autochdir        " auto cd to current file folder
set shell=zsh\ -l

set conceallevel=1 "concealing

" }}}
" Spaces & Tabs {{{

set tabstop=4
set softtabstop=4

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
    " set encoding=utf-8
    " set guifont=Consolas:h14
    set macligatures
    set guifont=Fira\ Code:h16
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
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
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
" Mappings {{{

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

" Visual Block Mode
nnoremap <C-x>  <C-v>

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
inoremap Ä <C-R>=AutoPairsInsert("\}")<CR>
inoremap Ö <C-R>=AutoPairsInsert("\{")<CR>
inoremap ä <C-R>=AutoPairsInsert("\]")<CR>
inoremap ö <C-R>=AutoPairsInsert("\[")<CR>

nnoremap " @
nnoremap & ^
nnoremap ' \
nnoremap ( *
nnoremap ) (
" nnoremap * | " Causes mapping not found error
nnoremap + -
nnoremap - /
nnoremap / &
nnoremap = )
nnoremap ? _
nnoremap ^ }
nnoremap _ ?
nnoremap ` +
nnoremap § ~
nnoremap ¨ ]
nnoremap ´ =
nnoremap ½ `
nnoremap Ä }
nnoremap Ö {
nnoremap ä ]
nnoremap ö [
noremap ¤ $
noremap € $

vnoremap Ä }
vnoremap Ö {
vnoremap ä ]
vnoremap ö [

" }}}
" Leader mappings {{{

let mapleader=","
nnoremap <leader>1 :set number!<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ack
" Search the WP Codex with WordPress Vim
nnoremap <leader>co :Wcodexsearch<CR>
nnoremap <leader>dj :JsDoc<CR>
" type :e and pre-populate with dir of current file
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>el :!el % --fix<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>g :call RunGoFile()<CR>
nnoremap <leader>h :A<CR>
" Re-indents buffer.
nnoremap <silent><Leader>i :call Preserve("normal! gg=G")<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
" Removes all trailing whitespace in buffer.
nnoremap <silent><Leader>o :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap <leader>pp :!phpcbf % --standard=WordPress-Core<CR>
nnoremap <leader>r :call RunTestFile()<CR>
"nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR> "sort CSS
nnoremap <leader>s :mksession<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>t :call ToggleNumber()<CR>
nnoremap <leader>u :call IndentHtmlPhp()<CR>
vnoremap <leader>y "+y
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> "strip all trailing whitespace
nnoremap <leader>v V`] "reselect the text just pasted
nnoremap <leader>q :q<CR>
" Sort SCSS
"nnoremap <F7> :g#\({\n\)\@<=#.,/\.*[{}]\@=/-1 sort
vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vmap <Leader>y "+y
vmap <Leader>d "+d
" nmap <Leader>p "+p
nmap <Leader>P "+P
" vmap <Leader>p "+p
vmap <Leader>P "+P

" To open a new empty buffer
nnoremap <leader>T :enew<cr>

" Move to the next buffer
nnoremap <leader>l :bnext<CR>

" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nnoremap <leader>w :bp <BAR> bd #<CR>

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
" PHP {{{

let g:PHP_vintage_case_default_indent = 1

" }}}
" JSX {{{

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" }}}
" Tmux {{{

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"" }}}
" Backups {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=.,$TEMP
set writebackup

" }}}
" {{{ Plugin ALE
"
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['stylelint', 'eslint'],
\   'php': ['phpcbf', 'phpcs'],
\}
" let g:ale_fixers = {
" \   'javascript': ['prettier-eslint'],
" \}
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_php_phpcbf_standard = 'WordPress-Core'
let g:ale_php_phpcs_standard = 'WordPress-Core'
let g:ale_php_phpcbf_use_global = 1
let g:ale_php_phpcs_use_global = 1
let g:ale_sign_column_always = 1

" }}}
" Plugin Airline {{{

set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1 		" Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' 	" Show just the filename
" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" }}}
" Plugin Autopairs {{{

let g:AutoPairsShortcutFastWrap=''

" }}}
" Plugin CtrlP {{{

let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.next|vagrant|build|wp-includes|wp-admin|vendor|target)|(\.(swp|ico|svn|DS_Store|ctrlp))$'
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

let g:easy_align_delimiters['d'] = {
      \ 'pattern': '(@\w+|string|int|mixed|array|\$\w+|\d+.*|[A-Z].+\.)',
      \ 'left_margin': 0, 'right_margin': 0
      \ }

" }}}
" Plugin EditorConfig {{{

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" }}}
" {{{ Plugin Emmet-vim

let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

" }}}
" Plugin Gitgutter {{{

let g:gitgutter_max_signs = 50

" }}}
" Plugin javascript {{{

let g:javascript_plugin_jsdoc = 1

" }}}
" Plugin Mustache-Handlebars {{{

let g:mustache_abbreviations = 1

" }}}
" {{{ Plugin Neoformat

let g:neoformat_run_all_formatters = 1

" }}}
" Plugin NERDCommenter {{{

let NERDSpaceDelims=1

" }}}
" Plugin NERDTree {{{

let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.pyc$', 'venv', 'egg', 'egg-info/', 'tags', 'DS_Store']
let NERDTreeShowHidden=1
" Toggle nerdtree with F10
noremap <F10> :NERDTreeToggle<CR>
noremap <F11> :NERDTree<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

" }}}
" Plugin pdv {{{

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>dp :call pdv#DocumentWithSnip()<CR>

" }}}
" Plugin phpfmt {{{

let g:phpfmt_standard = '/Users/niko/wpcs/WordPress-Core/ruleset.xml'

" }}}
" {{{ Plugin vim-rooter

let g:rooter_patterns = ['Rakefile', '.git/']

" }}}
" Plugin Tabularize {{{

nnoremap <leader>pt :Tabularize/@\w\+\s\+\zs\S\+\\|\%(@\w\+.*\)\@<=\u.*/<CR>

" }}}
" Plugin Tagbar {{{

nnoremap <F8> :TagbarToggle<CR>

" }}}
" Plugin UltiSnips {{{

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" correct snippets dir
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" }}}
" Plugin YouCompleteMe {{{

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

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

" Toggle relative line numbers.
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
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

function! IndentHtmlPhp()
  " Save the last search
  let last_search=@/
  " Save the current cursor position
  let save_cursor = getpos(".")
  " Save the window position
  normal H
  let save_window = getpos(".")
  call setpos('.', save_cursor)

  execute "normal! :set ft=html\<CR>"
  execute "normal! gg=G"
  execute "normal! :set ft=php.wordpress\<CR>"
  execute "normal! gg=G"

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
