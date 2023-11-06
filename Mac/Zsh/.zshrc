# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh stuff
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# aliases
alias cls="clear"
alias zshconfig="code ~/.zshrc"
## exa replacing ls
alias ls='exa -l --group-directories-first --color=auto --git --icons --no-permissions --no-user'
alias ll='exa -lahF --group-directories-first --color=auto --git --icons'
## git
alias gf="git fetch"
alias gpl="git pull"
alias lg="lazygit"
## nodejs
alias nrdev="npm run dev"

# vscode default editor
export EDITOR="code"
export GIT_EDITOR="code"
export VISUAL="code"

# powerlevel10k
source /opt/homebrew/Cellar/powerlevel10k/1.19.0/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
alias z="zi"
