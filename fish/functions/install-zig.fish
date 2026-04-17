function install-zig

    set -l target_path $HOME/.local/opt

    set -l zig_version "0.15.2"
    set -l zig_path "$target_path/zig-x86_64-linux-$zig_version"
    set -l zig_download_path https://ziglang.org/download/$zig_version/zig-x86_64-linux-$zig_version.tar.xz

    curl -LO --output-dir $target_path $zig_download_path
    tar xf $zig_path.tar.xz -C $target_path
    rm $zig_path.tar.xz

    rm $target_path/zig
    ln -s $zig_path $target_path/zig

    zig version
end
