if status is-interactive
    fish_vi_key_bindings
    set --global --export GOPATH $HOME/go
    set --global --export PNPM_HOME "/home/azemzale/.local/share/pnpm"
    set --global --export BUN_INSTALL "$HOME/.bun"

    fish_add_path $BUN_INSTALL/bin 
    fish_add_path /usr/local/go/bin 
    fish_add_path $GOPATH/bin 
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.local/share/node/bin
    fish_add_path $HOME/Library/Python/3.11/bin
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/Android/Sdk/platform-tools
    fish_add_path $HOME/.local/opt/zig
    fish_add_path $HOME/.local/opt/odin
    fish_add_path $HOME/.local/share/pnpm
    fish_add_path $HOME/.local/opt/zen 
    fish_add_path /home/azemzale/.opencode/bin

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

    alias killport='function __killport; set -l p (lsof -t -i tcp:$argv[1]); test -n "$p"; and kill -9 $p; or echo "No process on TCP port $argv[1]"; end; __killport'



    alias claude="/home/azemzale/.claude/local/claude"
end


