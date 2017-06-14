export PS1="\[\033[32m\]\w\[\033[0m\] $ "

alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias gr='git checkout HEAD'

alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'

alias sea='brew search'
alias b='brew install'

alias d='cd ~/github/dotfiles'
alias a='serverkit apply recipe.yml.erb'

alias cls='clear'

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
