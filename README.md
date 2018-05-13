# chloesoe's vim configuration 
The vim configuration including .vimrc and Vundle.vim with plugins included in .vimrc you could get with this steps
```
git clone git@github.com:chloesoe/vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/ 
cd ~/.vim/ 
git submodule init 
git submodule update 
vim +PluginInstall +qall
```
