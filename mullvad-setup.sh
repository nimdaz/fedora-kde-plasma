#!/bin/bash
# Required: Mullvad account number
source common-functions.sh

prompt_sudo

header "Install Mullvad VPN & Browser"
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf install -y mullvad-vpn mullvad-browser

# List-devices throws an error if the account is not logged in.
mullvad account list-devices > /dev/null 2>&1
if [[ $? != 0 ]]
then
    header "Login"
    read -p 'Mullvad account number: ' account_number
    mullvad account login ${account_number}
fi

header "Account info"
mullvad account get

header "Update settings"
mullvad lan set allow
