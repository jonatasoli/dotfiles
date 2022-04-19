### EXPORT ###
#set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths
set fish_greeting                                 # Supresses fish's intro message
set TERM "kitty"                                  # Sets the terminal type
set EDITOR "nvim"                 		  # $EDITOR use NVIM in terminal

### SET DEV CONFIGS
set -x DOCKER_CONFIG "True"
set -x PARTYOU_CONFIG "docker_config_local_no_pass"
### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"


### Vault Dev
set -x VAULT_ADDR "https://vault.dev.partyou.com.br"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# KUBECTL completion
#set $ZSH/oh-my-zsh.sh
#set <(kubectl completion zsh)

# PYENV
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# set -x PATH "/home/rivendell/.pyenv/bin:$PATH"
# status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
status is-login; and pyenv init --path | source
pyenv init - | source

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# YARN
set -x PATH "$PATH:/home/rivendell/.config/nvm/versions/node/v16.13.1/bin/yarn"

# VUE
set -x PATH "$PATH:$HOME/.yarn/bin/vue"

# GO
set -x PATH "$PATH:/usr/local/go/bin"

# NPM
set -x PATH "$PATH:/home/rivendell/.nvm/versions/node/v16.13.1/bin/npm"

#RUST
set -x PATH "$PATH:$HOME/.cargo/bin"

#Flutter
set -x PATH "$PATH:/home/rivendell/.flutter/bin/"

#Android
set -x ANDROID_SDK_ROOT "/home/rivendell/Android/Sdk"
set -x CHROME_EXECUTABLE "google-chrome-stable"
set -x PATH "$PATH:$ANDROID_SDK_ROOT/tools/bin"
set -x PATH "$PATH:$ANDROID_SDK_ROOT/platform-tools"
set -x PATH "$PATH:$ANDROID_SDK_ROOT/emulator"
set -x PATH "$PATH:$ANDROID_SDK_ROOT/build-tools"

#Gradle
set -x PATH "$PATH:/opt/gradle/gradle-7.3.3/bin"

#K9S
set -x PATH "$PATH:/home/rivendell/.local/bin:$PATH"

#SONAR SCANNER
set -x PATH "$PATH:/home/rivendell/.sonar-scanner/bin"

#ISTIO
set -x PATH "$PATH:/home/rivendell/.istio/bin"

#JAVA
set -x JAVA_HOME "/home/rivendell/java/jdk/jdk-11.0.2"
set -x PATH "$JAVA_HOME/bin:$PATH"

# PROJECT ENVS
set -x CORNETEIROS_CONFIG_FILE "$HOME/workspace/fabrica-18/corneteiros-api/api/config.json"

### ALIASES ###
alias lf='ls -F'
alias update='sudo pacman -Syyu'
alias notebook='jupyter-notebook'
alias metabase='gcloud compute ssh metabase --zone=southamerica-east1-b'
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
alias video="lspci -k | grep -EA3 'VGA|3D|Display'" 
alias process='ps -aux | sort -k 4 -r | head -n 2' 
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias concourse='kubectl port-forward --namespace default $POD_NAME 8080:8080' 
alias partyou_dev='set -x AWS_PROFILE partyou-dev && kubectl config use-context arn:aws:eks:us-east-1:306775826237:cluster/dev-partyou-cluster'
alias partyou_hml='set -x AWS_PROFILE partyou-hml && kubectl config use-context arn:aws:eks:us-east-1:568731614922:cluster/hml-partyou-cluster'
alias partyou_prod='set -x AWS_PROFILE partyou-prod && kubectl config use-context arn:aws:eks:sa-east-1:443285139252:cluster/prd-partyou-cluster'
alias vpnconnect='openvpn3 session-start --config ~/workspace/client.ovpn'
alias vpndisconnect='openvpn3 session-manage --disconnect --config ~/workspace/client.ovpn'
alias gss="git submodule sync && git submodule update --init --recursive --remote"
alias get_asdf="source /opt/asdf-vm/asdf.fish"
alias use_corneteiros='set -x CORNETEIROS_CONFIG_FILE "$HOME/workspace/fabrica-18/corneteiros-api/api/config.json" && set -x PRODUCTION false'
alias size='du -h --max-depth=1 2> /dev/null | sort -hr | tail -n +2 | head'
### SETTING THE STARSHIP PROMPT ###
starship init fish | source

#keychain
# eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)
#set map
eval (setxkbmap -model abnt -layout us -variant intl)

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rivendell/google-cloud-sdk/path.fish.inc' ]; . '/home/rivendell/google-cloud-sdk/path.fish.inc'; end
