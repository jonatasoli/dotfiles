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


### SET AWS CONFIG
set -x AWS_ACCESS_KEY_ID "ASIAUO3KDT464GTBNF7W"
set -x AWS_SECRET_ACCESS_KEY "NwmNyJ3XVxpQFDawwiu6orpl45pcFHdwBlqPIk9C"
set -x AWS_SESSION_TOKEN "IQoJb3JpZ2luX2VjEIz//////////wEaCXVzLWVhc3QtMSJHMEUCIH4P3YnGKt/zO0oJEksaiUfaQbF67B1egoh4tl/RgrWzAiEAtla6r+0opTu2QKjUUCfM0nTyaLXU42zbfjJy3DlWmbQqlAIIFRAAGgwzMDY3NzU4MjYyMzciDJz4hV4mHWziqIfJBSrxAZsJW1X47IIUjmXAYelCN/4cUi2wNmExdNIAvN+K3lcROCxsKtTffD5kq7ohoFRqsNBAOOrV0QNxnd3LaLBsygdHPsPv+YTLygrJupEdGtl684/wV3PDbNJVfK3B5UQAHI6P7LR1Ix8J/uNG8ag3cU7qEAWwaf7wbL0s7PHCWLTjzY5xpftTFj8mwMmTr8AUfsrvm6dg0Ivbmx3IzDeU3ZZJf+K3KF+KVoN12icpFkNjyAfAfasngYIlOzWAWFX3u2LyJ4Nd+iFY4vpx5YzkN835MbBwXDDrlrVqYwGlNsyLfmKx8V/LX/Fy5BvVmw6DvEUwsIXKhAY6nQFgutPX07nYbOmxFJ6nRonLHP4l5qmeTuN0ByI/D528WWYZLca2Oxhffnc9IRa3V0aJYWBD2YmbCL9yZCeTNkx0r05UGU/NMPMhVUT11EJtj4fsAfyDKgKW3V/g1XgIv/duSmw2a1HOWae4VlROXxwhnRN55qqOP9gZqfqaGhzM7CuL6H0c14hMOO08hATj2AF4RpTlHh32tJa4OKsK"

### Vault Dev
set -x VAULT_ADDR "http://54.166.204.210:8200"

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
set -x PATH "/home/jonatas/.pyenv/bin:$PATH"
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# YARN
set -x PATH "$PATH:/home/jonatas/.config/nvm/versions/node/v14.16.0/bin/yarn"

### ALIASES ###
alias lf='ls -F'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y'
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
### SETTING THE STARSHIP PROMPT ###
starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jonatas/workspace/google-cloud-sdk/path.fish.inc' ]; . '/home/jonatas/workspace/google-cloud-sdk/path.fish.inc'; end

#keychain
# eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)
