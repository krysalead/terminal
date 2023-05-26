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
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
python -m pip install --user virtualenv
rm get-pip.py
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update -y
sudo apt-get install -y python3.10
echo "Installing Krew"
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
echo "Installing kubernetes plugins"
kubectl krew install ctx
kubectl krew install ns
echo "Mounting home point"
echo "mount home" >> ~/terminal/.profile
echo "installing nodejs"
sudo apt update
sudo apt install -y nodejs
sudo apt install -y npm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
~
~
~
~
~
~
~
~
~
~
~

~
~
~
~
~
~
~
~
~
~
~

