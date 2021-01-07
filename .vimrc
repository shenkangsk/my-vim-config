" vim plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/syntastic'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'ycm-core/YouCompleteMe'
Plug 'joshdick/onedark.vim'

call plug#end()

" --------------- onedark theme configruation ------------------

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
" $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 <
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" enable terminal background.
if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    augroup END
endif

syntax on
colorscheme onedark

" -------------- onedark theme configruation -------------------

" -------------- shortuct map ----------------------------

map <C-n> :NERDTreeToggle<CR>
map <C-f> :PrettierAsync<CR>

" -------------- shortuct map ----------------------------
  
"----------- front about options ------------------
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts,*.jsx,*.tsx set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts,*.jsx,*.tsx set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts,*.jsx,*.tsx set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts,*.jsx,*.tsx set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts,*.jsx,*.tsx set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts,*.jsx,*.tsx set fileformat=unix

autocmd FileType vue syntax sync fromstart

let g:syntastic_javascript_checkers = ['eslint']

"-------------- front about options --------------

" set vert line
set fillchars=vert:\ 
highlight VertSplit ctermfg=black

set number
highlight LineNr ctermfg=grey

" set text tabsize
set ts=4
set sw=4
set expandtab
%retab!

let g:vue_pre_processors = ['ts', 'stylus', 'less' , 'scss']

let g:airline_theme='simple'

