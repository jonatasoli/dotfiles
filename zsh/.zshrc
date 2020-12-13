# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# starship
eval "$(starship init zsh)"

# Path to your oh-my-zsh installation.
export ZSH="/Users/jonatasdev/.oh-my-zsh"


# Uncomment the following line to display red dots whilst waiting for completion.
 # COMPLETION_WAITING_DOTS="true"

 # PLUGINS
plugins=(
    git
    git-extras
    git-flow
    git-auto-fetch
    brew
    osx
    pip
    python
    docker
    zsh-syntax-highlighting
    zsh-autosuggestions 
    bgnotify
    colored-man-pages
    dash # Open dash in terminal
    flutter
    tmux
    zsh-interactive-cd
    kubectl
    )

# Add vi-mode
# export RPS1="%{$reset_color%}"

# KUBECTL completion
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8


# Compilation flags
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# ENVs AND CONFIGs
export DOCKER_CONFIG="True"
export PARTYOU_CONFIG="docker_config_local_no_pass"

export WORKON_HOME=~/.ve
export PROJECT_HOME=~/workspace
export PATH=$PATH:$HOME/.pyenv/bin:$HOME/.istio/bin:$HOME/.local/bin
eval "$(pyenv init -)"


export PATH="$(yarn global bin):$PATH"
export PATH="$PATH:`pwd`/flutter/bin"

# iF you need to have icu4c first in your PATH run:
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# For compilers to find icu4c you may need to set:
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

# ==> krb5
# krb5 is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have krb5 first in your PATH run:
export PATH="/usr/local/opt/krb5/bin:$PATH"
export PATH="/usr/local/opt/krb5/sbin:$PATH"

# For compilers to find krb5 you may need to set:
export LDFLAGS="-L/usr/local/opt/krb5/lib"
export CPPFLAGS="-I/usr/local/opt/krb5/include"

# For pkg-config to find krb5 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig"

#export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CPATH=`xcrun --show-sdk-path`/usr/include

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if command -v tmuxinator &> /dev/null && [ -z "$TMUX" ]; then
#     tmuxinator start PROJ || tmuxinator start PROJ
# fi
#

# Defaul Editor
export EDITOR='nvim'

# ALIASES
alias lf='ls -F'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y'
alias notebook='jupyter-notebook'
alias vim='nvim'
alias v='nvim'
alias production='kubectl -n production get pods'
alias staging='kubectl -n staging get pods'
alias nodes='kubectl get nodes'
alias ingress='kubectl -n production get ingress'
alias svc='kubectl -n production get svc'
alias namespace='kubectl get namespaces'
alias ctags="`brew --prefix`/bin/ctags"
alias klogs='kubectl logs -f'
alias k='kubectl'
alias cat='bat'
alias ls='exa'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jonatasdev/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jonatasdev/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jonatasdev/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jonatasdev/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# kitty completion
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
