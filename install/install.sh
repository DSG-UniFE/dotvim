#!/bin/bash

# Backup previous configuration
if [ -d ~/.vim ] || [ -f ~/.vimrc ]
then
    echo "You already have a Vim configuration installed."
    BACKUP_DIR="$HOME/vim-config-backup-$(date +%Y%m%d%H%M)"
    echo -n "Trying to back it up in $BACKUP_DIR ... "
    if ! mkdir $BACKUP_DIR; then
        echo -e "failed!\n(Backup directory $BACKUP_DIR already existing?) Exiting. :-("
        exit 1
    fi
    mv ~/.vim   $BACKUP_DIR
    mv ~/.vimrc $BACKUP_DIR
    echo "succeeded!"
fi

# Make directories if needed
mkdir -p $HOME/.vim/{autoload,bundle}

# Download last version of pathogen.vim
echo "Downloading pathogen.vim"
wget -O ~/.vim/autoload/pathogen.vim https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim 

# Backup dotvim if needed
if [ -d dotvim ]
then
    DOTVIM_BACKUP_DIR="dotvim-old-$(date +%Y%m%d%H%M)"
    echo "Directory dotvim already existing. Moving it to $DOTVIM_BACKUP_DIR."
    mv dotvim $DOTVIM_BACKUP_DIR
fi

# Clone configuration from github
echo "Cloning git repository"
git clone https://github.com/mtortonesi/dotvim.git

# Clone all submodules
echo "Initializing git submodules"
cd dotvim
git submodule update --init

# Create symlinks
echo "Creating symlinks"
ln -s vimrc ~/.vimrc
ln -s $(pwd)/bundle/* ~/.vim/bundle

echo "Installation complete!"

