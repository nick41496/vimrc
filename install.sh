if [ -d ~/.config/nvim ] ; then
    rm -rf ~/.config/nvim
    ln -s -T ~/.vim ~/.config/nvim
    ln -s -T ~/.vim/.vimrc ~/.config/nvim/init.vim
fi
ln -s ~/.vim/.vimrc ~/.vimrc
mkdir ~/.vimundo
git submodule init
git submodule update
