# chloesoe's vim configuration 
The vim configuration including .vimrc and Vundle.vim with plug-ins included in .vimrc you could get with this steps

## Install
```
git clone git@github.com:chloesoe/vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/ 
cd ~/.vim/ 
git submodule init 
git submodule update 
vim +PluginInstall +qall
```

## Update
```
vim +PluginUpdate +qall
```
