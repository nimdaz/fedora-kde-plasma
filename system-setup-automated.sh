#!/bin/bash
source common-functions.sh

# Configuration
RPMS_INSTALL=(
    'neovim'
    'git-core'
    'inxi'
)

RPMS_REMOVE=(
    'akregator'         # RSS reader
    'dragon'            # Videoplayer, replaced by VLC
    'elisa-player'      # Audioplayer, replaced by VLC
    'kaddressbook'      # Contact manager
    'kmahjongg'         # Mahjongg game
    'kmines'            # Minesweeper game
    'kmail'             # E-mail client
    'korganizer'        # Calendar client
    'kmouth'            # Text-to-speech
    'kolourpaint'       # Image-editor, replaced by Pinta
    'libreoffice-math'  # Math formulas editor
    'neochat'           # Matrix client
)

FLATPAKS_INSTALL=(
    # System & tools

    # General apps
    'org.videolan.VLC'
    'com.spotify.Client'
    'com.github.iwalton3.jellyfin-media-player'
    'org.keepassxc.KeePassXC'
    'org.tenacityaudio.Tenacity'    # Previously Audacity
    'com.github.PintaProject.Pinta' # Paint-like editor
#     'org.gnome.World.PikaBackup'
    'org.kde.ghostwriter'           # Markdown editor
)

FLATPAKS_REMOVE=(
)

# (Un)install packages
prompt_sudo

header "Configure rpm and flatpak repos"
log "Flatpak: Remove fedora repo"
sudo flatpak remote-delete fedora
log "Flatpak: Remove fedora-testing repo"
sudo flatpak remote-delete fedora-testing

header "Install rpms"
log "Installing ${#RPMS_INSTALL[@]} rpm packages:\n${RPMS_INSTALL[@]}\n"
if [[ -n "${RPMS_INSTALL}" ]]
then
    sudo dnf install -y ${RPMS_INSTALL[@]}
fi

header "Remove rpms"
log "Removing ${#RPMS_REMOVE[@]} rpm packages:\n${RPMS_REMOVE[@]}\n"
if [[ -n "${RPMS_REMOVE}" ]]
then
    sudo dnf remove -y ${RPMS_REMOVE[@]}
fi

header "Install flatpaks from flathub"
log "Installing ${#FLATPAKS_INSTALL[@]} flatpaks:\n${FLATPAKS_INSTALL[@]}\n"
if [[ -n "${FLATPAKS_INSTALL}" ]]
then
    flatpak install --noninteractive flathub ${FLATPAKS_INSTALL[@]}
fi

header "Remove flatpaks"
log "Removing ${#FLATPAKS_REMOVE[@]} flatpaks:\n${FLATPAKS_REMOVE[@]}\n"
if [[ -n "${FLATPAKS_REMOVE}" ]]
then
    flatpak uninstall --noninteractive ${FLATPAKS_REMOVE[@]}
fi

# Configure
header "Configure KDE"
log "Set theme"
plasma-apply-lookandfeel -a org.kde.breezedark.desktop

log "Configure klipper (clipboard applet)"
kwriteconfig6 --file klipperrc --group=General --key=MaxClipItems 10
kwriteconfig6 --file klipperrc --group=General --key=KeepClipboardContents false


log "Reload plasmashell"
# Restart to activate changed configuration
kquitapp6 plasmashell && kstart plasmashell &



