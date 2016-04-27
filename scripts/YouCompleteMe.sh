echo "Performing YouCompleteMe setup"
cd ~
rm -rf ycm_build
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
cd /Users/niko/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm i --production
echo "Done."
