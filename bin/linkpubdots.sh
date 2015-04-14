#!/usr/bin/env bash
#
# Symlinks public dotfiles to user's home directory.
#
# !!Should retrieve files from github automatically!!
# by: Harrison Bannister

set -o nounset
set -o errexit
set -o pipefail

## Variables ##
# important paths
dotrepo="$HOME/data/projects/dotfiles_public/" # dotfiles git repo directory
dotdest="$HOME" # usually the home dir
# array of folders in dotfile repo absolute paths only one dir deep
repofolders=($(find "$dotrepo" -maxdepth 1 -type d ! -name "dotfiles_public" ! -name "." | grep -v .git))
# array of files in dotfile repo absolute paths
dotfiles=($(find "$dotrepo" -maxdepth 1 -type f ! -name "README.md" | grep -v .git/))
###############

## Functions ##
link_folders () {
		cp -sRf "$1" "$dotdest"
		echo "Symlinked ${1##*/} folder to $dotdest/${1##*/}"
}
###############

## Body #######
cd "$dotdest"
echo "Linking folders..."
# creates dotfile destination folder if it doesnt exist
[[ ! -d $dotdest ]] && mkdir -p "$dotdest" && echo "Created dotfile destination folder"

# links all files in folders
for fullfolder in "${repofolders[@]}" ; do
	link_folders "$fullfolder"
done

echo "Linking loose files..."
# links files only in home dir
for fullfile in "${dotfiles[@]}" ; do
	# only links file if there isn't already a symlink
	if [[ ! -h "${fullfile##*/}" ]] ; then
		ln -sf "$fullfile" "$dotdest/"
		echo "Symlinked ${fullfile##*/} to $dotdest/${fullfile##*/}"
	else
		echo "${fullfile##*/} link exists"
	fi
done

# cleans all dead symlinks in user folder
echo "Cleaning dead links..."
echo "Deleted:"
find "$HOME" -type l -xtype l -print
find "$HOME" -type l -xtype l -delete
###############
