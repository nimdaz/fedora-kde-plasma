#!/bin/bash
source common-functions.sh

header "Install Signal"
echo "Opening the app will prompt a warning about 'plaintext password store':"
echo "  \"Signal is being launched with the plaintext password store by "
echo "  default due to database corruption bugs when using the encrypted backends."
echo "  This will leave your keys unencrypted on disk as it did in all previous versions.\""
echo
echo "The message also gives you instructions on how to use the experimental encrypted backend."
echo
echo "If you have setup full disk encryption, this will reduce the attack vector."
echo "However, you might want to consider other options to install this more securely."
echo
echo "Secondly, the app required host level access to the filesystem:"
echo "  \"By default, Signal is being launched with the filesystem=host option to allow access to the host filesystem.\""
echo
read -p "Are you sure you want to install the flatpak? (y/n)?" choice
case "$choice" in
  y|Y ) echo; flatpak install --noninteractive flathub org.signal.Signal; echo "Now you can start Signal and link your device.";;
  n|N ) echo "Exiting installation script."; exit 0;;
  * ) echo "Invalid option, choose (y/n)";;
esac
