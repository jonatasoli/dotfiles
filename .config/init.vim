
"*****************************************************************************
"" Options
"*****************************************************************************
"" Map leader to space  
let mapleader=' '

syntax on
set ruler "Posição no curso na barra
set number
set relativenumber

" Enable folding
set foldmethod=indent
set foldlevel=20

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start
set smartindent

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab

"" Enable hidden buffers
set hidden "Vai deixar trocar de arquivo aberto sem ter salvo ele (default é bloquear)

"" Searching
set hlsearch "Busca com highlighting
set incsearch "Mostra as correspondencias a medida que a pesquisa prossegue
set ignorecase "Ignora case sensitive
set smartcase "Ele é usado caso algum caps seja usado

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"Clipboard
set clipboard=unnamed,unnamedplus

" History
if &history < 1000
  set history=1000
endif

" Coc
set nobackup
set nowritebackup

if exists('&inccommand')
  set inccommand=split " Mostra um preview dos comandos
endif

"Wrap
set wrap
set wm=2
set textwidth=180

"Width fileformats
" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=180
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END


"Move line
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Auto reload file when changed
set autoread

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"
call plug#begin(expand('~/.config/nvim/plugged'))

"NERDTree
Plug 'scrooloose/nerdtree' "Permite ter uma arvore de diretórios
Plug 'jistr/vim-nerdtree-tabs' "Permite manter tabs / remover todas as tabs / abrir todas as tabs 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Mostra os icones das linguagens no NERDTRee
Plug 'ryanoasis/vim-devicons' "Icones pro nerdtree

"Comentários
Plug 'tpope/vim-commentary' "Permite fazer comentários com gc

"Coc e extensões
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'dart-lang/dart-vim-plugin'

"Busca
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'ctrlpvim/ctrlp.vim' "busca fzf
Plug 'wincent/ferret' "Buscar e substituir em todos os arquivos

"Utilitários
Plug 'mhinz/vim-startify' "Mostra na tela inicial do vim os ultimos arquivos abertos
Plug 'Yggdroot/indentLine' "Coloca um tracejado pra guiar a hierarquia das funções

" Tmux
Plug 'christoomey/vim-tmux-navigator' "Pra navegar no tmux

" Parenteses / chaves / Colchetes
Plug 'Raimondi/delimitMate' "Auto fechamento de aspas, parenteses chaves e colchetes
Plug 'frazrepo/vim-rainbow' "Muda o destaque de tags e parenteses e etcs
Plug 'tpope/vim-surround' "troca simbolos de maneira mais facil

" Git
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse que é usado no fugitive
Plug 'tpope/vim-fugitive' "Permite fazer os comandos do git usando o :Git 
Plug 'airblade/vim-gitgutter' "Simbolos do git 

" Airline
Plug 'vim-airline/vim-airline' "Coloca barra de status
Plug 'vim-airline/vim-airline-themes' "Temas na sua barra de status

" Ctags
Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'

"" Color - Temas
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

"*****************************************************************************
"*****************************************************************************

packadd! dracula_pro

syntax enable

let g:dracula_colorterm = 0

colorscheme dracula_pro
hi Normal guibg=NONE ctermbg=NONE

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>


" NERDTree
nnoremap <leader>n :NERDTree<CR>
let g:NERDTreeShowHidden = 1

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '^node_modules$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>

"Ctags
set tags=tags
" Tagbar
nmap <silent> <leader>4 :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"*****************************************************************************
"" Coc Settings
"*****************************************************************************

let g:coc_global_extensions = [ 
        \ 'coc-json',
        \ 'coc-python',
        \ 'coc-snippets',
        \ 'coc-vimlsp',
        \ 'coc-css',
        \ 'coc-cssmodules',
        \ 'coc-emmet',
        \ 'coc-eslint',
        \ 'coc-floaterm',
        \ 'coc-flutter',
        \ 'coc-go',
        \ 'coc-highlight',
        \ 'coc-html',
        \ 'coc-rls',
        \ 'coc-rust-analyzer',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-yaml',
        \ 'coc-yank',
        \ 'coc-pyright',
        \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
  else
    call CocAction('doHover')
  endif
endfunction


" Float Term
let g:floaterm_keymap_toggle = '<leader>to'
let g:floaterm_keymap_next   = '<leader>tn'
let g:floaterm_keymap_prev   = '<leader>tp'
let g:floaterm_keymap_new    = '<leader>tt'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
hi Floaterm guibg=black

nnoremap <leader>r :FloatermNew ranger<CR>
nnoremap <leader>i :FloatermNew ipython<CR>

"Flutter
nnoremap <leader>fd :CocList FlutterDevices
nnoremap <leader>fe :CocList FlutterEmulators
nnoremap <leader>fr :CocList --input=flutter commands flutter.run

" Go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" =====================================
" vista.vim
" =====================================
"
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"*****************************************************************************
"" Search Config
"*****************************************************************************
"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_preview_window = 'right:60%'

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
endif
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nnoremap <leader>f :Find<Cr>


"*****************************************************************************
"" IndentLine Config
"*****************************************************************************
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


"*****************************************************************************
"" it Fugitive
"*****************************************************************************
"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
nnoremap <leader>gsc :GCheckout<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>glo :Git log<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
nnoremap <leader>gm :Git mergetool<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap  <leader>gu :diffget //2<CR>
nnoremap <leader>gg :G<CR>


"*****************************************************************************
"" Airline
"*****************************************************************************
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

set statusline+=%{fugitive#statusline()}

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'molokai'
let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#poetv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END