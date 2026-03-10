# marf dotfiles

My personal configuration files for macOS. Includes setup for zsh, vim, tmux, git, VS Code, Karabiner-Elements, and code formatting tools.

## What's Included

| File/Folder | What It Configures |
|---|---|
| `zshrc` | Zsh shell — aliases, key bindings, prompt theme, history, nvm auto-switching |
| `vimrc` | Vim — plugins (via vim-plug), key mappings, linting (ALE), theme (seoul256) |
| `tmux.conf` | Tmux — prefix key (`Ctrl+Space`), pane/window bindings, status bar |
| `gitconfig` | Git — aliases (`st`, `co`, `br`, `rpull`), credential helper, editor |
| `gitignore` | Global git ignores — swap files, `.DS_Store`, vim sessions |
| `karabiner.json` | Karabiner-Elements — Caps Lock acts as Ctrl (Escape if tapped alone) |
| `eslintrc.json` | ESLint — JS/React linting with Prettier integration |
| `prettierrc` | Prettier — formatting rules (80 chars, 2-space tabs, trailing commas) |
| `vscode/settings.json` | VS Code — format on save, Prettier as default formatter |
| `packages/homebrew` | List of Homebrew packages to install |
| `packages/npm` | List of global npm packages to install |
| `bin/` | Custom scripts (e.g. tmux window status formatter) |
| `zsh/` | Zsh plugins — oh-my-zsh completions/git/themes, zsh-syntax-highlighting |
| `agignore` | Silver Searcher ignore rules |

## Setup

### 1. Clone the repo

```sh
git clone https://github.com/mfreyre/marf_dotfiles.git ~/marf_dotfiles
```

### 2. Symlink config files

Each file needs to be symlinked to your home directory with a `.` prefix:

```sh
# Shell
ln -sf ~/marf_dotfiles/zshrc ~/.zshrc
ln -sf ~/marf_dotfiles/gitconfig ~/.gitconfig
ln -sf ~/marf_dotfiles/gitignore ~/.gitignore

# Vim
ln -sf ~/marf_dotfiles/vimrc ~/.vimrc

# Tmux
ln -sf ~/marf_dotfiles/tmux.conf ~/.tmux.conf

# Code formatting
ln -sf ~/marf_dotfiles/eslintrc.json ~/.eslintrc.json
ln -sf ~/marf_dotfiles/prettierrc ~/.prettierrc
ln -sf ~/marf_dotfiles/agignore ~/.agignore

# Custom scripts
ln -sf ~/marf_dotfiles/bin/format-tmux-window-status ~/.bin/format-tmux-window-status
```

### 3. Set up zsh plugins

```sh
mkdir -p ~/.zsh/oh-my-zsh ~/.zsh/zsh-syntax-highlighting

ln -sf ~/marf_dotfiles/zsh/oh-my-zsh/completion.zsh ~/.zsh/oh-my-zsh/completion.zsh
ln -sf ~/marf_dotfiles/zsh/oh-my-zsh/git.zsh ~/.zsh/oh-my-zsh/git.zsh
ln -sf ~/marf_dotfiles/zsh/oh-my-zsh/themes-and-appearance.zsh ~/.zsh/oh-my-zsh/themes-and-appearance.zsh
ln -sf ~/marf_dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### 4. Install Homebrew packages

```sh
xargs brew install < ~/marf_dotfiles/packages/homebrew
```

### 5. Install global npm packages

```sh
xargs npm install -g < ~/marf_dotfiles/packages/npm
```

### 6. Install Vim plugins

Install [vim-plug](https://github.com/junegunn/vim-plug):

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then open Vim and run `:PlugInstall`.

### 7. Karabiner-Elements (optional)

Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/), then copy or symlink the config:

```sh
mkdir -p ~/.config/karabiner
ln -sf ~/marf_dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
```

### 8. VS Code (optional)

Copy or symlink the settings:

```sh
# macOS
ln -sf ~/marf_dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

## Key Shortcuts

### Zsh
- Vi mode enabled (`bindkey -v`)
- `Ctrl+F` / `Ctrl+B` — forward/backward word
- `Ctrl+A` / `Ctrl+E` — beginning/end of line

### Vim
- Leader key: `Space`
- `Space+d` — fuzzy find git files (fzf)
- `Space+l` — fuzzy find lines
- `Space+x` — toggle comment
- `Space+a` — toggle ALE linting
- `Ctrl+J` / `Ctrl+K` — previous/next buffer

### Tmux
- Prefix: `Ctrl+Space`
- `Prefix+|` — vertical split
- `Prefix+-` — horizontal split
- `Prefix+h/j/k/l` — navigate panes
- `Prefix+H/J/K/L` — resize panes

## License

MIT
