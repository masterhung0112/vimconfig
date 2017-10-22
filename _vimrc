"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

let $PYTHONHOME = "C:/Users/hung/AppData/Local/Programs/Python/Python35-32"
let $PATH = $PYTHONHOME . ';' . $PATH
let $PATH = $PATH . ';' . "C:/Users/hung/vimfiles/bundle/tagbar/ctags58"
let $PATH = $PATH . ';' . "C:/msys64/mingw64/bin"

"Better copy & paste 
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a " Press ALT and click

" Quicksave command
noremap <C-Z> :update<CR> 
vnoremap <C-Z> <C-C>:update<CR> 
inoremap <C-Z> <C-O>:update<CR> 

" QuickQuit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Bind CTRL+<movement> key to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Quick tab movement
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Switch buffer
map <Leader>b <esc>:bn<CR>

" Show whitespace
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Show line numbers and length
set number " show line numbers
"set tw=79  " Width of document
"set nowrap " Don't automatically wrap on load
"set fo-=t  " Don't wrap automatically text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

set nocompatible 

"colorscheme industry
"colorscheme murphy
"colorscheme ron
colorscheme desert

" Tab space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
"set expandtab
set autoindent
"set foldmethod=syntax
set autochdir
set showcmd
set ruler

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

" Ctrl+C Copy in Insert mode
inoremap <C-c> "+y
" Ctrl+V Paste in Insert mode
inoremap <C-v> <C-r>+

" Setup Pathogento manage your plugins
"mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on
filetype plugin indent on

" powerline option
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcut = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b 0import ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
		"silent inoremap <silent> <Tab> <C-n>
		"silent inoremap <silent> <S-Tab> <C-p>
		"silent inoremap <silent> <Down> <C-n>
		"silent inoremap <silent> <Up> <C-p>
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"If you want to show a method's signature in the popup menu
"Remarks: This option makes completion slow
"let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

" Python folding
set nofoldenable

" configure Vim so that it sets the working directory to the current file's directory
"autocmd BufEnter * lcd %:p:h

" Map NERDTREE
let NERDTreeChDirMode=2
map <F5> :NERDTreeToggle .<CR>
"map <F5> :vs.<CR>
" Open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree F:\Programming

" NERDTREE: open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree F:\Programming | endif

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
call pathogen#infect()
"let g:jedi#popup_select_first = 1
"let g:jedi#completions_enabled = 1

autocmd FileType html inoremap ;i <em></em><space><++><Esc>FeT>i
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

"CTag
nmap <F8> :TagbarToggle<CR>

" Drop Syntastic settings at the end of the config file "
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" Setup Syntastic to automatically load errors into the location list
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Syntastic check for errors when a file is loaded into Vim
let g:syntastic_check_on_open = 0
" Syntastic checks for errors whenever you save the file. To disable this
let g:syntastic_check_on_wq = 0
let g:syntastic_c_config_file = '_syntastic_c_config'
