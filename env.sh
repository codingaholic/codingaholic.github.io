sudo apt-get update -y
sudo apt-get install curl -y
sudo \curl -sSL https://get.rvm.io | bash -s stable
sudo PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
sudo [[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
sudo [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
sudo source ~/.rvm/scripts/rvm
sudo rvm requirements
sudo rvm install 2.0
sudo rvm use 2.0
sudo bundle