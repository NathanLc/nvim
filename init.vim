" Basic settings {{{
language en_US.UTF-8
filetype off
" }}}

" Vundle configuration and plugins {{{
" add vundle repo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'neomake/neomake'
Plugin 'scrooloose/nerdcommenter'
Plugin 'joonty/vdebug' " :help Vdebug
Plugin 'tpope/vim-surround' " :help surround
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'ap/vim-css-color'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'thaerkh/vim-workspace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mbbill/undotree'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required

" Plugins options
let g:vdebug_options= {
    \    "port" : 9001,
    \    "server" : '',
    \    "timeout" : 30,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0,
    \    "ide_key" : '',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']

let g:ctrlp_max_files=8000
let g:ctrlp_custom_ignore='\v[\/](node_modules|dist|bower_components|vendor)|(\.(swp|git|svn))$'

let g:NERDSpaceDelims = 1

let g:workspace_autosave_untrailspaces = 0

let g:undotree_WindowLayout = 2
" }}}

" netrw settings
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber number nobuflisted nowrap readonly'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" Terminal emulator setitngs
let g:terminal_scrollback_buffer_size = 100000

" Color and syntax settings {{{
set background=dark
syntax enable
highlight clear
if exists("syntax_on")
  syntax reset
endif
colorscheme onehalfdark
set termguicolors

highlight! link NonText Comment
highlight! link Whitespace Comment
highlight! Search ctermfg=NONE guifg=NONE
highlight! OverLength ctermbg=238
" }}}

" Global settings {{{
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed
set path+=**
set relativenumber
set number
set list
set listchars=tab:>\ ,eol:¬,trail:_
set wrap
set showcmd         " Show (partial) command in status line.
set showmode
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hlsearch
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=1
set scrolloff=3
set tabstop=4       " Width of a tab
set shiftwidth=4    " Width when indenting
set expandtab       " Tabs become spaces
set smarttab        " Spaces removed by <BS> at beginning of line
set matchpairs+=<:>     " Add html matching
set wildmenu
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,.git,**/node_modules/**
set complete=.,w,b,u,t,i ",kspell for spelling
"set laststatus=2   " 2 lines for status bar
set hidden          " Hide buffers when they are abandoned
set visualbell
set noerrorbells
set undofile " Set undo history"
set undodir=$HOME/.vim/undo
set undolevels=10000
" set statusline=%t
" set statusline+=%m
" set statusline+=%*
set splitbelow
set splitright
set showtabline=1
set history=1000
set backspace=indent,eol,start
" }}}

" Mappings {{{
" leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Global mappings
nnoremap j gj
nnoremap k gk
nnoremap <C-s> :w<ENTER>
nnoremap z0 :setlocal foldlevel=0<CR>
nnoremap z1 :setlocal foldlevel=1<CR>
nnoremap z2 :setlocal foldlevel=2<CR>
inoremap <C-s> <ESC>:w<ENTER>
inoremap jk <ESC>
"inoremap <C-h> <left>
"inoremap <C-l> <right>
nnoremap <C-d> :call smooth_scroll#down(&scroll, 2, 1)<ENTER>
nnoremap <C-u> :call smooth_scroll#up(&scroll, 2, 1)<ENTER>
nnoremap <leader>tw :ToggleWorkspace<CR>
nnoremap <leader>id :read !date "+\%Y-\%m-\%d"<CR>kJ
nnoremap <leader>it :read !date "+\%H:\%M:\%S"<CR>kJ

" Windows and Tabs mappings
nnoremap <leader>w <C-w>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wZ <C-w>\|
nnoremap <leader>wl :vertical resize +10<ENTER>
nnoremap <leader>wh :vertical resize -10<ENTER>
nnoremap <leader>wk :resize +10<ENTER>
nnoremap <leader>wj :resize -10<ENTER>
nnoremap <leader>w" :12split term://$SHELL<CR>i
nnoremap <leader>w' :vsplit term://$SHELL<CR>i
nnoremap <leader>wm :resize 12<CR>
nnoremap <leader>l :buffers<CR>:buffer<Space>
nnoremap <leader>o :buffer #<CR>
nnoremap <leader>f :find 
nnoremap <leader>sf :sfind 
nnoremap <leader>vf :vert sfind 
nnoremap <leader>e :tabedit 
nnoremap <leader>t :tabmove 

" Terminal mappings
:tnoremap <Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l

" Search mappings
nnoremap <leader>/ :nohlsearch<ENTER>
vnoremap <leader>/ "sy/<C-r>s<ENTER>
nnoremap n nzz
nnoremap N Nzz

" vimrc mappings
nnoremap <leader>et :vsplit ~/TODO.txt<ENTER>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<ENTER>
nnoremap <leader>R :source ~/.config/nvim/init.vim<ENTER>

" ctags mappings
nnoremap <C-$> <C-]>

" Display mappings
nnoremap <leader>tl :set list!<ENTER>
nnoremap <leader>n :set number!<ENTER>:set relativenumber!<ENTER>

" History mappings
nnoremap <leader>tu :UndotreeToggle<CR>
nnoremap <leader>ul :undolist<CR>
nnoremap <leader>dn :undolist<CR>:call DiffChangeNumber(

" Information/Printing mappings
" Print name of the function the cursor is in
nnoremap <leader>p :call PrintCurrentBufferFullPath()<ENTER>
nnoremap <leader>pf :call PrintFunctionNameCursorIsIn()<ENTER>
nnoremap <leader>pp :call PrintCurrentBufferFullPath()<ENTER>
nnoremap <leader>phi :call PrintInfoOnWordBelowCursor()<ENTER>

" Coding/Editing mappings
nnoremap U viwUe
nnoremap <leader>" viw<ESC>`<i"<ESC>`>la"<ESC>
nnoremap <leader>' viw<ESC>`<i'<ESC>`>la'<ESC>
nnoremap <leader>( viw<ESC>`<i(<ESC>`>la)<ESC>
nnoremap <leader>[ viw<ESC>`<i[<ESC>`>la]<ESC>
nnoremap <leader>{ viw<ESC>`<i{<ESC>`>la}<ESC>
vnoremap <leader>" <ESC>`<i"<ESC>`>la"<ESC>
vnoremap <leader>' <ESC>`<i'<ESC>`>la'<ESC>
vnoremap <leader>( <ESC>`<i(<ESC>`>la)<ESC>
vnoremap <leader>[ <ESC>`<i[<ESC>`>la]<ESC>
vnoremap <leader>{ <ESC>`<i{<ESC>`>la}<ESC>
" Command-line mappings
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" }}}

" Abbreviations {{{
iabbrev funciton function
iabbrev fn function()<left>
iabbrev ff false
iabbrev tt true
" }}}

" File type settings and mappings {{{
augroup global
    autocmd!
    autocmd BufNewFile,BufWritePost * Neomake
    autocmd BufEnter * match OverLength /\%>80v/
augroup END

augroup terminal
    autocmd!
    autocmd TermOpen * setlocal relativenumber number
augroup END

augroup php
    autocmd!
    autocmd FileType php setlocal foldlevel=1
augroup END

augroup javascript
    autocmd!
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
augroup END

augroup TODO_txt
    autocmd!
    autocmd BufNewFile,BufReadPost TODO.txt setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufReadPost TODO.txt call InitTodoOptions()
    " autocmd BufNewFile,BufReadPost TODO.txt setlocal signcolumn=yes
    autocmd BufNewFile,BufReadPost TODO.txt
        \ nnoremap <buffer> <localleader>st :call ChangeTodoStatus('TODO')<CR> |
        \ nnoremap <buffer> <localleader>sw :call ChangeTodoStatus('WAIT')<CR> |
        \ nnoremap <buffer> <localleader>sh :call ChangeTodoStatus('HELP')<CR> |
        \ nnoremap <buffer> <localleader>so :call ChangeTodoStatus('WIP')<CR>  |
        \ nnoremap <buffer> <localleader>sd :call ChangeTodoStatus('DONE')<CR> |
        \ nnoremap <buffer> <localleader>sn :call ChangeTodoStatus('NOPE')<CR> |
        " \ nnoremap <buffer> <localleader>vh :call ChangeTodoVisibility('high_visibility')<CR> |
        " \ nnoremap <buffer> <localleader>vm :call ChangeTodoVisibility('medium_visibility')<CR> |
        " \ nnoremap <buffer> <localleader>vr :call RemoveTodoVisibility()<CR>

    function! InitTodoOptions()
        syntax keyword SpellCap TODO
        syntax keyword Error HIGH
        syntax keyword DiffAdd DONE
        syntax keyword Pmenu NOPE
        syntax keyword Constant HELP
        syntax keyword Directory WAIT
        syntax keyword Question WIP
        " sign define high_visibility text=H texthl=Error
        " sign define medium_visibility text=M texthl=Todo
    endfunction

    " function! RemoveTodoVisibility()
        " let b:current_line = line('.')
        " execute "sign unplace " . b:current_line
    " endfunction

    " function! ChangeTodoVisibility(visibility)
        " call RemoveTodoVisibility()
        " let b:available_visibilities = GetAvailableVisibilities()
        " let b:current_line = line('.')

        " for visio in b:available_visibilities
            " if visio ==# a:visibility
                " execute "sign place " . b:current_line . " line=" . b:current_line . " name=" . a:visibility . " file=" . expand('%:p')
            " endif
        " endfor
    " endfunction

    function! ChangeTodoStatus(status_name)
        let b:available_statuses = GetAvailableStatuses()
        let b:status_name_exists = 0
        " Chack status_name is in list of available ones.
        for status in b:available_statuses
            if status ==# a:status_name
                let b:status_name_exists = 1
            endif
        endfor
        if b:status_name_exists == 0
            return 0
        endif

        " Select first word after - in line and see if a status word.
        let b:current_position = getpos('.')
        let b:current_status_found = 0
        execute "normal! 0f-w"
        execute "normal! viw\"wy"
        let b:status_found = @w

        for status in b:available_statuses
            if status ==# b:status_found
                let b:current_status_found = 1
            endif
        endfor
        if b:current_status_found
            let @w = a:status_name
            execute "normal! \"_diw"
            execute "normal! \"wP"
        endif
        call setpos('.', b:current_position)
    endfunction

    function! GetAvailableStatuses()
        let statuses_list = ['DONE', 'TODO', 'WAIT', 'HELP', 'WIP', 'NOPE']
        return statuses_list
    endfunction

    " function! GetAvailableVisibilities()
        " let visibilities_list = ['high_visibility', 'medium_visibility']
        " return visibilities_list
    " endfunction
augroup END

" }}}

" Functions {{{

" Open a new tab diffing current change number with change_number
function! DiffChangeNumber(change_number)
    let b:current_change_number = changenr()
    execute "undo " . a:change_number
    execute "%y o"
    execute "undo " . b:current_change_number
    execute "tabe " . expand('%:p')
    execute "vnew"
    normal "oPGdd
    execute "windo diffthis"
endfunction

function! PrintCurrentBufferFullPath()
  echo expand('%:p')
endfunction

function! PrintInfoOnWordBelowCursor()
  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

function! PrintFunctionNameCursorIsIn()
  let b:currentSearchPattern = @/
  execute "normal! mm"
  execute "normal! ?function\<ENTER>W"
  execute "normal! \"pyiw"
  execute "normal! `m"
  let @/ = b:currentSearchPattern
  echo @p
endfunction
