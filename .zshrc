# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/sebastienpalluel/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ctags="`brew --prefix`/bin/ctags"
alias ctagsproject="ctags -R -f ./.git/tags"
alias 42projects="cd ~/Documents/42"
alias soularchive="cd ~/Documents/of_v0.9.3_osx_release/apps/SoulArchive"
alias ofxaddons="cd ~/Documents/of_v0.9.3_osx_release/addons"
alias vim='/usr/local/Cellar/macvim/8.0-124/MacVim.app/Contents/MacOS/Vim'
alias vi='/usr/local/Cellar/macvim/8.0-124/MacVim.app/Contents/MacOS/Vim'
# alias commandOA
search() 
{
	grep -nr $1 .
}

findfile()
{
	find . -type f -name $1 -print
}

leaksapp()
{
	leaks $(pgrep $1)
}

extract() 
{
	if [ -z "$1" ]; then
		# display usage if no parameters given
		echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
		echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
		return 1
	else
		for n in $@
		do
			if [ -f "$n" ] ; then
				case "${n%,}" in
					*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
						tar xvf "$n"       ;;
					*.lzma)      unlzma ./"$n"      ;;
					*.bz2)       bunzip2 ./"$n"     ;;
					*.rar)       unrar x -ad ./"$n" ;;
					*.gz)        gunzip ./"$n"      ;;
					*.zip)       unzip ./"$n"       ;;
					*.z)         uncompress ./"$n"  ;;
					*.7z)        7z x ./"$n"        ;;
					*.xz)        unxz ./"$n"        ;;
					*.exe)       cabextract ./"$n"  ;;
					*)
						echo "extract: '$n' - unknown archive method"
						return 1
						;;
				esac
			else
				echo "'$n' - file does not exist"
				return 1
			fi
		done
	fi
}

compress ()
{
	tar czf $1.tar $1
}

mcd () {
	mkdir $1
	cd $1
}

# alias command
export MAIL42=sebpalluel@free.fr
export USER42=psebasti

export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib\
	${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
