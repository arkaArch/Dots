#! /bin/sh

# Start the script from home:
cd $HOME
mkdir ~/.config


# Below setups are similar as 'arch-hyprland-setup'
    # Drivers for intel gpu, 
    # Fonts, 
    # File managers, 
    # Sound and Brightness, 
    # Music & videos
    # Notification
    # Cli tools, firmware updaters
    # Browser
    # Neovim


# Install required xorg packages:
sudo pacman -S xorg xorg-xinit xwallpaper

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



# Themes and icons:
sudo pacman -S lxappearance-gtk3 papirus-icon-theme
mkdir ~/.themes
tar -xf ~/Dots/themes/WhiteSur-Dark.tar.xz -C ~/.themes/

# Open lxappearance and change fonts, themes according to you 


# Link .xintrc
ln -svf ~/Dots/confs/x/.xinitrc ~
ln -svf ~/Dots/confs/x/.Xresources ~
sudo cp ~/Dots/confs/x/40-touchpad.conf /etc/X11/xorg.conf.d
