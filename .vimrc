" ##### OPTIONS
  let g:snips_author = 'Timo Strotmann'
  let g:snips_author_email = 'timo@timo-strotmann.de'
  let g:snips_author_company = 'saltation GmbH \& Co. KG'
  let mapleader = ","


" ##### General Options
  set nocompatible                                    " Vim Modus statt Vi Modus verwenden
  filetype plugin indent on                           " Automatische Erkennung des Dateityp und Einrückung aktivieren
  syntax on                                           " Syntax highlighting aktivieren
  set mouse=a                                         " use mouse as usual
  set encoding=utf-8                                  " These are highly recommended options.
  "scriptencoding utf-8                                " Wandelt die Datei gegebenenfalls nach UTF-8
  set viewoptions=folds,options,cursor,unix,slash     " better unix / windows compatibility
  set virtualedit=onemore                             " Erlaubt den Cursor hinter das letzte Zeichen zu setzen
  set history=1000                                    " History des Kommandozeilen-Eingaben auf die letzten 1000 beschränken (default ist 20)
  " setlocal spell spelllang=de_de                      " Spell-Checking aktivieren und auf alter und neuer Rechtschreibung festlegen
                                                      " ]s  Zum nächsten falsch geschrieben Wort gehen
                                                      " [s  Zum vorherigen falsch geschrieben Wort gehen
                                                      " z=  Zeigt eventuelle Vorschläge für die Korrektur an
  map <F8>  :setlocal spell spelllang=de_de <return>
    " --- Backup Files in ~/.vim/backups erstellen und Dateiendung .bak anfügen
  set backup
  set backupdir=~/.backups
  set backupext=.bak


" ##### VIM UI
  set si                                              " Smart Indenting aktivieren
    
    " --- Statuszeile anzeigen
  set ruler                                           " Position des Cursors in der Statuszeile anzeigen
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " <BufferNr><Dateityp> <Zeile>,<Spalte> <Prozent>
  set cursorline                                      " Akt. Zeile (also die in der der Cursor steht) hervorheben
  set number                                          " Zeilennummern anzeigen
  set showcmd                                         " Kommandos beim Eintippen rechts unten in der Statuszeile anzeigen
  if has('statusline')
    set laststatus=2
    set statusline=%<%f\                              " Filename
    set statusline+=%w%h%m%r                          " Options
    "set statusline+=%{fugitive#statusline()}          " Git Hotness
    set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
    set statusline+=\ [%{&ff}/%Y]                     " filetype
    set statusline+=\ [%{getcwd()}]                   " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B]            " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%           " Right aligned file nav info
  endif

  set backspace=indent,eol,start                      " Backspace im Einfüge-Modus erlauben
  set linespace=0                                     " No extra spaces between rows
  set showmatch                                       " öffnende und schließende Klammern hervorheben
  "set winminheight=0                                  " windows can be 0 line high 
  set scrolljump=5                                    " lines to scroll when cursor leaves screen
  set scrolloff=3                                     " Maintain more context around the cursor

    " --- Search Options
  set incsearch                                       " Suchergebnisse einfärben
  set hlsearch                                        " Highlight search terms
  set ignorecase                                      " Case-Insensitive Suche
  set smartcase                                       " Ignorieren der Option _ignorecase_, wenn das Suchmuster ein Großbuchstaben enthält

    " --- Better command-line completion
  set wildmenu                                        " show list instead of just completing
  set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
  set wildmode=list:longest,full                      " command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]                       " backspace and cursor keys wrap to

    " --- Formating
  " set tabstop=2                                       " never change tabstop from default(8), only change shiftwidth and softtabstop!
  set nowrap                                          " wrap long lines
  set autoindent                                      " automatisches Indenting aktivieren
  set shiftwidth=2                                    " automatische Einrückung bei Autoident
  set expandtab                                       " Tab converted to spaces
  set shiftround                                      " when at 3 spaces, and I hit > ... go to 4, not 5
  set softtabstop=2                                   " Enstelle eines <Tab>s werden x-Spaces eingefügt
    " Remove trailing whitespaces and ^M chars
  autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

  set list
  set listchars=tab:>-,trail:·,extends:#,nbsp:.,eol:$ " make tabs and trailing spaces visible when requested
  nmap <silent> <leader>s :set nolist!<CR>

  " set matchpairs+=<:>                                 " match, to be used with % 
  " set pastetoggle=<F11>                               " pastetoggle (sane indentation on pastes)
  " set comments=sl:/*,mb:*,elx:*/                      " auto format comment blocks

    " --- Folding Options
  set foldenable                                      " auto fold code
  set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo    " These commands open folds
  set foldmethod=indent                               " fold based on indent, availeable 'indent', 'syntax'
  set foldnestmax=10                                  " deepest fold is 10 levels
  set nofoldenable                                    " dont fold ba default
  set foldlevel=1                                     " this is just what i use
  nmap <leader>f0 :set foldlevel=0<CR>                " Code folding options
  nmap <leader>f1 :set foldlevel=1<CR>                "   --"--
  nmap <leader>f2 :set foldlevel=2<CR>
  nmap <leader>f3 :set foldlevel=3<CR>
  nmap <leader>f4 :set foldlevel=4<CR>
  nmap <leader>f5 :set foldlevel=5<CR>
  nmap <leader>f6 :set foldlevel=6<CR>
  nmap <leader>f7 :set foldlevel=7<CR>
  nmap <leader>f8 :set foldlevel=8<CR>
  nmap <leader>f9 :set foldlevel=9<CR>
  "set fillchars=vert:\|,fold:\ ,diff:-


