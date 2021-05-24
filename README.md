# Dotfiles

Combo Alacritty + Nvim + Tmux + Zsh + Starship -> Sem legaduras
Combo Kitty + Nvim + Tmux + Zsh + Starship -> Com legaduras

## Terminais
* Alacritty - Terminal minimo
* Kitty - Terminal completo

## Configurações
* Tmux - Multiplexador e uso pra controlar a sessão e as abas
* NVIM - Editor
* ZSH - Auto complete e plugins para o terminal
* Starship - Visual do Prompt

## Adicionais que precisam ser instalados
* Bat
* Exa
* NerdFonts
* Pyenv

## Linguagens e Ferramentas
* Gcloud
* Python
* Dart/Flutter


# Instalação do Arch Linux

* Verificar o bootmode se o comando abaixo der erro é por que está no UEFI mode
Pode ser que essa pasta não exista ai o computador não tem suporte a UEFI
```
ls /sys/firmware/efi/efivars
```
* Particionar o disco
```
fdisk -l #lista discos
fdisk /dev/sda # ou o disco que vc quer particionar
exemplo de criação com comandos para o /boot
- n
- 1
- 2048
- +200M

# Pra criar uma partição existente como swap
- t
- 2 # numero da partição
- 19 # Código do swap

# Bootloader
- t
- 1
- 1 # EFI Filesystem ou 4 bios boot
```

* Formatar partições
```
mkfs.ext4 /dev/sda1

# Swap
mkswap /dev/sda2
swapon /dev/sda2
```

* Instalar dostools
```
pacman -S dosfstools
```

* Formatar a partição do boot
```
mkfs.fat -F 32 /dev/sda1
# Pode ser BIOS boot ou EFI que é a opção 1
```

* Montar o filesystem
```
mount /dev/root_partition /mnt
```

* Criar pastas de boot e home
```
mkdir /mnt/home
mkdir /mnt/boot/ # caso EFI tem que ser /mnt/boot/EFI
```

* Montar o filesystem
```
mount /dev/mount-boot /mnt/boot
mount /dev/mount-home /mnt/home
```

* instalar os pacotes básicos
```
pacstrap /mnt base base-devel linux linux-firmware
```

* Gerar o fstab
```
genfstab -U /mnt >> /mnt/etc/fstab
```

* Mudar a montagem pra root
```
arch-chroot /mnt
```

* Setar hora local
```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
```

* Instalar o neovim
```
pacman -Sy neovim
```

* Editar o arquivo /etc/locale.gen e descomentar o en-UTF8
```
# depois gerar os arquivos
locale-gen
```

* Criar arquivo /etc/locale.conf e add a linguagem padrão do sistema
```
LANG=en_US.UTF-8
```

* Add o hostname em /etc/hostname

* Editar o /etc/hosts
```
/etc/hosts

127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```
* Definir senha do root

```
passwd
```
* Add user
```
useradd -m -g users -G wheel,audio,video,storage nome_desejado_para_o_usuario
```

* Add no /etc/sudoers
```
myuser ALL=(ALL) ALL
```

* INstalar pacotes adicionais (pra wifi continuar funcionando no pos instalação)
```
pacman -S dosfstools os-prober mtools network-manager-applet networkmanager wpa_supplicant wireless_tools dialog sudo
```

* Instalar o GRUB
```
pacman -S grub os-prober

# MBR

grub-install --target=i386-pc --recheck /dev/sda

# EFI
pacman -S efibootmgr
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

CONFIG
grub-mkconfig -o /boot/grub/grub.cfg

```
* Hábilitar o network manager
```
systemctl enable NetworkManager
```

* Instalar o básico pra usar o Xmonad
```
sudo pacman -Syy xorg xorg-xinit xf86-video-fbdev(ou sua placa de video) nitrogen picom firefox neovim ranger rxvt-unicode
sudo pacman -Syy lightdm lightdm-gtk-greeter xmonad xmonad-contrib xmobar dmenu kitty
```
* Configurar o .xinitrc copiando o exemplo do xorg pra sua home
```
cp /etc/X11/xinit/xinitrc .xinitrc
```

* Adicionar o arquivo o start do nitrogen do picom e do xmonad
```
# Remover
twm &
...
exec xterm -geometry 80x66+0+0 -name login

#Adicionar
nitrogen --restore &
picom &
exec xmonad
```
* Testar a inicialização
```
startx
```

* Copiar os arquivos de configuração do xmonad e do xmobar
```
# criar diretório .xmonad
# criar diretório .config/xmobar

```
* Habilitar o lightdm
```
sudo systemctl enable lightdm
```
