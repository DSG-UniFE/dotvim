# Mauro Tortonesi's Vim Configuration

This is my [Vim](http://www.vim.org) configuration. I used Tim Pope's awesome
[pathogen](https://github.com/tpope/vim-pathogen) plugin and on git submodules
to create a tidy, extensible, and easily manageable Vim configuration, along
the lines described
[here](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/).


## Installation

### Automated installation procedure

You can automatically install my Zsh configuration using either wget:

    wget --no-check-certificate https://github.com/mtortonesi/dotvim/raw/master/install/install.sh -O - | sh

or curl:

    curl -L https://github.com/mtortonesi/dotvim/raw/master/install/install.sh | sh



### Manual installation procedure

Very, very simple:

    mkdir -p $HOME/.vim/{autoload,bundle}
    wget -O ~/.vim/autoload/pathogen.vim https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim 
    git clone https://github.com/mtortonesi/dotvim.git
    git submodule update --init
    ln -s vimrc ~/.vimrc
    ln -s $(pwd)/bundle/* ~/.vim/bundle

