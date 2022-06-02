# Aliases
alias vim=nvim
alias vi=nvim
alias v=nvim
alias ls=exa
alias l="exa -alh"
alias tree="exa --tree"
alias cat="bat"
alias c=clear
alias h=helm
alias k=kubectl
alias arec="asciinema rec"
export SUDO_EDITOR=nvim

# History setup
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add go programs to path
PATH=$PATH:$HOME/go/bin

# Enable kubectl autocompletion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Flux bash completion
command -v flux >/dev/null && . <(flux completion zsh)

# Add direnv
eval "$(direnv hook zsh)"

# Enable starship
eval "$(starship init zsh)"

# Enable Zoxide
eval "$(zoxide init zsh)"
