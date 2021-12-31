" シェルを指定
set shell=/bin/zsh

" setting
" encoding
set encoding=utf8
scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac
set ambiwidth=double
set nobomb
set t_Co=256
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" ヤンクをクリップボードへつなぐ
set clipboard+=unnamed
" ビープ音を消す
set belloff=all
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" バックスペースを使えるようにする
set backspace=indent,eol,start


" 見た目系
" 行番号を表示
set number
" タイトルを表示
set title

" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" ファイルタイプの検索を有効化
filetype plugin indent on
" ファイルタイプに合わせたインデントを使用
filetype indent on
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" オートインデント
set autoindent
set smartindent
autocmd FileType python setlocal sw=4 sts=4 ts=4 et


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" キーバインド系
" 1 で行頭に移動
nnoremap 1 ^
" 2 で行末に移動
nnoremap 2 $
" , で前のバッファタブへ
nnoremap <silent> , :bprev<CR>
" . で次のバッファタブへ
nnoremap <silent> . :bnext<CR>
" \ でファイル内の文字置換
nnoremap \ :%s///g<LEFT><LEFT><LEFT>
" 現在のバッファ削除
nnoremap bd :bd<CR>
" 括弧の補完
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
" InsertモードでEmacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>
" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv
" 画面分割系
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l
nnoremap st :tabnew
nnoremap sn gt
nnoremap sp gT

" plugin manager
if &compatible
  set nocompatible
endif

" アンドゥの永続化
if has("presistent_undo")
  set undodir=~/.undodir
  set undofile
endif

" カラースキーム(任意です)
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

syntax on
colorscheme default

