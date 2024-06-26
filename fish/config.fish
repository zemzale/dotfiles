if status is-interactive
    fish_vi_key_bindings
    export GOPATH=$HOME/go
    fish_add_path /usr/local/go/bin $GOPATH/bin $HOME/.local/bin $HOME/.local/share/node/bin $HOME/Library/Python/3.11/bin $HOME/.cargo/bin

    alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
    alias bat='bat --style=changes,header --theme=tokyonight'
    alias cat='bat'

    alias ls='eza --group-directories-first'
    alias l "ls -la"

    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{.git,node_modules}"'
    export GPG_TTY=(tty)
    export EDITOR=nvim

    starship init fish | source
    thefuck --alias | source

    alias gco "git checkout"
    alias gst "git status"
    alias gd "git diff"
    alias grs "git restore"
    alias grss "git restore --staged"
    alias gl "git pull"
    alias gcb "git switch --create"
    alias gc "git commit"
    alias gc! "git commit --amend"
    alias gc!! "git commit --amend --no-edit"
    alias gcf "git commit --fixup"
    alias grb "git rebase --interactive --autostash --autosquash"
    alias grbc "git rebase --continue"
    alias grba "git rebase --abort"
    alias glo "git log --oneline --decorate"
    alias gp "git push"
    alias gpf "git push --force-with-lease"
    alias gm "git merge"
    alias ga "git add --patch"
    alias gf "git fetch --all"
    alias g "git"

    alias yeet "git add --patch && git commit --amend --no-edit && git push --force-with-lease"

    alias goread "goread --urls_path ~/.config/goread/urls.yml"

    set --universal nvm_default_version v20.6.1
end
