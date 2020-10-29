#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(xcode-select --version) ]]; then
    echo "Xcode command tools already installed"
  else
    echo "Installing Xcode commandline tools"
    $(xcode-select --install)
  fi
fi

if [[ "$OSTYPE" == "linux"* ]]; then
  cd $HOME;
  sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
  sudo apt-get update
  mkdir -p $HOME/.ssh
  sudo apt-get install -y rcm git curl vim ruby-full build-essential
fi

if [[ $(brew --version) ]] ; then
  echo "Attempting to update Homebrew"
  brew update
  brew upgrade
  brew cask upgrade
else
  echo "Attempting to install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/velocity/.bash_profile
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

brew install gcc
# Begin Homebrew package installation
echo "Effective Homebrew version:"
brew --version

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GNU & additional CLI utilities
brew install moreutils
brew install findutils
brew install gnu-sed

# Install system & networking tools
brew install wget
brew install grep
brew install openssh
brew install p7zip
brew install sslscan
brew install telnet
brew install nmap
# Compilers & Image manipulation
brew install gcc
brew install imagemagick

# Git & friends
brew install git
brew install git-lfs
brew install diff-so-fancy
brew install git-filter-repo

# Ruby, Go, Node & its package managers
brew install rbenv
brew install go
brew install node
brew install yarn

# Extra CLI utilities
brew install bat
brew install youtube-dl

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# GUI Apps (macOS only)
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Attempting to install GUI apps"
  ## Productivity
  brew cask install the-unarchiver
  brew cask install iterm2
  brew cask install gimp
  brew cask install numi
  brew cask install pencil
  brew cask install macpass

  ## Web Browsers
  brew cask install google-chrome
  brew cask install chromedriver
  brew cask install firefox
  brew cask install opera

  ## Cloud Storage Providers
  brew cask install google-backup-and-sync
  brew cask install dropbox

  ## Text Editors
  brew cask install visual-studio-code
  brew cask install atom
  brew cask install sublime-text

  ## Multimedia
  brew cask install vlc
  brew cask install spotify

  ## Work Tools
  brew cask install zoomus
  brew cask install slack

  # Fonts
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
  brew cask install font-cascadia
  brew cask install font-source-code-pro
  brew cask install font-source-sans-pro
  brew cask install font-source-serif-pro
fi

# Development Kit tools
brew install libiconv
brew install pkg-config
brew install cmake
brew install openssl
brew install re2
brew install graphicsmagick
brew install gpg
brew install runit
brew install icu4c
brew install exiftool
brew install automake
brew install direnv
brew install ipinfo
brew install jq
brew install make
brew install pre-commit
brew install pstree
brew install siege
brew install rclone
brew install rsync

# Terraform 
brew install terraform-docs
brew install terragrunt
brew install tfenv
brew install tflint
brew install bflad/tap/tfproviderlint
brew tap orf/brew
brew install deterministic-zip

# Cloud provider tools
brew install aws/tap/aws-sam-cli
brew install awscli
brew install heroku/brew/heroku

# CI tools
brew install circleci
brew install merikan/tools/clair-scanner


# ZSH kits
brew install autojump
brew install zsh
brew install zsh-syntax-highlighting

# Remove outdated versions from the cellar.
brew cleanup
