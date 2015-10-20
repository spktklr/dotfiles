echo "Installing YouCompleteMe"
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_support_libs --config Release
echo "Done. Disabling Caps Lock in Keyboard settings may be necessary."
