function pretty_git_log 
    set HASH "%C(always,yellow)%h%C(always,reset)"
    set RELATIVE_TIME "%C(always,green)%ar%C(always,reset)"
    set AUTHOR "%C(always,bold blue)%an%C(always,reset)"
    set REFS "%C(always,red)%d%C(always,reset)"
    set SUBJECT "%s"
    set FORMAT "$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

    git log --pretty="tformat:$FORMAT" $argv |
    column -t -s '{' |
    less -XRS --quit-if-one-screen
end

if status is-interactive
    alias gco "git checkout"
    alias gst "git status"
    alias gd "git diff"
    alias gl "git pull --autostash"
    alias gcb "git switch --create"
    alias gc "git commit"
    alias gc! "git commit --amend"
    alias gc!! "git commit --amend --no-edit"
    alias gcf "git commit --fixup"
    alias grb "git rebase --interactive --autostash --autosquash --rerere-autoupdate"
    alias grbc "git rebase --continue"
    alias grba "git rebase --abort"
    alias glo pretty_git_log
    alias gp "git push"
    alias gpf "git push --force-with-lease"
    alias gm "git merge"
    alias ga "git add --patch"
    alias gf "git fetch --all"
    alias g "git"
    alias gb "git branch"

    alias yeet "git add --patch && git commit --amend --no-edit && git push --force-with-lease"
end 
