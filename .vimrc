let $BASH_ENV = $HOME . "/.bashrc" . getpid()
au VimLeave * silent !exec rm -f "$BASH_ENV"
silent !echo 'vim_setup() { shopt -s expand_aliases; trap write_aliases EXIT; eval "$@"; }; write_aliases() { typeset -f vim_setup write_aliases; alias; echo vim_setup \"\$@\";} > "$BASH_ENV"; vim_setup "$@"' > "$BASH_ENV"
set shell=/bin/bash

source ~/.vim/startup/mappings.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/plugins.vim
source ~/.vim/startup/color.vim
