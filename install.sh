!/bin/bash
sudo apt install zsh
chsh -s $(which zsh)
echo "Cloning plugins code"
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv ~/.oh-my-zsh/plugins/autoswitch_virtualenv
echo "Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
echo "Replace the zsh rc file"
echo ". ~/terminal/.zshrc" > .zshrc