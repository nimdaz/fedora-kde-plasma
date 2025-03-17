#!/bin/bash
source common-functions.sh

header "Install bitwarden"
flatpak install --noninteractive flathub com.bitwarden.desktop
