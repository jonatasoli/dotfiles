#!/bin/bash

rsync -avz ~/.config/alacritty/ ~/workspace/dotfiles/.config/alacritty/
rsync -avz ~/.config/qtile/ ~/workspace/dotfiles/.config/qtile/
rsync -avz ~/.config/kitty/ ~/workspace/dotfiles/.config/kitty/
rsync -avz ~/.config/ranger/ ~/workspace/dotfiles/.config/ranger/
rsync -avz ~/.config/leftwm/ ~/workspace/dotfiles/.config/leftwm/
rsync -avz ~/.config/starship/ ~/workspace/dotfiles/.config/starship/
rsync -avz ~/.config/fish/ ~/workspace/dotfiles/.config/fish/
rsync -avz ~/.config/fisher/ ~/workspace/dotfiles/.config/fisher/
rsync -avz ~/.config/pcmanfm/ ~/workspace/dotfiles/.config/pcmanfm/
rsync -avz ~/.config/picom/ ~/workspace/dotfiles/.config/picom/
rsync -avz ~/.local/bin/ ~/workspace/dotfiles/.local/bin/
rsync -avz ~/.emacs.d/ ~/workspace/dotfiles/emacs.d/
rsync -avz ~/.fonts/ ~/workspace/dotfiles/.fonts/
rsync -avz ~/wallpappers/ ~/Documents/Backup/
