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


# Look and feel:
sudo pacman -S lxappearance-gtk3
mkdir ~/{.themes,.icons}
tar -xzf ~/Dots/themes/everforest-dark-bordered.tar.gz -C ~/.themes
ln -svf ~/Dots/themes/dwm.css ~/.config/gtk-3.0/gtk.css
unzip ~/Dots/icons/themes/everforest-dark-icons.zip -d ~/.icons
tar -xzf ~/Dots/icons/themes/nordzy-cursors.tar.gz -C ~/.icons

# Link .xintrc
ln -svf ~/Dots/confs/x/.xinitrc ~
ln -svf ~/Dots/confs/x/.Xresources ~
sudo cp ~/Dots/confs/x/40-touchpad.conf /etc/X11/xorg.conf.d
