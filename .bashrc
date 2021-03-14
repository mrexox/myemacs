# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Helpful functions

current_git_branch() {
  res=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [ "$res" != "" ] && echo " $res"
}

# Aliases

alias s='git status --short'
alias dc='docker-compose $*'
alias ll='ls -alF'
alias ..='cd ..'

# Git aliases. See: https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet

alias ggp="git push origin \$(current_git_branch)"
alias ggpf="git push origin \$(current_git_branch) --force-with-lease"
alias ggl="git pull origin \$(current_git_branch)"
alias gfa="git fetch --all --prune"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcam="git commit -am"

# envs

paths=( ${HOME}/go/bin $HOME/.rbenv/bin )
for path in ${paths[*]}; do
	export PATH="${PATH}:${path}"
done

export PS1="\[\033[01;36m\][\u: \w]\[\033[01;33m\]\$(current_git_branch)\[\033[00m\]\[\033[01;36m\] \$ \[\033[00m\]"
export PS2='🏃‍ '

# Other settings

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
