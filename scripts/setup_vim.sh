#!/usr/bin/env bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "export VIMINIT='source $HOME/.config/vim/vimrc'" >> ${HOME}/.bashrc
