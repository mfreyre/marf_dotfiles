#!/bin/bash
set -e

DOTFILES="$HOME/marf_dotfiles"

echo "==> Symlinking dotfiles"

# Shell & git
ln -sf "$DOTFILES/zshrc" ~/.zshrc
ln -sf "$DOTFILES/gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/gitignore" ~/.gitignore

# Editors
ln -sf "$DOTFILES/vimrc" ~/.vimrc

# Tmux
ln -sf "$DOTFILES/tmux.conf" ~/.tmux.conf

# Code formatting
ln -sf "$DOTFILES/eslintrc.json" ~/.eslintrc.json
ln -sf "$DOTFILES/prettierrc" ~/.prettierrc
ln -sf "$DOTFILES/agignore" ~/.agignore

# Custom scripts
mkdir -p ~/.bin
ln -sf "$DOTFILES/bin/format-tmux-window-status" ~/.bin/format-tmux-window-status

# Zsh plugins
mkdir -p ~/.zsh/oh-my-zsh ~/.zsh/zsh-syntax-highlighting
ln -sf "$DOTFILES/zsh/oh-my-zsh/completion.zsh" ~/.zsh/oh-my-zsh/completion.zsh
ln -sf "$DOTFILES/zsh/oh-my-zsh/git.zsh" ~/.zsh/oh-my-zsh/git.zsh
ln -sf "$DOTFILES/zsh/oh-my-zsh/themes-and-appearance.zsh" ~/.zsh/oh-my-zsh/themes-and-appearance.zsh
ln -sf "$DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echo "==> Installing Homebrew packages"
xargs brew install < "$DOTFILES/packages/homebrew"

echo "==> Installing global npm packages"
xargs npm install -g < "$DOTFILES/packages/npm"

echo "==> Installing vim-plug"
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "    Run :PlugInstall in Vim to install plugins"
else
  echo "    vim-plug already installed"
fi

# Karabiner (optional)
if [ -d "/Applications/Karabiner-Elements.app" ]; then
  echo "==> Symlinking Karabiner config"
  mkdir -p ~/.config/karabiner
  ln -sf "$DOTFILES/karabiner.json" ~/.config/karabiner/karabiner.json
fi

# VS Code (optional)
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "$VSCODE_DIR" ]; then
  echo "==> Symlinking VS Code settings"
  ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_DIR/settings.json"
fi

echo "==> Done!"
