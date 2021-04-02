"-------------------------------
"----------- Plugins -----------
"-------------------------------
call plug#begin('~/.vim/plugged')
" Airline for the status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'NLKNguyen/papercolor-theme'

Plug 'vim-python/python-syntax'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/vibrantink'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Completion with coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better spell check
Plug 'kamykn/spelunker.vim'

" Find replace
Plug 'brooth/far.vim'

" Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()


"--------------------------------
"------- General Settings -------
"--------------------------------
" Disable vi compatibility
set nocompatible

" Get rid of escape delay
" Turn on mouse support
set mouse=a

" Set spaces instead of tab
set expandtab

"Smart tab is primarily used in backspace at beginning of lines with tabs
set smarttab

" Set tab width
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Indentation
set ai " autoindent
set si " smartindent

" Ignore case when searching
set ignorecase
" But at the same time, try to match on cases as well
" for example, /the matches (the, The), but /The matches (The)
set smartcase

" Incremental search (search as you type)
set incsearch

" Backup files are just clutter
set nobackup
set nowb
set noswapfile

" Kinda cool, persistent undo history
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Increase update frequency
set updatetime=300

" Set the clipboard to the system clipboard
set clipboard=unnamedplus

" Use d to delete instead of cut (cut with x)
nnoremap d "_d
vnoremap d "_d


"-------------------------------
"-------- File Settings --------
"-------------------------------
" Set file encoding
set encoding=utf8

" Set file format order
set ffs=unix,mac,dos

" File type detection
filetype plugin on

" File type based indents
filetype indent on

" Reload a file when externally changed
set autoread
au FocusGained,BufEnter * checktime

" Let buffers exist in the background
set hidden


"-------------------------------
"----------- Visual ------------
"-------------------------------
" Turn on syntax highlighting
syntax enable

" Set colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme PaperColor

" Turn on line numbers
set number

" Bold the line I am currently on
set cursorline

" Add side padding column
set foldcolumn=1

" Increase size of command area bar
set cmdheight=2

" Enable wild menu (menu box)
set wildmenu

" Show the mode
set showmode

" Show executed commands
set showcmd

" Always show status line
set laststatus=2

" Always show tab bar
set showtabline=2

" Buffer above/below cursor when moving
set scrolloff=10

" Show matching brackets
set showmatch

" How long to flash brackets
set mat=2

" Show the sign column (persistent sidebar)
set signcolumn=yes

" Disable fold (markdown)
set nofoldenable


"------- Keybinds ------- 
" Set leader key to ,
let mapleader=","
" Set ,sv to reload vimrc (nvim init.vim)
map <silent> <leader>sv :source ~/.config/nvim/init.vim<CR>
" Set ,ch to deactivate highlighting
nnoremap <silent> <leader>ch :noh<cr>
" Set ,cl to toggle the cursorline
nnoremap <silent> <leader>cl :set cursorline!<CR>
" Some systems have a weird backspace things, this fixes it
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"Set ,tn and ,tp to be tabnext and tabprevious
map <silent> <leader>tn :tabnext<CR>
map <silent> <leader>tp :tabprevious<CR>
" Et ,tc and ,tw to close an open tabls
map <silent> <leader>tc :tabclose<CR>
map <silent> <leader>tw :tabnew<CR>
" Tab edit opens a new tab in the current path
map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>
" Toggle last tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" FZF
nnoremap <silent> <C-f> :FZF<CR>

"-------------------------------
"---------- Spell Check --------
"-------------------------------
" Disable default spell checker
set nospell

" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable
let g:enable_spelunker_vim = 1

" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
let g:enable_spelunker_vim_on_readonly = 0

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 4

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 0

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE


"-------------------------------
"------------ Goyo -------------
"-------------------------------
let g:goyo_width='85%'
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction
function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"-------------------------------
"---------- coc.nvim -----------
"-------------------------------
" Use Tab for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" and use space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" finally, use enter to select completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
nnoremap <silent> D :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Disable vim-go :GoDef short cut (gd). This is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" Go syntax highlighting
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
highlight Pmenu ctermbg=gray guibg=gray 

" goimports-reviser
autocmd BufWritePost *.go silent execute "!goimports-reviser -local lab.co.clearstreet.io/clearstreet/fleet -file-path <afile>" | edit

" CoC explore shortcut
nmap <space>e :CocCommand explorer<CR>

let g:python_highlight_all = 1

let g:coc_global_extensions = ['coc-tsserver']
