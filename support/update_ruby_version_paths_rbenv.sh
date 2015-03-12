#!/bin/bash

# redirect all output to ~/.vim_ruby_versions_paths
exec > ~/.vim_ruby_version_paths

# get the names of all the installed versions of ruby
VERSIONS=`rbenv versions --bare`
if RBENV_VERSION=system rbenv which ruby &>/dev/null
then
    VERSIONS="$VERSIONS system"
fi

echo 'let g:ruby_version_paths = {'

for rv in $VERSIONS
do
    echo -n "  \\ '$rv': "
    # print load path for version $rv
    RBENV_VERSION=$rv ruby -e 'print $:' 2>/dev/null
    echo ","
done

echo '\ }'
