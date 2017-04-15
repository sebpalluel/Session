#!/usr/bin/env bash

#if [[ $1 = "-42" ]]; then
#	42s = 1
#	echo "option for 42school"
#fi

#if [ "$1" = "-42" ]; then
#	echo "type your username:"
#	read user
#	sed -i "" "s/psebasti/$user/g" ~/Session/.zshrc
#	echo "type your mail:"
#	read mail
#	#sed -i "" "s/sebpalluel@free.fr/$mail/g" ~/Session/.zshrc
#fi
if [ ! -d ~/Session_tmp]; then
	echo "mv files and directories to tmp and erase"
	mkdir ~/Session_tmp && mv ~/.atom ~/.bash_profile ~/.bashrc ~/.vim ~/.vimrc ~/.zshrc ~/Session_tmp/
	ln -s ~/Session/.atom ~/Session/.bash_profile ~/Session/.bashrc ~/Session/.vimrc ~/Session/.zshrc ~/
else
	echo "symbolic link already operated and former config saved in Session_tmp"
fi

if [ "$1" = "-42" ]; then
	echo "type your username:"
	read user
	sed -i "" "/USER42/d" ~/Session/.zshrc && echo "export USER42=$user" >> ~/Session/.zshrc
	echo "type your mail:"
	read mail
	sed -i "" "/MAIL42/d" ~/Session/.zshrc && echo "export MAIL42=$mail" >> ~/Session/.zshrc
fi

echo "config git to exclude file globaly"
git config --global core.excludesfile ~/Session/.gitignore_global

echo "make custom script executable"
chmod +x ~/Session/bin/*

if [ ! -f ~/.ctagsignore ]; then
	echo "create .ctagsignore file"
	touch ~/.ctagsignore
else
	echo "erase and recreate .ctagsignore file to be sure"
	rm ~/.ctagsignore
	touch ~/.ctagsignore
fi

if [ ! -d ~/Session/.vim/bundle/Vundle.vim ]; then
	echo "config Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/Session/.vim/bundle/Vundle.vim
else
	echo "Vundle already exist"
fi

echo "install python"
if brew ls --versions python > /dev/null; then
	brew upgrade python
else
	brew install python
fi

echo "install ruby"
if brew ls --versions ruby > /dev/null; then
	brew upgrade ruby
else
	brew install ruby
fi

echo "install ghi + pygment.rb"
if gem spec pygments.rb > /dev/null 2>&1; then
	brew updgrade ghi
else
	gem install pygments.rb && brew install ghi
fi

echo "config mvim"
brew tap macvim-dev/macvim
if brew ls --versions macvim > /dev/null; then
	brew upgrade macvim
else
	brew install macvim && brew linkapps macvim
fi

echo "config exuberant-ctags"
if brew ls --versions ctags > /dev/null; then
	brew upgrade ctags
else
	brew install ctags
	echo "alias native ctags to exuberant-ctags"
	alias ctags="$(brew --prefix)/bin/ctags"
fi

if [ -f ~/Session/.vim/installed.dummy ]; then
	echo "update Plugins in vim with Vundle"
	vim -c 'PluginUpdate' -c 'qa!'
else
	touch ~/Session/.vim/installed.dummy
	echo "install Plugins in vim with Vundle"
	vim -c 'PluginInstall' -c 'qa!'
fi


echo "do you whant to compile with clang ?"
echo "if so, type:"
echo "y"
read action
if [[ $action = [Yy] ]]; then 
	echo "install C and C++ dependencies for YouCompleteMe"
	cd ~/Session/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
fi

echo "install valgrind"
if brew ls --versions valgrind> /dev/null; then
	brew upgrade valgrind
else
	brew install valgrind
fi

echo "gdb already installed and codesigned ?"
echo "if so type:"
echo "y"
read action
if [[ $action = [Yy] ]]; then 
	exit $exit_code
	exit 1
fi

if brew ls --versions gdb > /dev/null; then
	brew upgrade gdb
else
	brew install gdb
fi

echo "Follow those instruction to be able to use gdb on mac\n"
echo "Start Keychain Access application
(/Applications/Utilities/Keychain Access.app)
Open menu /Keychain Access/Certificate Assistant/Create a Certificate…
Choose name 'gdb-cert',
set Identity Type to Self Signed Root,
set Certificate Type to Code Signing and select the Let me override defaults.
Click several times on Continue until you get to the Specify a Location For The Certificate screen,
then set Keychain to System. […]"
echo "Finally, using the contextual menu for the certificate,
select Get Info,
open the Trust item,
and set Code Signing to Always Trust 
You must quit Keychain Access application in order to use the certificate […]."
echo "everythin is set ? then write 'y' and return"
read action
if [[ $action = [Yy] ]]; then 
	echo "codesign gdb"
	codesign -s gdb-cert $(brew --prefix)/bin/gdb
	echo "you will need to reboot at the end of script in order for it to be active"
fi
exit $exit_code
exit 1
