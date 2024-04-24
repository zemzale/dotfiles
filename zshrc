# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
eval "$(starship init zsh)"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.local/share/node/bin:$HOME/Library/Python/3.11/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"
# ZSH_THEME="lambda"
# ZSH_THEME="avit"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git web-search colored-man-pages aws zsh-z golang docker docker-compose zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="/usr/local/bin/nvim"
export PAGER="bat"

# Locales
export LC_ALL=en_US.UTF-8

# fzf 
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{.git,node_modules}"'

# zsh VI mode binding
bindkey -v
bindkey "^R" fzf-history-widget
bindkey "^T" fzf-file-widget

# thefuck thing
eval $(thefuck --alias)

alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
unalias l
alias l='eza -la --group-directories-first'
alias ls='eza --group-directories-first'
alias rmd='rm -rf'
alias hlogs='lnav /var/log/httpd/error_log'
alias bat='bat --style=changes,header --theme=gruvbox-dark'
alias cat='bat'

case "$OSTYPE" in
    linux*)
        export CHROME_EXECUTABLE=chromium
    ;;
    darwin*)
        export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
    ;;
esac

# GPG 
export GPG_TTY=$(tty)

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
