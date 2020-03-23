" {{{ Init

set encoding=utf-8

" }}}
"Plugins

" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

" Plug 'airblade/vim-rooter' "Changes Vim working directory to project root
Plug 'Lokaltog/vim-easymotion' "Easily move around
Plug 'Rican7/php-doc-modded', "An updated, modified version of the original PDV (phpDocumentor for Vim).
Plug 'Valloric/MatchTagAlways' "A Vim plugin that always highlights the enclosing html/xml tags
Plug 'airblade/vim-gitgutter' "Git in the gutter
Plug 'austintaylor/vim-commaobject' "Add comma as a Vim object
Plug 'chaoren/vim-wordmotion' "More useful word motions for Vim
Plug 'christoomey/vim-sort-motion' "Vim mapping for sorting a range of text
Plug 'christoomey/vim-tmux-navigator' "Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-runner' "Vim and tmux, sittin' in a tree...
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder
Plug 'dsawardekar/wordpress.vim', "Vim Plugin for WordPress Development
Plug 'godlygeek/tabular' "Vim script for text filtering and alignment
Plug 'heavenshell/vim-jsdoc' "Generate JSDoc to your JavaScript code.
Plug 'junegunn/vim-easy-align' "A Vim alignment plugin
Plug 'lisposter/vim-blackboard' "Color scheme
Plug 'majutsushi/tagbar' "Vim plugin that displays tags in a window, ordered by scope.
Plug 'mattn/emmet-vim' "Emmet for vim: http://emmet.io/
Plug 'mattn/gist-vim' "Vimscript for gist
Plug 'mileszs/ack.vim' "Vim plugin for the Perl module / CLI script 'ack'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter' "Vim plugin for intensely orgasmic commenting.
Plug 'scrooloose/nerdtree' "A tree explorer plugin for vim
Plug 'sheerun/vim-polyglot' "A solid language pack for Vim.
Plug 'spktklr/vim-flip-comparands' "Flip two comparands around a comparison operator in Vim
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } "Vim bundle for http://styled-components.com based javascript files.
Plug 'terryma/vim-expand-region' "Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination
Plug 'tobyS/vmustache' "Required for pdv plugin
Plug 'tommcdo/vim-fubitive' "Add Bitbucket URL support to fugitive.vim's :Gbrowse command
Plug 'tomtom/tlib_vim' "Some utility functions for VIM
Plug 'tpope/vim-abolish' "Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-fugitive' "A git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat' "repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' "Quoting/parenthesizing made simple.
Plug 'tyru/open-browser.vim' "Open URI with your favorite browser from your most favorite editor
Plug 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air
Plug 'w0rp/ale' "Asynchronous Lint Engine

call plug#end()

filetype plugin indent on " ensure ftdetect et al work by including this after the Vundle stuff

"
" AutoGroups {{{

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  " autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " do not comment new lines automatically

  " Automatically fmt styles on save
  autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :Stylefmt<CR>

  autocmd BufRead,BufNewFile *.php set ft=php.wordpress "use wordpress snippets on php files

  "set undofile					" Contains undo information so you can undo previous actions even after you close and reopen a file.

augroup END

" }}}
" Colors {{{

syntax on

if !has("gui_running")
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
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
" Some servers have issues with backup files
set nobackup
set nowritebackup
" 
set cmdheight=2 " Better display for messages
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns
set noswapfile
set linebreak
set scrolloff=5
set autochdir        " auto cd to current file folder
set shell=zsh\ -l

set conceallevel=1 "concealing

" }}}
" Spaces & Tabs {{{

set tabstop=2
set softtabstop=2
set shiftwidth=2

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
" inoremap Ä <C-R>=AutoPairsInsert("\}")<CR>
" inoremap Ö <C-R>=AutoPairsInsert("\{")<CR>
" inoremap ä <C-R>=AutoPairsInsert("\]")<CR>
" inoremap ö <C-R>=AutoPairsInsert("\[")<CR>

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
\   'javascript': ['eslint', 'flow-language-server'],
\   'json': ['prettier', 'eslint'],
\   'jsx': ['stylelint', 'eslint'],
\   'scss': ['stylelint', 'eslint'],
\   'php': ['phpcbf', 'phpcs'],
\   'yaml': ['yamllint', 'prettier'],
\}
let g:ale_fixers = {
\   'php': ['phpcbf'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier', 'eslint'],
\   'scss': ['prettier'],
\   'sass': ['prettier'],
\   'yaml': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_php_phpcbf_standard = 'WordPress-Core-Syntax'
let g:ale_php_phpcs_standard = 'WordPress-Core-Syntax'
let g:ale_php_phpcbf_use_global = 1
let g:ale_php_phpcs_use_global = 1
let g:ale_sign_column_always = 1
let g:ale_cache_executable_check_failures = 1

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

" let g:AutoPairsShortcutFastWrap=''

" }}}
" {{{ Plugin Coc

set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" instead of having ~/.vim/coc-settings.json
let s:LSP_CONFIG = {
\  'flow': {
\    'command': exepath('flow'),
\    'args': ['lsp'],
\    'filetypes': ['javascript', 'javascriptreact'],
\    'initializationOptions': {},
\    'requireRootPattern': 1,
\    'settings': {},
\    'rootPatterns': ['.flowconfig']
\  }
\}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
  endif

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
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
let g:jsdoc_return_description = 1
let g:jsdoc_return_type = 1
let g:jsdoc_underscore_private = 1

" }}}
" Plugin Mustache-Handlebars {{{

let g:mustache_abbreviations = 1

" }}}
" Plugin NERDCommenter {{{

let NERDSpaceDelims=1

" }}}
" Plugin NERDTree {{{

let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.pyc$', 'venv', 'egg', 'egg-info/', 'DS_Store']
let NERDTreeShowHidden=1
" Toggle nerdtree with F10
noremap <F10> :NERDTreeToggle<CR>
noremap <F11> :NERDTree<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

" }}}
" Plugin php-doc-modded {{{

nnoremap <leader>dp :call PhpDocSingle()<CR>

" }}}
" Plugin Tabularize {{{

nnoremap <leader>pt :Tabularize/@\w\+\s\+\zs\S\+\\|\%(@\w\+.*\)\@<=\u.*/<CR>

" }}}
" Plugin Tagbar {{{

nnoremap <F8> :TagbarToggle<CR>

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
