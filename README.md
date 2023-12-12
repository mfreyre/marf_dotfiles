# dotfile setup that i like

This repo contains configuration files for setting up your terminal with a few great tools that should make your life easier.

## Setting it up

### Host

- Clone this repo to your home directory
  - `git clone git@github.etsycorp.com:mfreyre/dotfiles.git`
- Download and install [iTerm2](https://www.iterm2.com/downloads.html)
- Download and install [SMYCK](http://color.smyck.org/)
  - Download and extract zip file
  - Ctrl + click on _colors_, then click _Open_
  - Double click on _Smyck.itermcolors_
- In iTerm2, go to `Preferences > Profiles > Colors > Color Presets` and select _Smyck_

### VM

- Create _zsh_ folders and symlink some things

```
cd ~/
mkdir .zsh
cd .zsh
mkdir oh-my-zsh
mkdir zsh-syntax-highlighting
ln -s ~/dotfiles/zsh/oh-my-zsh/completion.zsh ~/.zsh/oh-my-zsh/completion.zsh
ln -s ~/dotfiles/zsh/oh-my-zsh/git.zsh ~/.zsh/oh-my-zsh/git.zsh
ln -s ~/dotfiles/zsh/oh-my-zsh/themes-and-appearance.zsh ~/.zsh/oh-my-zsh/themes-and-appearance.zsh
ln -s ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ln -s ~/dotfiles/zshrc ~/.zshrc
```

- Install [_vim-plug_](https://github.com/junegunn/vim-plug)
  - Run the following _curl_ command
  - Open _vim_ and run `:PlugInstall`

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Symlink _vimrc_

```
ln -s ~/dotfiles/vimrc ~/.vimrc
```

## What you get

Here are a few examples of the things you get with this setup:

- `cd ~/mydir1/mydir2`
  - check that it’s not case sensitive
  - git branch in the prompt
  - git touch a file to see that a mark shows up in the prompt
  - command highlightingll top-level files and directories need to be symlinked to $HOME/.{name}
