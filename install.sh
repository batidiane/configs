#/bin/bash

# Oh-my-zsh
echo 'Linking oh-my-zsh files'

if [ ! -d "$HOME/.oh-my-zsh" ] ; then
  cd "$HOME"
  git clone "https://github.com/robbyrussell/oh-my-zsh.git" ".oh-my-zsh"
fi

ln -s $PWD/oh-my-zsh/pmontagnier.zshenv.zsh $HOME/.oh-my-zsh/custom/pmontagnier.zshenv.zsh
ln -s $PWD/oh-my-zsh/pmontagnier.zshrc.zsh $HOME/.oh-my-zsh/custom/pmontagnier.zshrc.zsh
ln -s $PWD/oh-my-zsh/pmontagnier.zsh-theme $HOME/.oh-my-zsh/themes/pmontagnier.zsh-theme
ln -s $PWD/oh-my-zsh/.zshrc $HOME/.zshrc

# Dotfiles
echo 'Linking dotfiles'

ln -s $PWD/dotfiles/.bash_aliases $HOME/.bash_aliases
ln -s $PWD/dotfiles/.bash_profile $HOME/.bash_profile
ln -s $PWD/dotfiles/.bashrc $HOME/.bashrc
ln -s $PWD/dotfiles/.hgrc $HOME/.hgrc
ln -s $PWD/dotfiles/.screenrc $HOME/.screenrc
ln -s $PWD/dotfiles/.vimrc $HOME/.vimrc
ln -s $PWD/dotfiles/.gdbinit $HOME/.gdbinit
ln -s $PWD/dotfiles/.gitconfig $HOME/.gitconfig

if [ ! -d "$HOME/.config/terminator/" ] ; then
  mkdir -p "$HOME/.config/terminator"
fi
ln -s $PWD/dotfiles/terminator_config $HOME/.config/terminator/config

if [ ! -d "$HOME/.config/htop/" ] ; then
  mkdir -p "$HOME/.config/htop"
fi
ln -s $PWD/dotfiles/htoprc $HOME/.config/htop/htoprc

# vim bundles
echo 'Installing VIM bundles'

if [ ! -d "$HOME/.vim/bundle/" ] ; then
  mkdir -p "$HOME/.vim/bundle"
fi
cd "$HOME/.vim/bundle/"

if [ ! -d "$HOME/.vim/bundle/vundle/" ] ; then
  git clone "https://github.com/gmarik/vundle.git"
fi

if [ ! -d "$HOME/.vim/bundle/vim-gitgutter/" ] ; then
  git clone "https://github.com/airblade/vim-gitgutter.git"
fi

if [ ! -d "$HOME/.vim/bundle/nerdtree/" ] ; then
  git clone "https://github.com/scrooloose/nerdtree.git"
fi

if [ ! -d "$HOME/.vim/bundle/powerline/" ] ; then
  git clone "https://github.com/Lokaltog/powerline.git"
fi

# Awesome configuration
echo 'Installing Awesome WM Configuration'

if [ ! -d "$HOME/.config/awesome/" ] ; then
  mkdir -p "$HOME/.config/awesome/"
fi

ln -s $PWD/awesome-scripts/battery.lua $HOME/.config/awesome/battery.lua
ln -s $PWD/awesome-scripts/volume.lua $HOME/.config/awesome/volume.lua
ln -s $PWD/awesome-scripts/rc.lua $HOME/.config/awesome/rc.lua

if [ ! -d "$HOME/.config/awesome/vicious/" ] ; then
  git clone "https://github.com/Mic92/vicious.git"
fi

# Fonts
if [ ! -d "$HOME/.config/fontconfig/" ] ; then
  mkdir -p "$HOME/.config/fontconfig"
fi
ln -s $PWD/dotfiles/.fonts.conf $HOME/.config/fontconfig/fonts.conf

# Locale generation
LOCALE_CMD="sudo cp ./locales/locale.gen /etc/locale.gen && locale-gen"
echo "Executing command: \"$LOCALE_CMD\""
$(LOCALE_CMD)

echo "Done"
exit 0
