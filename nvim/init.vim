
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
set foldlevel=99

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

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

if exists('&inccommand')
  set inccommand=split " Mostra um preview dos comandos
endif

"Wrap
set wrap
set wm=2
set textwidth=79

"Move line
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"
call plug#begin(expand('~/.config/nvim/plugged'))

"NERDTree
" Plug 'scrooloose/nerdtree' "Permite ter uma arvore de diretórios
" Plug 'jistr/vim-nerdtree-tabs' "Permite manter tabs / remover todas as tabs / abrir todas as tabs 
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Mostra os icones das linguagens no NERDTRee
Plug 'ryanoasis/vim-devicons' "Icones pro nerdtree

"Comentários
Plug 'tpope/vim-commentary' "Permite fazer comentários com gc

"Coc e estensões
" Plugins -> coc-json - coc-python - coc-snippets - coc-vimlsp \
"   coc-bookmark coc-css coc-cssmodules coc-emmet coc-eslint coc-explorer
"   coc-floatterm coc-flutter coc-go coc-highlight coc-html coc-rls
"   coc-rust-analyser coc-markdown coc-tsserver coc-vetur coc-yaml coc-yanc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'dart-lang/dart-vim-plugin'

"Busca
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" Git
Plug 'tpope/vim-fugitive' "Permite fazer os comandos do git usando o :Git 

" Airline
Plug 'vim-airline/vim-airline' "Coloca barra de status
Plug 'vim-airline/vim-airline-themes' "Temas na sua barra de status

"" Color - Temas
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

"*****************************************************************************
"*****************************************************************************

silent! colorscheme dracula
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
" nnoremap <leader>n :NERDTree<CR>
" let g:NERDTreeShowHidden = 1


"*****************************************************************************
"" Coc Settings
"*****************************************************************************
"
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
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Coc Explorer
:nmap <leader>e :CocCommand explorer<CR>

" Float Term
nnoremap <leader>tt :CocCommand floaterm.new
nnoremap <leader>tn :CocCommand floaterm.next
nnoremap <leader>tp :CocCommand floaterm.prev
nnoremap <leader>to :CocCommand floaterm.toggle
nnoremap <leader>r :FloatermNew ranger
nnoremap <leader>i :FloatermNew ipython
hi Floaterm guibg=black

"Flutter
nnoremap <leader>fd :CocList FlutterDevices
nnoremap <leader>fe :CocList FlutterEmulators
nnoremap <leader>fr :CocList --input=flutter commands flutter.run

" Go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Bookmark
nnoremap <leader>bn <Plug>(coc-bookmark-next)
nnoremap <leader>bp <Plug>(coc-bookmark-prev)
nnoremap <leader>bt <Plug>(coc-bookmark-toggle)
nnoremap <leader>ba <Plug>(coc-bookmark-annotate)


"*****************************************************************************
"" Search Config
"*****************************************************************************
"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_preview_window = 'right:60%'

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
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
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>glo :Git log<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
nnoremap <leader>gm :Git mergetool<CR>


"*****************************************************************************
"" Airline
"*****************************************************************************
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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
