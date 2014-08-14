#/bin/bash
echo 'Linking oh-my-zsh files'
ln -s $PWD/oh-my-zsh/pmontagnier.zshenv.zsh ~/.oh-my-zsh/custom/pmontagnier.zshenv.zsh
ln -s $PWD/oh-my-zsh/pmontagnier.zshrc.zsh ~/.oh-my-zsh/custom/pmontagnier.zshrc.zsh
ln -s $PWD/oh-my-zsh/pmontagnier.zsh-theme ~/.oh-my-zsh/themes/pmontagnier.zsh-theme

echo 'Linking dotfiles'
ln -s $PWD/oh-my-zsh/.zshrc ~/.zshrc
ln -s $PWD/dotfiles/.bash_aliases ~/.bash_aliases
ln -s $PWD/dotfiles/.bash_profile ~/.bash_profile
ln -s $PWD/dotfiles/.bashrc ~/.bashrc
ln -s $PWD/dotfiles/.hgrc ~/.hgrc
ln -s $PWD/dotfiles/.screenrc ~/.screenrc
ln -s $PWD/dotfiles/.vimrc ~/.vimrc

echo 'Installing VIM bundles'
cd ~/.vim/bundle/
git clone git://github.com/airblade/vim-gitgutter.git

echo "Done"
exit 0
