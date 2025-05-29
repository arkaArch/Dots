#! /bin/sh

# Start the script from home:
cd $HOME
mkdir ~/.config


# Install required drivers for intel intel gpu:
sudo pacman -S mesa intel-media-driver


# Fonts:
sudo pacman -S noto-fonts-{cjk,emoji,extra}
sudo pacman -S ttf-firacode-nerd ttf-cascadia-code-nerd
ln -svf ~/Dots/config/fontconfig ~/.config


# Install required xorg packages and an extra terminal:
sudo pacman -S xorg xorg-xinit xwallpaper kitty
ln -svf ~/Dots/config/kitty ~/.config


# Install required headers for make suckless tools
sudo pacman -S imlib2

# Install suckless programs:
cd Dots/suckless/
tools=("dwm" "st" "dmenu" "dwmblocks" "slock")
for tool in ${tools[@]}; do
    cd $tool
    sudo make clean install
    cd ..
done
cd $HOME


# Sound and brightness:
sudo pacman -S pipewire sof-firmware pipewire-audio pipewire-pulse pamixer brightnessctl


# File manager:
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick unzip unrar udisks2 xclip
sudo pacman -S thunar catfish gvfs tumbler thunar-volman thunar-archive-plugin \
    thunar-media-tags-plugin file-roller poppler-glib gvfs-mtp ffmpegthumbnailer
ln -svf ~/Dots/config/yazi/ ~/.config/


# Music and video programs:
sudo pacman -S mpd ncmpcpp mpv yt-dlp
ln -svf ~/Dots/config/{mpd,ncmpcpp} ~/.config
systemctl --user enable mpd
systemctl --user start mpd


# Notification:
sudo pacman -S libnotify dunst
mkdir -p ~/.local/share
cp -r ~/Dots/icons ~/.local/share
ln -svf ~/Dots/config/dunst ~/.config


# Browser:
sudo pacman -S firefox  # Extension: ublock-origin


# Z-Shell with color prompt:
sudo pacman -S exa
sudo pacman -S zsh zsh-{completions,syntax-highlighting,autosuggestions}
chsh -s $(which zsh)
rm -r ~/.bash*
ln -svf ~/Dots/config/zsh/zshrc ~/.zshrc


# Cli tools, firmware-updaters:
sudo pacman -S pacman-contrib tree git openssh fwupd btop fastfetch
ln -svf ~/Dots/config/fastfetch ~/.config
mkdir -p ~/.config/btop/themes
ln -svf ~/Dots/config/btop-themes/everforest-dark-hard.theme ~/.config/btop/themes


# Link neovim setup:
ln -svf ~/Dots/nvim ~/.config


# Look and feel:
sudo pacman -S lxappearance-gtk3
mkdir ~/{.themes,.icons}
tar -xzf ~/Dots/themes/everforest-dark-bordered.tar.gz -C ~/.themes
ln -svf ~/Dots/themes/dwm.css ~/.config/gtk-3.0/gtk.css
unzip ~/Dots/icons/themes/everforest-dark-icons.zip -d ~/.icons
tar -xzf ~/Dots/icons/themes/nordzy-cursors.tar.gz -C ~/.icons


# Link .xintrc
ln -svf ~/Dots/config/x/.xinitrc ~
ln -svf ~/Dots/config/x/.Xresources ~
sudo cp ~/Dots/config/x/40-touchpad.conf /etc/X11/xorg.conf.d
