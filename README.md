#Vim, Git, Zsh etc.

<<<<<<< HEAD
#install package :
sh ./install_dependencies.sh
option "-42" to change username and password for header
=======
#Install:
1. git clone
2. move files in ~/
2. sh ~/install_depenendcies.sh (-42 if want to change credentials)
3. enjoy :)
>>>>>>> b5e77e4065cfac6d3476f560a60e48d644532729

#Setup to an other machine (¡will overwrite all the same file from repo, reconfig with correct path!):
cd ~/
git init
git remote add home https://github.com/sebpalluel/Session
git fetch home master
git reset --hard my_repo master

<<<<<<< HEAD
=======
###############################################################################

>>>>>>> b5e77e4065cfac6d3476f560a60e48d644532729
#git:
- error: Your local changes to the following files would be overwritten by merge:
to override all local changes :
git reset --hard
git pull
- merge with manual resolution of conflict:
git merge generic_t_list --no-ff
- install git issue in command line :
gem install pygments.rb
brew install ghi

#Vim Shortcuts:
-Ctags 
g-] see all the tags for word
Ctrl-]	Jump to the tag underneath the cursor
:ts <tag> <RET>	Search for a particular tag

:tp	Go to the previous definition for the last tag
:ts	List all of the definitions of the last tag
Ctrl-t	Jump back up in the tag stack

"method to comment block of line
Ctrl-v : visual block select
j to go down, k to go up
Maj-i : insert at begining
ESC

x : delete
w : move word to word
:%s/foo/bar/g (Find each occurrence of 'foo' (in all lines), and replace it with 'bar’.)

<<<<<<< HEAD
=======
#youcompleteme:
- Compiling YCM with semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
- JavaScript support: install Node.js and npm and add --tern-completer when calling ./install.py
- Go support: install Go and add --gocode-completer when calling ./install.py.

#Conque-GDB:
Install gdb new version enable vim instruction : https://zschoche.org/debugging-in-vim/
Don’t forget to give correct path to mvim.
README https://github.com/vim-scripts/Conque-GDB/blob/master/doc/conque_gdb.txt
Small introduction : https://www.youtube.com/watch?v=ZcSjaYSoqnc&feature=youtu.be

>>>>>>> b5e77e4065cfac6d3476f560a60e48d644532729
#Iterm2
Iterm2 cheatsheet https://gist.github.com/helger/3070258

#Valgrind
test memory leaks :
valgrind --leak-check=yes --track-origins=yes $app $arg1 $arg2
