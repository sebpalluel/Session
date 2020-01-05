# Vim, Git, Zsh etc.

# install package :
```
sh ~/install_dependencies.sh
```
option "-42" to change username and password for header

# force git using custom editor nvim

git config --global ghi.editor nvim

## Setup to an other machine :

#### Install homebrew (42 style)
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh

#### Install homebrew apps
xargs brew install < brew_list.txt

#### iTerm2
- cmd-shift-Enter :  “maximize” the current pane — hiding all others in that tab —
Pressing the shortcut again restores the hidden panes.

- cmd-shift-m : The "Set Mark" (cmd-shift-M) command allows you to record a location and then jump back to it later (with cmd-shift-J)

#### git:
-	config a global gitignore:
```
git config --global core.excludesfile ~/Session/.gitignore_global
```
-	error: Your local changes to the following files would be overwritten by merge:
to override all local changes :
```
git reset --hard
git pull
```
-	merge with manual resolution of conflict:
```
git merge generic_t_list --no-ff
```
-	replace master branch with current branch entirelly without losing commits
```
git checkout nameofbranch
git merge -s ours master
git checkout master
git merge nameofbranch
```
#### Vim Debug:
```
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!
```

#### Vim Shortcuts:
-	Ctags :
1. g-] see all the tags for word
2. Ctrl-]	Jump to the tag underneath the cursor
3. :ts <tag> <RET>	Search for a particular tag
4. :tn	Go to the next definition for the last tag
5. :tp	Go to the previous definition for the last tag
6. :ts	List all of the definitions of the last tag
7. Ctrl-t	Jump back up in the tag stack

- method to comment block of line :
1. Ctrl-v : visual block select
2. j to go down, k to go up
3. Maj-i : insert at begining
4. ESC

- basic moves
1. x : delete
2. w : move word to word
3. :%s/foo/bar/g (Find each occurrence of 'foo' (in all lines), and replace it with 'bar’.)

- copy from vim buffer to clipboard
1. To copy the current line, type:
"*yy
2. To copy the whole file/buffer, first go to the beginning via gg, then type:
"*yG

- some basic but essential vim shortcuts

### Sublime Text style selection
https://github.com/terryma/vim-multiple-cursors
https://github.com/terryma/vim-multiple-cursors/wiki/Keystrokes-for-example-gifs

#### Iterm2
Iterm2 cheatsheet https://gist.github.com/helger/3070258

#### Valgrind
-	test memory leaks :
```
valgrind --leak-check=yes --track-origins=yes $app $arg1 $arg2
```

#### ConqueGDB
```
ConqueGDB ./a.out
(gdb) r arg1 arh2 arg3
```
or
```
ConqueGDB --args executablename arg1 arg2 arg3
```
#### Debug Tricks
- Check if all malloc are protected :
```
cat srcs/* | grep -A2 malloc
		   ```

#### GDB + Leaks
1. Je lance GDB avec la commande classique : gdb ./mon_programme
2. Je commence par dire a gdb qu'il doit set une variable d'environnement qui va stocker tous les resultats/allocations/truc de malloc en faisant : "set env MallocStackLogging 1"
3. Je run mon programme dans gdb avec un simple "run"
4. Dans un second terminal, je lance leaks avec la commande : leaks mon_programme

#### For LLDB
2. process launch --environment MallocStackLogging=1 -- [ARGS]

#### Install latest llvm version to support fsanitize=leaks
~ 2hours of installation
https://gist.github.com/datlife/c754535f18b422f6b8d59028c7f31bac

#### method printf for leaks
printf("%p %s:%i // dealloc\n", tab, __FUNCTION__, __LINE__);

#### script to test leaks of app constantly
while [ true ]; do sleep 2; leaks 'appname'; done

#### Vim-Fugitive
- Open logs of different commits
```
<" ">gl 
```
- Open diff file from git repo
```
<" ">gd 
```
- Git add
```
<" ">ga
```
- Git commit
```
<" ">gc
```
- Git push
```
<" ">gps
```

#### Vim-multiple-cursor
https://github.com/terryma/vim-multiple-cursors
Basic move. Select in visual mode, C-n to select next iterations, press 'c' to change, ESC

#### move from vim to nvim
ln -sf ~/Session/.vim ~/.config/nvim && ln -sf ~/Session/.vimrc ~/Session/.vim/init.vim

### install gtags

brew install --HEAD ctags
brew install global --with-exuberant-ctags

#### Iterm Shortcuts
https://www.iterm2.com/documentation-highlights.html

#### Reset Session 42
Reset : `touch ~/.reset`
Reset library : `touch ~/.reset_library`
Pense ensuite à te déconnecter puis te reconnecter.

#### Neovim setup for 42
~/.brew/bin/pip2 install neovim
~/.brew/bin/pip3 install neovim
~/.brew/bin/gem install neovim
~/.brew/bin/npm -g install neovim

#### Neovim web development
- Plugins :
https://github.com/rhysd/NyaoVim
https://github.com/mattn/emmet-vim
https://github.com/hail2u/vim-css3-syntax
- Tutorials :
https://benfrain.com/learning-vim-front-end-coding-month/
https://stackoverflow.com/questions/3173963/useful-vim-plugins-for-web-development-and-design-php-html-css-javascript
https://hackernoon.com/5-vim-plugins-i-cant-live-without-for-javascript-development-f7e98f98e8d5

### GPG

generate key :
gpg --full-generate-key

encrypt :
gpg --armor --recipient $ME --recipient $USER --encrypt --sign text.txt

decrypt :
gpg -d text.txt.asc

### Docker
export MACHINE_STORAGE_PATH=~/.docker_machine
docker-machine create default
eval $(docker-machine env default)
docker run -it debian /bin/bash


### OSX dev issues
- Increase the maximum limit of watcher on system :
https://wilsonmar.github.io/maximum-limits/
- Make Git Case Sensitive
git config core.ignorecase false
