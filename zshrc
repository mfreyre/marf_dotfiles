# general settings
stty -ixon
[[ ":$PATH:" != *":$HOME/.bin:"* ]] && export PATH="$PATH:$HOME/.bin"
export PAGER="less"
export LESS="-R"
export EDITOR="vim"
export KEYTIMEOUT=1

# aliases
alias ll="ls -lh"
alias lla="ls -lAh"
alias cdr='cd $(git rev-parse --show-toplevel 2>/dev/null)'
alias esfix="npx eslint --fix"

# git aliases
alias gcm="git commit -m"
alias gap="git add -p"
alias gists="git diff --staged | gist -t diff"
alias gcan="git commit --amend --no-edit"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias review='git_switch_push() { git switch -c $(date +%Y%m%d)-$1 && git push --set-upstream origin $(date +%Y%m%d)-$1; }; git_switch_push'


# key-bindings
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    ind="${${KEYMAP/vicmd/𝙑𝙄}/(main|viins)/❯❯}"
    zle reset-prompt
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  function zle-keymap-select() {
    ind="${${KEYMAP/vicmd/𝙑𝙄}/(main|viins)/❯❯}"
    zle reset-prompt
  }
  zle -N zle-line-init
  zle -N zle-line-finish
  zle -N zle-keymap-select
fi

bindkey -v
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^?" backward-delete-char
bindkey "^h" backward-delete-char

if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# history
[[ -z "$HISTFILE" ]] && export HISTFILE=$HOME/.zsh_history
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# third-party files
if [[ $- == *i* ]] ; then
  source "$HOME/.zsh/oh-my-zsh/completion.zsh"
  source "$HOME/.zsh/oh-my-zsh/git.zsh"
  source "$HOME/.zsh/oh-my-zsh/themes-and-appearance.zsh"

  # must be sourced at the end
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# theme
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit && compinit

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm (fast node manager)
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init - zsh)"
fi

# direnv
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
