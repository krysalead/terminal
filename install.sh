#!/usr/bin/env bash
if [ -z "$1" ]; then
  echo ". ~/terminal/.zshrc" > ~/.zshrc
  echo ". ~/terminal/.profile" > ~/.profile
fi
if [ "$1" == "zsh" ]; then
  sudo apt install zsh
  sudo chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --unattended
  echo "Cloning plugins code"
  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
  git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" ~/.oh-my-zsh/custom/plugins/autoswitch_virtualenv
  sudo touch $ZSH_CACHE_DIR/dotenv-allowed.list
  sudo touch $ZSH_CACHE_DIR/dotenv-disallowed.list
  echo "Replace the zsh rc file"
  echo ". ~/terminal/.zshrc" > ~/.zshrc
fi
if [ "$1" == "kube" ]; then
  echo "Installing kubectl"
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  kubectl version --client
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
  echo "alias ns='kubectl ns'" >> ~/terminal/.profile
  echo "alias ctx='kubectl ctx'" >> ~/terminal/.profile
  echo "alias k='kubectl '" >> ~/terminal/.profile
  echo "alias ingresslogs='kubectl logs -n ingress-nginx -l app=ingress-nginx'" >> ~/terminal/.profile
fi
if [ "$1" == "python" ]; then
  sudo add-apt-repository ppa:deadsnakes/ppa
  sudo apt-get update -y
  sudo apt-get install -y python3.10
  wget https://bootstrap.pypa.io/get-pip.py
  sudo python get-pip.py
  python -m pip install --user virtualenv
  rm get-pip.py
fi
if [ "$1" == "node" ]; then
  echo "installing nodejs"
  sudo apt update
  sudo apt install -y nodejs
  sudo apt install -y npm
  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
  git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv ~/.oh-my-zsh/plugins/autoswitch_virtualenv
fi
if [ "$1" == "acri" ]; then
  git config --global user.name Olivier DAUMAS
  git config --global user.email olivier.daumas@acri-st.fr
  echo "Installing Minio"
  sudo curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    --create-dirs \
    -o /usr/local/bin/mc
  sudo chmod +x /usr/local/bin/mc
  echo "alias mount='f() { mkdir -p ~/\$1;/usr/bin/vmhgfs-fuse .host:/\$1 ~/mnt/\$1 -o subtype=vmhgfs-fuse;cd ~/mnt/\$1 };f'" >> ~/terminal/.profile
  echo "export CI_REGISTRY=gitlabreg.acri-cwa.fr:443" >> ~/terminal/.profile
fi
