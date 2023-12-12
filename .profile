# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

LC_ALL=en_GB
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# adding the common bin from the repository
PATH="$HOME/terminal/bin:$PATH"
# adding krew and python
PATH="${KREW_ROOT:-$HOME/.krew}/bin:/usr/bin/python:$PATH"
# Git short cut
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global --replace-all alias.st "status -sb"
git config --global init.templatedir '~/terminal/.git-templates'

# Manage .aliases in folders
function aliases(){
    if [ -f .aliases ]; then
        echo "Loading aliases...${PWD}"
        . ${PWD}/.aliases
    fi
    return 0
}


# Allow to source .aliases file with aliases for the current folder
function cd () { 
  builtin cd "$@" && aliases
  return 0
}

# cd from anywhere into your project folder, easy switch from one project to another
CDPATH=.:~/Projects:~/git_clones

#System alias
alias ll='ls -la'
alias q='exit'
alias c='clear'
alias home='cd ~'
alias root='cd /'
alias work='cd ~/Projects'
alias o=open
alias ..='cd ..'
alias branches='~/terminal/bin/branches.sh'
alias master='git checkout master'
alias development='git checkout development'
alias production='git checkout production'
alias previous='git checkout @{-1}'
alias graph='git log --graph --decorate'
alias files='find * -type f | fzf > selected'
alias squash-all='git reset $(git commit-tree HEAD^{tree} -m "Clean Start")'
alias aliases='alias;cat .aliases'
alias python='python3' 
