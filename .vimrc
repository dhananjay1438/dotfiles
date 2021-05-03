set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'crusoexia/vim-monokai'
Plugin 'enricobacis/vim-airline-clock'
"Used for showing snippets with YouCompleteMe auto complete
Plugin 'SirVer/ultisnips'
"Sample snippets for ultisnips extension
Plugin 'honza/vim-snippets'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Auto Format
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

"Auto complete
Plugin 'valloric/youcompleteme'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

"Lets you see undo history in a window(tab)
Plugin 'mbbill/undotree'

"Shows function and variables from a class/file
Plugin 'preservim/tagbar'
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
set background=dark
set number

set timeoutlen=1000
set ttimeoutlen=50

let g:NERDTreeMinimalUI = 1
let g:rainbow_active = 1
set timeout timeoutlen=1500
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_theme = 'minimalist'
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" here section c means name of the file
"
"let g:airline_section_c = ''
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
colorscheme monokai

"#######################Shortucts################
"Changes the width of the window by 10pixels
:nmap <leader>. :vertical res +10<Enter>
:nmap <leader>, :vertical res -10<Enter>

"Ycm shortcuts
:nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
:nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
:nnoremap <leader>gd :YcmCompleter GetDoc<CR>
:nnoremap <leader>gs :YcmCompleter GoToSymbol 
:nnoremap <leader>rm :YcmCompleter RefactorRename 

" For refactoring, specifically for chaning names

"fzf shortcuts
:nnoremap <C-t> :Files<CR>

"Undo tree shortcut
nnoremap <F5> :UndotreeToggle<CR>
"Making perisistant storage for undotree
nnoremap <F8> :TagbarToggle<CR>

nnoremap <C-n> :NERDTreeToggle<CR>
"#####################Shortcuts END####################

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let undodir=target_path
    set undofile
endif

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
