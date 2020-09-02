#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

iatest=$(expr index "$-" i)
distribution=$(cat /etc/os-release | awk 'NR==3' | awk -F '=' '{print $2}')

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# ** to mean reclusive
shopt -s globstar

# ░█▀▀░█░█░█▀█░█▀█░█▀▄░▀█▀░█▀▀
# ░█▀▀░▄▀▄░█▀▀░█░█░█▀▄░░█░░▀▀█
# ░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀

# Make local bin files usable
export PATH=$PATH:~/.local/bin

# Git Indicators
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoreboth

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
# if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nano
export VISUAL=xed
alias nano='nano -c'
alias snano='sudo nano'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ░█▀█░█▀▄░█▀█░█▄█░█▀█░▀█▀
# ░█▀▀░█▀▄░█░█░█░█░█▀▀░░█░
# ░▀░░░▀░▀░▀▀▀░▀░▀░▀░░░░▀░

# Define colors
gray="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
magenta="\033[1;35m"
cyan="\033[1;36m"
white="\033[1;37m"

lightgray="\033[0;30m"
lightred="\033[0;31m"
lightgreen="\033[0;32m"
lightyellow="\033[0;33m"
lightblue="\033[0;34m"
lightmagenta="\033[0;35m"
lightcyan="\033[0;36m"
white="\033[0;37m"

nocolor="\033[0m"

# Color bash prompt depending on user
if [[ ${EUID} == 0 ]]; then # if user is root
  prompt_color=$lightred
  directory_color=$lightcyan
else
  prompt_color=$lightgreen
  directory_color=$lightyellow
  user_display='\u@'
fi

git_color=$lightcyan

if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
  . /usr/share/git/completion/git-prompt.sh
fi

hostPart="\[${prompt_color}\]$user_display\h\[${prompt_color}\]"
workingDirectoryPart="\[${directory_color}\]\w\[${prompt_color}\]"
signPart="\[${prompt_color}\]"'\$'"\[${nocolor}\]"
gitBranchPart="\[${git_color}\]\$(__git_ps1 ' %s')\[${nocolor}\]"

PS1="$hostPart [ $workingDirectoryPart ]: $gitBranchPart\n $signPart "

# ░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
# ░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

###############################
# MACHINE SPECIFIC
###############################

# Wake Commands
if [[ -f ~/.bash_wake ]]; then
  . ~/.bash_wake
fi

# pacman for Arch based systems
if [[ $distribution = 'arch' ]]; then
  alias pacman-upgrade='sudo pacman -Suy'
  alias pacman-update-mirrors='sudo pacman-mirrors --geoip'
  alias pacman-clean-orphans='sudo pacman -Rs $(pacman -Qtdq)'
  alias pacman-fullclean-orphans='sudo pacman -Rns $(pacman -Qtdq)'
fi

# Start ArchiSteamFarm
if [[ -d ~/ASF ]]; then
  alias asf='~/ASF/ArchiSteamFarm'
fi

# Update Proton
alias update-proton='development/cproton.sh'

###############################
# GENERAL
###############################

# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Enable aliases for Sudo commands
alias sudo='sudo '

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Aliases to modified commands
alias mkdir='mkdir -p'
alias less='less -R'
alias makepkg='makepkg -si'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd back into the previous directory
alias bd='cd "$OLDPWD"'

# Aliases for multiple directory listing commands
alias ls='ls -Fh --color=always'  # add colors and file type extensions
alias la='ls -Ah'                 # show hidden files
alias ll='ls -als'                # long listing format
alias llf="ls -l | egrep -v '^d'" # long list files only
alias lld="ls -l | egrep '^d'"    # long list directories only

# Grep
alias grep='grep --colour=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "
alias ff='find . -type f -name'
alias fd='find . -type d -name'

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

###############################
# NETWORKING
###############################

# Show used DNS addresses
alias dnsview='cat /etc/resolv.conf'

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

###############################
# SYSTEM
###############################

# Alias's for power management
alias reboot='sudo shutdown -r now'
alias forcereboot='sudo shutdown -r -n now'
alias shutdown='sudo shutdown -P'
alias suspend='sudo systemctl suspend'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# ░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█
# ░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

# Extracts any archive(s) (if unp isn't installed)
ex() {
  for archive in $*; do
    if [ -f $archive ]; then
      case $archive in
      *.tar.bz2) tar xvjf $archive ;;
      *.tar.gz) tar xvzf $archive ;;
      *.bz2) bunzip2 $archive ;;
      *.rar) rar x $archive ;;
      *.gz) gunzip $archive ;;
      *.tar) tar xvf $archive ;;
      *.tbz2) tar xvjf $archive ;;
      *.tgz) tar xvzf $archive ;;
      *.zip) unzip $archive ;;
      *.Z) uncompress $archive ;;
      *.7z) 7z x $archive ;;
      *) echo "don't know how to extract '$archive'..." ;;
      esac
    else
      echo "'$archive' is not a valid file!"
    fi
  done
}

# Searches for text in all files in the current folder
ftext() {
  # -i case-insensitive
  # -I ignore binary files
  # -H causes filename to be printed
  # -r recursive search
  # -n causes line number to be printed
  # optional: -F treat search term as a literal, not a regular expression
  # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
  grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
  set -e
  strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Create a git commit of all the changes
gc() {
  git add .
  git commit -m "${1}"
}

# Create a git commit of all the changes and push to repository
gp() {
  git add .
  git commit -m "${1}"
  git push
}

# Create and go to the directory
mkdirg() {
  mkdir -p $1
  cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
  local d=""
  limit=$1
  for ((i = 1; i <= limit; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

editbash() {
  if [[ -f /usr/bin/xed ]]; then
    $VISUAL ~/development/ArtemSmaznov/dotfiles/home/.bashrc
  else
    $EDITOR ~/development/ArtemSmaznov/dotfiles/home/.bashrc
  fi
}
