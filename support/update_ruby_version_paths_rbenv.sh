#!/bin/bash

RBENV_VERSION_SAVED=$RBENV_VERSION

# redirect all output to ~/.vim_ruby_versions_paths
exec > ~/.vim_ruby_version_paths

VERSIONS=`rbenv versions --bare`
if RBENV_VERSION=system rbenv which ruby &>/dev/null
then
    VERSIONS="$VERSIONS system"
fi

echo 'let g:ruby_version_paths = {'

for rv in $VERSIONS
do
    echo -n "  \\ '$rv': "
    RBENV_VERSION=$rv # set ruby version through shell
    ruby -e 'print $:' 2>/dev/null
    echo ","
done

echo '\ }'

RBENV_VERSION=$RBENV_VERSION_SAVED # you never know...
