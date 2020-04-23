# Vim config

## Installation:

    git clone https://github.com/p-ba/vimrc.git ~/.vim
    curl -flo ~/.vim/autoload/plug.vim --create-dirs
    	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p ~/.config/nvim && ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
	mkdir -p ~/.vim/.tmp/undo && mkdir -p ~/.vim/.tmp/swap && mkdir -p ~/.vim/.tmp/backup
    vim +PlugInstall
