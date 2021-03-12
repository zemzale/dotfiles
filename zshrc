# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.local/share/node/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/zemzale/.oh-my-zsh"

# ZSH_THEME="agnoster"
# ZSH_THEME="lambda"
ZSH_THEME="avit"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git web-search colored-man-pages laravel aws)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="/usr/local/bin/nvim"

# Locales
export LC_ALL=en_US.UTF-8

# fzf 
source /home/zemzale/git/fzf/shell/key-bindings.zsh
source /home/zemzale/git/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,vendor}"'

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


# kdesrc-build #################################################################

## Add kdesrc-build to PATH
export PATH="$HOME/git/kde/kdesrc-build:$PATH"

## Autocomplete for kdesrc-run
function _comp-kdesrc-run
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  # Complete only the first argument
  if [[ $COMP_CWORD != 1 ]]; then
    return 0
  fi

  # Retrieve build modules through kdesrc-run
  # If the exit status indicates failure, set the wordlist empty to avoid
  # unrelated messages.
  local modules
  if ! modules=$(kdesrc-run --list-installed);
  then
      modules=""
  fi

  # Return completions that match the current word
  COMPREPLY=( $(compgen -W "${modules}" -- "$cur") )

  return 0
}

## Register autocomplete function
complete -o nospace -F _comp-kdesrc-run kdesrc-run
################################################################################