" ##### MOVEMENT
  set whichwrap+=<,>,[,],h,l                          " backspace and cursor can go lines up or down
    " Stop certain movements from always going to the first character of a line.
    " While this behaviour deviates from that of Vi, it does what most users coming from other editors would expect.
  set nostartofline
  " Easier moving in tabs and windows
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

" ##### COMPLETION

  " Completion settings in insertmode
  set complete=.,w,b,t,i
  "set completeopt=menu,longest,preview



" ##### PLUGIN SETTINGS
  " --- vbundle
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle. Required!
  Bundle 'gmarik/vundle'

  "
  " Brief help
  "
  " :BundleInstall  - install bundles (won't update installed)
  " :BundleInstall! - update if installed
  "
  " :Bundles foo    - search for foo
  " :Bundles! foo   - refresh cached list and search for foo
  "
  " :BundleClean    - confirm removal of unused bundles
  " :BundleClean!   - remove without confirmation

  " --- My Bundles:

  " Farbschema
  "Bundle 'xoria256.vim'
  Bundle 'Color-Sampler-Pack'
    colorscheme wombat256
    " colorscheme neon
    " colorscheme railscasts2
    " colorscheme darkspectrum
  
  " Folding for PHP
  " Bundle 'phpfolding.vim'
    " map <F5> <Esc>:EnableFastPHPFolds<Cr> 
    " map <F6> <Esc>:EnablePHPFolds<Cr> 
    " map <F7> <Esc>:DisablePHPFolds<Cr>

  " Ctags
  Bundle 'ctags.vim'
    " This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
    " set tags=./tags;/,$HOME/vimtags
    " map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
    " map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split

  " Tastenkürzel für CScope macht aber auch die CTags Navigation besser
  Bundle 'cscope_macros.vim'

  " Um schnell Klammern, Anführungszeichen etc. um Blöcke zu setzen/ändern
  Bundle 'tpope/vim-surround'

  " ergänzt automatisch schließende Klammern, Anführungszeichen usw.
  Bundle 'delimitMate.vim'

  " Git-Integration
  Bundle 'tpope/vim-fugitive'

  " Direktes Highlighting bei der Eingabe von Suchbegriffen
  Bundle 'Lokaltog/vim-easymotion'

  " HTML schneller zu schreiben: #album.photo  =>  <div id="album" class="photo">|</div>
  " see http://jetpackweb.com/blog/2010/03/04/write-html-faster-with-sparkup-vim-and-textmate/
  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

  " ist ein Alignment-Plugin, mit dem man im Visual-Mode markierte Blöcke per :Align <gewünschterSeperator> ordnen kannst.
  " see http://drchip.0sites.net/astronaut/vim/align.html#Examples
  Bundle 'Align'

  " Recht mächtige Autovervollständige
  Bundle 'Shougo/neocomplcache'
  let g:neocomplcache_enable_at_startup = 1

  " File-Launcher ähnlich wie in Textmate
  Bundle 'FuzzyFinder'
  map <F2> :FufCoverageFile<CR>
  " non github repos
  Bundle 'git://git.wincent.com/command-t.git'

  " Erweiterter Dateisystembrowser
  Bundle 'scrooloose/nerdtree'
  map <F3> :NERDTreeToggle<CR>

  " Sourcecodebrower - Mit 'taglist' kannst man zu Klassen und Methoden navigieren
  Bundle 'taglist.vim'
  map <F4> :TlistToggle<CR>

  " A plugin that allows for easy commenting of code for many filetypes
  Bundle 'https://github.com/scrooloose/nerdcommenter.git'

  " Syntaxchecker, auch für PHP
  Bundle 'scrooloose/syntastic'

  " Code-Schnipsel
  Bundle 'snipMate'

  " 
  Bundle 'L9'
