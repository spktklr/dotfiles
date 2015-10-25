# Let us not forget
read -p "Did you do the steps in macsetup_readme?(y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

  # Switch to z-shell
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

  # Get rid of unwanted Python
  #sudo rm -rf /Library/Frameworks/Python.framework

  # Check for Homebrew,
  # Install if we don't have it
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Take ownership
  sudo chown -R $USER /usr/local/

  # Update homebrew recipes
  brew update

  # Install GNU core utilities (those that come with OS X are outdated)
  brew install coreutils

  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
  brew install findutils

  # Install Bash 4
  brew install bash

  # Install more recent versions of some OS X tools
  brew tap homebrew/dupes
  brew install homebrew/dupes/grep

  #$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

  # Vim
  brew install macvim --with-override-system-vim
  brew linkapps

  binaries=(
  #ffmpeg
  #graphicsmagick
  #hub
  #node
  #rename
  #sshfs
  #trash
  #tree
  #webkit2png
  #zopfli
  ack
  cabextract
  cmake
  git
  mackup
  python
  )

  echo "installing binaries..."
  brew install ${binaries[@]}

  brew cleanup

  # Apps
  brew install caskroom/cask/brew-cask

  apps=(
  #appcleaner
  #arq
  #atom
  #cloudup
  #flash
  #flux
  #hazel
  #karabiner
  #mailbox
  #nvalt
  #qlcolorcode
  #qlmarkdown
  #qlprettypatch
  #qlstephen
  #quicklook-json
  #screenflick
  #seil
  #shiori
  #sketch
  #spotify
  #sublime-text3
  #tower
  #transmission
  #transmit
  adobe-creative-cloud
  alfred
  bettertouchtool
  dropbox
  firefox
  google-chrome
  iterm2
  seil
  skype
  slack
  vagrant
  vagrant-manager
  virtualbox
  vlc
  )

  # Install apps to /Applications
  # Default is: /Users/$user/Applications
  echo "installing apps..."
  brew cask install --appdir="/Applications" ${apps[@]}

  # Link Alfred
  brew cask alfred link

  # Unlink python
  brew unlink python

  # Fonts
  brew tap caskroom/fonts

  fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-source-code-pro
  font-inconsolata
  )

  # Install fonts
  echo "Installing fonts..."
  brew cask install ${fonts[@]}

  # Setup
  sh "scripts/osx-for-hackers.sh"

  cd ~/Downloads
  mkdir consolas
  cd consolas
  curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
  cabextract PowerPointViewer.exe
  cabextract ppviewer.cab
  open CONSOLA*.TTF

  echo "Click Install font."
  echo "Then login to Dropbox and run"
  echo "mackup restore"
  echo "Once restored, run"
  echo "sh YouCompleteMe.sh"

fi
