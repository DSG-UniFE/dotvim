# Mauro Tortonesi's Vim Configuration

This is my [Vim](http://www.vim.org) configuration.

I leveraged the awesome [vundle](https://github.com/gmarik/vundle) plugin to
create a tidy, extensible, and easily manageable Vim configuration.


## Installation

To install this configuration in the dotvim directory within the current
directory, you can follow either of the following procedures. (Of course, you
will need to have git installed.)


### Automated procedure (recommended)

The automated procedure will install my Vim configuration in the dotvim
directory inside the current path, backing up any previously existing Vim
configuration.

You can launch the automated installation procedure using either wget:

    wget --no-check-certificate https://raw.github.com/mtortonesi/dotvim/master/install/install.sh -O - | sh

or curl:

    curl -L https://raw.github.com/mtortonesi/dotvim/master/install/install.sh | sh


### Manual procedure

The manual procedure will install my Vim configuration in the dotvim directory
inside the current path, but it will not take care of backing up any previously
existing Vim configuration.

You can manually install my Vim configuration by following these easy steps:

    mkdir -p ~/.vim/bundle
    git clone https://github.com/mtortonesi/dotvim.git
    ln -s dotvim/vimrc ~/.vimrc
    ln -s dotvim/after ~/.vim/after
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
