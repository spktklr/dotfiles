# Take ownership
sudo chown -R $USER /usr/local/

# Get rid of unwanted Python
#sudo rm -rf /Library/Frameworks/Python.framework

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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
  cmake
  #graphicsmagick
  #webkit2png
  #rename
  #zopfli
  #ffmpeg
  python
  #sshfs
  #trash
  #node
  #tree
  ack
  #hub
  git
  mackup
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

# Apps
brew install caskroom/cask/brew-cask

apps=(
  adobe-creative-cloud
  alfred
  dropbox
  google-chrome
  #qlcolorcode
  #karabiner
  #screenflick
  slack
  seil
  #transmit
  #appcleaner
  firefox
  #hazel
  #qlmarkdown
  #seil
  #spotify
  vagrant
  vagrant-manager
  #arq
  #flash
  iterm2
  #qlprettypatch
  #shiori
  #sublime-text3
  virtualbox
  #atom
  #flux
  #mailbox
  #qlstephen
  #sketch
  #tower
  vlc
  #cloudup
  #nvalt
  #quicklook-json
  skype
  #transmission
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Link Alfred
brew cask alfred link

# Fonts
brew tap caskroom/fonts

fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# Install fonts
echo "Installing fonts..."
brew cask install ${fonts[@]}

# Setup
sh "scripts/osx-for-hackers.sh"

echo "Installing YouCompleteMe"
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_support_libs --config Release
echo "YouCompleteMe install successful."

echo "Done. Remember to login to Dropbox and run 'mackup restore' for settings. Disabling Caps Lock in Keyboard settings may be necessary."

