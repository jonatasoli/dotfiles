### EXPORT ###
#set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm"                                  # Sets the terminal type
set EDITOR "nvim"                 		  # $EDITOR use NVIM in terminal

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

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

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Local
set -x PATH "$PATH:$HOME/.local/bin"

#RUST
set -x PATH "$PATH:$HOME/.cargo/bin"

#Deno
set -x DENO_INSTALL "/home/feanor/.deno"
set -x PATH "$PATH:$DENO_INSTALL/bin"

# Applications
set -x PATH "/home/feanor/Applications:$PATH"

### ALIASES ###
alias lf='ls -F'
alias performance='hyperfine'
alias network='sudo bandwhich'
alias update='sudo pacman -Syyu'
alias notebook='jupyter-notebook'
alias vim='nvim'
alias v='nvim'
alias hx='helix'
alias production='kubectl -n production get pods'
alias staging='kubectl -n staging get pods'
alias nodes='kubectl get nodes'
alias ingress='kubectl -n production get ingress'
alias svc='kubectl -n production get svc'
alias namespace='kubectl get namespaces'
alias klogs='kubectl logs -f'
alias k='kubectl'
alias cat='bat'
alias ls='exa'
alias video="lspci -k | grep -EA3 'VGA|3D|Display'" 
alias process='ps -aux | sort -k 4 -r | head -n 2' 
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias gss="git submodule sync && git submodule update --init --recursive --remote"
alias size='du -h --max-depth=1 2> /dev/null | sort -hr | tail -n +2 | head'
alias venv='source .venv/bin/activate.fish'
alias dokku='ssh root@193.203.183.52 -i ~/.ssh/id_rsa'
alias wordops='ssh root@46.202.149.48 -i ~/.ssh/id_rsa'
alias mautic='ssh root@217.196.63.5 -i ~/.ssh/id_ed25519_sk'
alias lmsjonatas='ssh jonatas@217.196.63.5 -i ~/.ssh/id_ed25519_sk'
alias vaporhole='ssh -p 7990 feanor@vaporhole.xyz -i ~/.ssh/id_ed25519_sk'
alias chez='ssh root@217.196.63.161 -i ~/.ssh/id_rsa'
alias chezjonatas='ssh jonatas@217.196.63.161 -i ~/.ssh/id_rsa'
alias prototipos='cd ~/projects/prototype_class/'
alias exemplos='cd ~/workspace/protipos-jogos-curso/'
alias disk='ncdu'

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

# SSH Agent

#set map
# eval (setxkbmap -model abnt -layout us -variant intl)

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Mendelics

set -x CURRENT_UID $(id -u):$(id -g)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/feanor/google-cloud-sdk/path.fish.inc' ]; . '/home/feanor/google-cloud-sdk/path.fish.inc'; end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/feanor/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
