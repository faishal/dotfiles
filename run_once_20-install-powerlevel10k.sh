#!/bin/sh

echo "Installing zsh";

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

version="801bfbb2946b10527e75e77838a3657d78cb92e5"
destdir="${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"

rm -rf ${destdir}
mkdir -p ${destdir}
curl -s -L https://github.com/romkatv/powerlevel10k/archive/${version}.tar.gz | tar -C ${destdir} --strip-components=1 -xzf -

git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting