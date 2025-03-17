#!/bin/bash
source common-functions.sh

USER=$(whoami)
SYNCTHING_PATH=~/y/NOBACKUP/syncthing

prompt_sudo

header "Install Syncthing for ${USER}"
sudo dnf install -y syncthing
sudo systemctl enable --now syncthing@${USER}.service

header "Configuration - Local settings"
log "Generate and initialize"
syncthing generate --no-default-folder
sudo systemctl restart syncthing@${USER}
echo "Waiting 10 seconds after restart to prevent 'connection refused' errors."
# 1 second is probably enough
sleep 10

header "Set local device settings"
log "Accept anonymous usage reports"
syncthing cli config options uraccepted set 3 # Usage reports

log "Set folder defaults"
mkdir -p ${SYNCTHING_PATH}
syncthing cli config defaults folder ignore-perms set true
syncthing cli config defaults folder order set smallestFirst
syncthing cli config defaults folder path set ${SYNCTHING_PATH}
syncthing cli config defaults folder label set FOLDER-NAME
syncthing cli config defaults folder id set "FOLDER-NAME"

header "Set local device name"
read -p 'Local device name: ' local_device_name
syncthing cli config devices  $(syncthing --device-id) name set ${local_device_name}

header "Add introducer device"
read -p 'Introducer device ID: ' introducer_device_id
read -p 'Introducer device name: ' introducer_device_name
syncthing cli config devices add \
    --device-id ${introducer_device_id} \
    --name ${introducer_device_name} \
    --introducer \
    --auto-accept-folders

header "Manual configuraion"
log "Open the introducer device, accept this device, and select what folders to share."
log "Open http://$(syncthing cli config gui raw-address get) to further configure Syncthing."


