curl -sfL https://git.io/chezmoi | sh
~/bin/chezmoi cd
git clone https://github.com/faishal/dotfiles.git .
git remote add faishal git@github.com:faishal/dotfiles.git
cd
sudo apt-get install unzip
wget https://cache.agilebits.com/dist/1P/op/pkg/v1.8.0/op_linux_386_v1.8.0.zip
unzip -o ~/op_linux_386_v1.8.0.zip
sudo mv op /usr/local/bin/
op --version
op signin my.1password.com saiyedfaishal@gmail.com