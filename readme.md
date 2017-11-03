# New Mac Setup

Adapted from various sources.

## Do

Install XCode from App Store

open System Preferences, go to the App Store preference pane, and uncheck all the boxes.

press shift-command-H and then command-J, which will bring up a window that configures Finder view options. Check the “Show Library Folder” and close the window. Thanks to the Apple engineers that made this process more user-friendly.

we’ll want to change it so that certain Homebrew installations (e.g., Python) will take precedence over stock OS X binaries. To make these changes, open ~/.bash_profile …

vim ~/.bash_profile
… and add:

```
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
```

Since the above directives will take effect on the next login, let’s go ahead and source the file to ensure it takes effect for the current session:
source ~/.bash_profile

run the following command in the Terminal:
xcode-select --install


## Do more

Run macsetup.sh

Then, add following lines in you .bashrc or .zshrc to wrap brew command:

```
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
```

