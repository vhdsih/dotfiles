#!/bin/bash

echo hi, waiting for updating ...

# zshrc
if [ -f ~/.zshrc ]
then
    mv ~/.zshrc ~/.zshrc.me.old
fi

# vim
if [ -d ~/.vim ]
then
    mv ~/.vim ~/.vim.me.old
fi

# vimrc
if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.me.old
fi

# tmux
if [ -d ~/.tmux ]
then
    mv ~/.tmux ~/.tmux.me.old
fi

#tmux.conf
if [ -f ~/.tmux.conf ]
then
    mv ~/.tmux.conf ~/.tmux.conf.me.old
fi



rm -rf ~/.zshrc
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.tmux
rm -rf ~/.tmux.conf

ln -sfn ~/.me/zsh/_zshrc ~/.zshrc
ln -sfn ~/.me/vim/vim ~/.vim
ln -sfn ~/.me/vim/_vimrc ~/.vimrc
ln -sfn ~/.me/tmux/tmux ~/.tmux
ln -sfn ~/.me/tmux/tmux.conf ~/.tmux.conf

cd ~/.me

git submodule init
git submodule update
