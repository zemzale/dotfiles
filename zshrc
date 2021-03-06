# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.local/share/node/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"
# ZSH_THEME="lambda"
ZSH_THEME="avit"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git web-search colored-man-pages aws zsh-z)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="/usr/local/bin/nvim"

# Locales
export LC_ALL=en_US.UTF-8

# fzf 
source ~/git/fzf/shell/key-bindings.zsh
source ~/git/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# zsh VI mode binding
bindkey -v
bindkey "^R" fzf-history-widget
bindkey "^T" fzf-file-widget

# thefuck thing
eval $(thefuck --alias)

alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
unalias l
alias l='exa -la --group-directories-first'
alias ls='exa --group-directories-first'
alias rmd='rm -rf'
alias hlogs='lnav /var/log/httpd/error_log'
alias bat='bat --style=changes,header --theme=gruvbox-dark'

case "$OSTYPE" in
    linux*)
        export CHROME_EXECUTABLE=chromium
    ;;
    darwin*)
        export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
    ;;
esac


FLUTER_COMPLETE=~/.local/share/zsh/functions/Completion/_flutter
if [[ -f "$FLUTER_COMPLETE" ]]; then
    source $FILE 
fi

# GPG 
export GPG_TTY=$(tty)
