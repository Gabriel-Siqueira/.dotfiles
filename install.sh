i3=true

# install spacemacs and oh-my-zsh
if [ ! -f "~/.spacemacs" ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    rm -f ~/.zshrc
fi

if [ ! -f "~/.spacemacs" ]
then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    rm -f ~/.spacemacs
fi

if [ ! -f "~/.vim/autoload/plug.vim" ]
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

stow -v -R --ignore='.*~undo-tree~.*' -t ~ vim i3 other shell spacemacs

# make scripts executable
for i in ~/bin/*
do
    chmod +x $i
done

# create i3 config file
mkdir -p $HOME/.config/i3
if $i3; then
    echo "Generating i3 config"
    python $PWD/i3config.py
fi
