#!/bin/env/bash
# Install required program:
sudo dnf install gnome-extensions-app gnome-shell-extension-dash-to-dock \
    mpv gcc-c++ gdb


# Uninstall unused program:
sudo dnf remove \
    gnome-{boxes,calendar,contacts,connections,classic-session} \
    gnome-{initial-setup,logs,maps,tour,weather,shell-extension-background-logo} \
    libreoffice-core open-vpn vpnc fedora-chromium-config nano baobab media-writer totem \
    anaconda-core anaconda-install-env-deps amd-gpu-firmware amd-ucode-firmware \
    abrt brlapi braille-printer-app bluez snapshot ntfs-3g \
    virtualbox-guest-additions qemu-guest-agent \


# Install custom fonts:
sudo cp -r ~/Dots/fedora-workstation-desktop/custom-fonts/ /usr/share/fonts/
sudo fc-cache -fv

# Set gnome-text-editor:
gsettings set org.gnome.TextEditor tab-width 4
gsettings set org.gnome.TextEditor style-scheme 'solarized-dark'
gsettings set org.gnome.TextEditor spellcheck false
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor indent-style 'space'
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.TextEditor custom-font 'FiraCode Nerd Font 11'

# Set gnome-terminal(Ptyxis):
gsettings set org.gnome.Ptyxis audible-bell false
gsettings set org.gnome.Ptyxis use-system-font false
gsettings set org.gnome.Ptyxis font-name 'FiraCode Nerd Font 11'

# Switch off switch-to-application shortcuts:
# Also off "Use keyboard shortcuts to active apps" option 
# in "Behavior" section of "Dash to Dock"
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"; done

# Set static workspace:
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Set "<Super>num" as workspace switcher:
for i in {1..6}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"; done

# Set "<Super><Shift>num" to move apps to workspace:
for i in {1..6}; do gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"; done
