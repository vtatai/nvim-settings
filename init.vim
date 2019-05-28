"---------------"
" PLUG CONFIG
"---------------"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'iCyMind/NeoSolarized'
Plug 'parsonsmatt/intero-neovim'
Plug 'jlanzarotta/bufexplorer'
" Plug 'thaerkh/vim-workspace'
Plug 'xolox/vim-misc' " required by vim-session
" Plug 'xolox/vim-session'
" Plug 'vtatai/vim-session'
Plug 'svanharmelen/vim-session' " Not using main fork due to nerdtree integration
" Plug 'Shougo/unite.vim' " required by vimfiler
" Plug 'Shougo/vimfiler.vim' " didnt work with vim-session
Plug 'scrooloose/nerdcommenter'
Plug 'neovimhaskell/haskell-vim'
Plug 'mileszs/ack.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'cloudhead/neovim-fuzzy'
Plug 'solarnz/thrift.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'weynhamz/vim-plugin-minibufexpl'

"Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'natebosch/vim-lsc'
Plug 'jalused/ZoomSplit'

" Initialize plugin system
call plug#end()
"------------------"
" END PLUG CONFIG
"------------------"

"---------------"
" EDITOR CONFIG "
"---------------"
let mapleader = ","                 " remap leader key to ,
let maplocalleader = ","            " remap leader key to ,
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set clipboard=unnamed               " enable copying to clipboard

" Resize horizontal split window
nmap <C-S-Up> <C-W>-<C-W>-
nmap <C-S-Down> <C-W>+<C-W>+
"nmap <C-D-k> <C-W>-<C-W>-
"nmap <C-D-j> <C-W>+<C-W>+
" Resize vertical split window
nmap <C-S-Left> <C-W>><C-W>>
nmap <C-S-Right> <C-W><<C-W><
"nmap <C-D-h> <C-W>><C-W>>
"nmap <C-D-l> <C-W><<C-W>

" Remap to quickly move across splits
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Remap to insert blank lines
" In macvim one could use <M-j> and <M-k> with macmeta
" https://github.com/qvacua/vimr/issues/314
nnoremap <silent>∆ :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent>˚ :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Remap to remove search highlight
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Exit insert mode in console by pressing esc
tnoremap <Esc> <C-\><C-n>

" Remap to use ; instead of : to enter command mode, saves using shift
nnoremap ; :

" Remap to do NERDTreeFind on leader F
nnoremap <silent><leader>f :NERDTreeFind<CR>
let g:NERDTreeChDirMode=2

nnoremap <silent><leader>p :CtrlP<CR>

" Map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" Map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" Auto save when leaving the buffer
"au BufLeave * silent! wall

" Saner haskell tab/space handling
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

set number                      "Line numbers in the left margin

" Remap aurora file as python
autocmd BufNewFile,BufRead *.aurora set syntax=python
autocmd BufNewFile,BufRead *.jsonnet set syntax=json

" Quickly insert pdb break point
map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

" Remap to edit Fitbit gui files (SVG) to XML
au BufNewFile,BufRead *.gui set filetype=xml

" Toggle zoom shortcut for maximizing / restoring splits
nmap <silent> <C-z> :ToggleZoom<CR>

"-------------------"
" END EDITOR CONFIG "
"-------------------"

"---------------------"
" RANDOM PLUGS CONFIG "
"---------------------"
" Solarized
set background=dark
colorscheme NeoSolarized
" haskell-vim config
let g:haskell_classic_highlighting = 1 "disable horrendous haskell vim highlight
" vim-session config
set sessionoptions-=help " do not save help buffers
set sessionoptions-=tabpages " store sessions per tab, not global
set sessionoptions-=buffers " do not save hidden buffers
let g:session_autosave='yes'
let g:session_autosave_periodic=1
let g:session_lock_enabled = 0 " disable session lock
let g:session_autoload = 'no' " do not load session on startup
let g:session_default_to_last = 0
let g:session_directory = '~/.local/share/nvim/sessions'

" Markdown preview plugin
let vim_markdown_preview_github=1
" Ack uses ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" fuzzy
nnoremap <C-p> :FuzzyOpen<CR>
" Mini-buf-expl
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"-------------------------"
" END RANDOM PLUGS CONFIG "
"-------------------------"

"---------------"
" INTERO CONFIG "
"---------------"
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
set updatetime=1000
"-------------------"
" END INTERO CONFIG "
"-------------------"

let g:lsc_server_commands = {'java': '/Users/vtatai/src/java-language-server/dist/mac/bin/launcher --quiet'}
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
