Simon's vim config
==================

Setting it up:

Firstly clone the repo:

```bash
git clone https://github.com/simon2k/.vim.git ~/.vim
```

Secondly link the vimrc file:

```bash
ln -s ~/.vim/vimrc ~/.vimrc
```

Clone Vundle for managing plugins within vim:

```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open vim and run command for installing all the plugins:

```vim
:BundleInstall
```

Enjoy!
