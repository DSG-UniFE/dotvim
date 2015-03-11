#!/bin/bash

RBENV_VERSION_SAVED=$RBENV_VERSION

# redirect all output to ~/.vim_ruby_versions_paths
exec > ~/.vim_ruby_version_paths

echo 'let g:ruby_version_paths = {'

for rv in `rbenv versions --bare`
do
    echo -n "  \\ '$rv': "
    RBENV_VERSION=$rv # set ruby version through shell
    ruby -e 'print $:' 2>/dev/null
    echo ","
done

echo '\ }'

RBENV_VERSION=$RBENV_VERSION_SAVED # you never know...
