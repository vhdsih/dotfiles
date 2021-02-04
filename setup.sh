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

# polybar
if [ -d ~/.config/polybar ]
then
    mv ~/.config/polybar ~/.config/polybar.me.old
fi

# i3
if [ -d ~/.config/i3 ]
then
    mv ~/.config/i3 ~/.config/i3.me.old
fi

# kitty
if [ -d ~/.config/kitty ]
then
    mv ~/.config/kitty ~/.config/kitty.me.old
fi


rm -rf ~/.zshrc
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/.i3
rm -rf ~/.config/polybar
rm -rf ~/.config/terminator
rm -rf ~/.config/i3
rm -rf ~/.config/kitty

ln -sfn ~/.me/zsh/_zshrc ~/.zshrc
ln -sfn ~/.me/vim/vim ~/.vim
ln -sfn ~/.me/vim/_vimrc ~/.vimrc
ln -sfn ~/.me/tmux/tmux ~/.tmux
ln -sfn ~/.me/tmux/tmux.conf ~/.tmux.conf
ln -sfn ~/.me/terminator ~/.config/terminator
ln -sfn ~/.me/polybar ~/.config/polybar
ln -sfn ~/.me/i3wm ~/.config/i3
ln -sfn ~/.me/kitty ~/.config/kitty

cd ~/.me

git submodule init
git submodule update

cd ~/.me/polybar
cp -r fonts/* ~/.local/share/fonts
fc-cache -v
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
