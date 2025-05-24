#! /bin/sh

# Start the script from home:
cd $HOME
mkdir ~/.config

# Install required drivers for intel intel gpu:
sudo pacman -S mesa intel-media-driver


# Fonts:
sudo pacman -S noto-fonts-{cjk,emoji,extra}
sudo pacman -S ttf-firacode-nerd ttf-cascadia-code-nerd
ln -svf ~/Dots/confs/fontconfig ~/.config


# Terminal:
sudo pacman -S ghostty
ln -svf ~/Dots/desktop/ghostty ~/.config/


# Install hypr ecosystems:
sudo pacman -S hyprland hyprpaper hypridle hyprlock hyprpolkitagent waybar rofi-wayland
ln -svf ~/Dots/desktop/hypr/ ~/.config/
ln -svf ~/Dots/desktop/waybar/ ~/.config/


# Sound and brightness:
sudo pacman -S pipewire wireplumber pipewire-audio pipewire-pulse pamixer


# File manager:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick unzip unrar wl-clipboard udisks2
sudo pacman -S thunar catfish gvfs tumbler thunar-volman thunar-archive-plugin \
    thunar-media-tags-plugin file-roller poppler-glib gvfs-mtp ffmpegthumbnailer
ln -svf ~/Dots/confs/yazi/ ~/.config/


# Music and video programs:
sudo pacman -S mpd ncmpcpp mpv yt-dlp
ln -svf ~/Dots/confs/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd


# Notification:
sudo pacman -S libnotify dunst
mkdir ~/.local/share
cp -r ~/Dots/icons ~/.local/share
ln -svf ~/Dots/confs/dunst ~/.config


# Browser and torrent:
sudo pacman -S firefox transmission-cli  # Extension: ublock-origin


# Z-Shell with color prompt:
sudo pacman -S exa
sudo pacman -S zsh zsh-{completions,syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dots/desktop/zsh/.zshrc ~/.zshrc


# Cli tools, firmware-updaters:
sudo pacman -S pacman-contrib tree git openssh fwupd fastfetch btop rsync


# vim
sudo pacman -S vim
ln -svf ~/Dots/desktop/vim/.vimrc ~
