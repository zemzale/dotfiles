#!/bin/sh

temp_font_zip="/tmp/casscadia_code.zip"
temp_font_dir="/tmp/casscadia_code"
fonts_dir="$HOME/.local/share/fonts"
programms_to_install="neovim tmux python-neovim tldr unzip ripgrep docker docker-compose ctags nmap"

function cleanup() 
{
	rm -rf $temp_font_zip
	rm -rf $temp_font_dir
}

function install_from_repos()
{
	echo "Installing stuff from repos"
	pacaur -S --needed neovim tmux python-neovim tldr unzip
}

function install_fonts()
{
	echo "Pulling cascadia code font"
	pushd /tmp
	curl -LOo $temp_font_zip https://github.com/microsoft/cascadia-code/releases/download/v2005.15/CascadiaCode_2005.15.zip

	unzip $temp_font_zip -d $temp_font_dir

	echo "Creating local share fonts"
	[ -d $fonts_dir ] || mkdir $HOME/.local/share/fonts

	echo "Moving font into where it should be"
	mv "$temp_font_dir/ttf/CascadiaCodePL.ttf" $HOME/.local/share/fonts
	mv "$temp_font_dir/ttf/CascadiaCode.ttf" $HOME/.local/share/fonts
	mv "$temp_font_dir/ttf/CascadiaMonoPL.ttf" $HOME/.local/share/fonts
	mv "$temp_font_dir/ttf/CascadiaMono.ttf" $HOME/.local/share/fonts

	popd

}

trap cleanup EXIT

install_from_repos
install_fonts

