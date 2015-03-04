#!/bin/bash -e

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

trap "rm -rf ~/.emacs.d/" EXIT

if ! which emacs; then
    sudo apt-get install build-essential wget
    sudo apt-get build-dep emacs23
    wget http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz
    tar -xzf emacs-24.4.tar.gz
    cd emacs-24.4
    make && sudo make install
    sudo apt-get install -qq git mercurial subversion bzr cvs
fi

emacs --batch --load steckemacs.el