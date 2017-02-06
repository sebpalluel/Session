#Vim, Git, Zsh etc.

#install package :
1.	sh ./install_dependencies.sh
1.	option "-42" to change username and password for header

#Setup to an other machine (¡will overwrite all the same file from repo, reconfig with correct path!):
1.	cd ~/
2.	git init
3.	git remote add home https://github.com/sebpalluel/Session
4.	git fetch home master
5.	git reset --hard my_repo master

#git:
*	error: Your local changes to the following files would be overwritten by merge:
to override all local changes :
1.	git reset --hard
2.	git pull
*	merge with manual resolution of conflict:
git merge generic_t_list --no-ff

#Vim Shortcuts:
-	Ctags :
1.	g-] see all the tags for word
2.	Ctrl-]	Jump to the tag underneath the cursor
3.	:ts <tag> <RET>	Search for a particular tag
4.	:tn	Go to the next definition for the last tag
5.	:tp	Go to the previous definition for the last tag
6.	:ts	List all of the definitions of the last tag
7.	Ctrl-t	Jump back up in the tag stack

*	method to comment block of line
1.	Ctrl-v : visual block select
2.	j to go down, k to go up
3.	Maj-i : insert at begining
4.	ESC

*	basic moves
1.	x : delete
2.	w : move word to word
3.	:%s/foo/bar/g (Find each occurrence of 'foo' (in all lines), and replace it with 'bar’.)

#Iterm2
Iterm2 cheatsheet https://gist.github.com/helger/3070258

#Valgrind
-	test memory leaks :
valgrind --leak-check=yes --track-origins=yes $app $arg1 $arg2
