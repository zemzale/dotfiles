if status is-interactive
    fish_vi_key_bindings
    export GOPATH=$HOME/go
    fish_add_path /usr/local/go/bin $GOPATH/bin $HOME/.local/bin $HOME/.local/share/node/bin $HOME/Library/Python/3.11/bin $HOME/.cargo/bin $HOME/Android/Sdk/platform-tools $HOME/.local/opt/zig

    alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
    alias bat='bat --style=changes,header --theme=tokyonight'
    alias cat='bat'

    alias ls='eza --group-directories-first'
    alias l "ls -la"

    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{.git,node_modules}"'
    export GPG_TTY=(tty)
    export EDITOR=nvim

    starship init fish | source
    #thefuck --alias | source


    alias dcd "docker compose down"
    alias dcu "docker compose up -d"
    alias dcl "docker compose logs -f"

    set --universal nvm_default_version v20.6.1
end


# pnpm
set -gx PNPM_HOME "/home/azemzale/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
alias claude="/home/azemzale/.claude/local/claude"

# opencode
fish_add_path /home/azemzale/.opencode/bin
