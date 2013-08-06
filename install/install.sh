#!/bin/bash

echo "Installing Vim configuration in $PWD/dotvim"

# Backup previous configuration
if [ -d ~/.vim ] || [ -f ~/.vimrc ]
then
    echo "You already have an existing Vim configuration."
    BACKUP_DIR="$HOME/vim-config-backup-$(date +%Y%m%d%H%M%S)"
    echo -n "Trying to back it up in $BACKUP_DIR ... "
    if ! mkdir $BACKUP_DIR; then
        echo -e "failed!\n(Backup directory $BACKUP_DIR already existing?) Exiting. :-("
        exit 1
    fi
    mv ~/.vim   $BACKUP_DIR
    mv ~/.vimrc $BACKUP_DIR
    echo "succeeded!"
fi

# Backup dotvim if needed
if [ -d dotvim ]
then
    DOTVIM_BACKUP_DIR="dotvim-old-$(date +%Y%m%d%H%M%S)"
    echo "Directory dotvim already existing. Moving it to $DOTVIM_BACKUP_DIR."
    mv dotvim $DOTVIM_BACKUP_DIR
fi

# Make directories if needed
mkdir -p ~/.vim/bundle

# Clone configuration from github
echo "Cloning git repository"
git clone https://github.com/mtortonesi/dotvim.git

# Create symlinks
echo "Creating symlinks"
ln -s dotvim/vimrc ~/.vimrc
ln -s dotvim/after ~/.vim/after

# Install vundle
echo "Installing vundle"
rm -rf ~/.vim/bundle/vundle # reinstall if already present
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Installing plugins
echo "Installing plugins"
vim +BundleInstall +qall

echo "Installation complete!"
