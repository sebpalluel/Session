# Vim, Git, Zsh etc.

# install package :
```
sh ~/install_dependencies.sh
```
option "-42" to change username and password for header

# force git using custom editor nvim

git config --global ghi.editor nvim

## Setup to an other machine :
### (¡will overwrite all the same file from repo, reconfig with correct path!)
```
cd ~/
git init
git remote add home https://github.com/sebpalluel/Session
git fetch home master
git reset --hard my_repo master
```
#### Install homebrew (42 style)
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh

#### Install homebrew apps
xargs brew install < brew_list.txt

#### git:
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


#### GDB + Leaks
1. Je lance GDB avec la commande classique : gdb ./mon_programme
2. Je commence par dire a gdb qu'il doit set une variable d'environnement qui va stocker tous les resultats/allocations/truc de malloc en faisant : "set env MallocStackLogging 1"
3. Je run mon programme dans gdb avec un simple "run"
4. Dans un second terminal, je lance leaks avec la commande : leaks mon_programme

#### For LLDB
2. process launch --environment MallocStackLogging=1 -- [ARGS]

#### method printf for leaks
printf("%p %s:%i // dealloc\n", tab, __FUNCTION__, __LINE__);

#### script to test leaks of app constantly
while [ true ]; do sleep 2; leaks 'appname'; done

#### Vim-Fugitive
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

#### move from vim to nvim
ln -sf ~/Session/.vim ~/.config/nvim && ln -sf ~/Session/.vimrc ~/Session/.vim/init.vim

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
