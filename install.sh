!/bin/bash
sudo apt install zsh
chsh -s $(which zsh)
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv ~/.oh-my-zsh/plugins/autoswitch_virtualenv
echo ". ~/terminal/.zshrc" > .zshrc