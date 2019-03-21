export PS1="\[\033[32m\]\w\[\033[0m\] $ "

alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias glp='git log -p'
alias gr='git checkout HEAD'

alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'

alias sea='brew search'
alias b='brew install'
alias c='brew cask install'

alias d='cd ~/github/dotfiles'
alias a='time serverkit apply recipe.yml.erb'

alias cls='clear'

alias masmas='brew install mas'
alias masw='time mas install 410628904'
alias masp='time mas install 568494494'
alias masx='time mas install 497799835'
alias masc='time mas install 1024640650'

alias q='exit'

export PATH="$HOME/.rbenv/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
eval "$(rbenv init -)"
