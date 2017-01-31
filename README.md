#Vim, Git, Zsh etc.

#Setup to an other machine (¡will overwrite all the same file from repo, reconfig with correct path!):
cd ~/
git init
git remote add home https://github.com/sebpalluel/Session
git fetch home master
git reset --hard my_repo master

#MacVim:

brew tap macvim-dev/macvim
brew install macvim --with-override-system-vim
(or after -> alias vim='mvim -v’)

brew install macvim 
brew linkapps macvim

#Ctags:
http://www.gmarik.info/blog/2010/ctags-on-OSX/ -> alias to new ctags (bug ctags -R)
ctags -R -f ./.git/tags . (tags all source file of project and save in .git

#gitignore:
git config --global core.excludesfile ~/.gitignore_global

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
:tn	Go to the next definition for the last tag
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

#youcompleteme:
- Compiling YCM with semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
- JavaScript support: install Node.js and npm and add --tern-completer when calling ./install.py
- Go support: install Go and add --gocode-completer when calling ./install.py.
error : No .ycm_extra_conf.py file detected : 
~/.vim/bundle/YouCompleteMe
like this
sudo bash ./install.sh

#Conque-GDB:
Install gdb new version enable vim instruction : https://zschoche.org/debugging-in-vim/
Don’t forget to give correct path to mvim.
README https://github.com/vim-scripts/Conque-GDB/blob/master/doc/conque_gdb.txt
Small introduction : https://www.youtube.com/watch?v=ZcSjaYSoqnc&feature=youtu.be

#Compress :
compress nameoffile

#Uncompress :
extract nameoffile

#Debug
https://openclassrooms.com/courses/des-couleurs-dans-la-console-linux
noir surligne en rouge :
\x1b[41;30m
remettre a la normale :
\x1b0[m

#Iterm2
Iterm2 cheatsheet https://gist.github.com/helger/3070258

#Valgrind
test memory leaks :
valgrind --leak-check=yes --track-origins=yes $app $arg1 $arg2
