#!/bin/bash
source common-functions.sh
header "Configure settings using \`kcmshell6\`"
# TODO: Replace guided config with automated configuration using `kwriteconfig6`.

kcm_config "kcm_screenlocker" """\
- Lock screen automatically: never
- Configure Appearance: Change image
"""

kcm_config "kcm_virtualkeyboard" """\
- Set to 'None' to disable on-screen keyboard on touchscreen
"""

kcm_config "kcm_nightlight" """\
- Switching times: Sunset and sunrise at manual location
"""

kcm_config "kcm_users" """\
- Change profile picture
"""

kcm_config "kcm_wallpaper" """\
- Set wallpaper
"""

kcm_config "kcm_updates" """\
- Update software: Automatic
- Update frequency: Daily
"""

kcm_config "kcm_powerdevilprofilesconfig" """\
- On AC Power & On Battery
    - When inactive: Do nothing
    - When laptop lid closed: Do nothing
    - Turn off screen: Never
"""

kcm_config "kcm_baloofile" """\
- Data to index: File names only
- Locations: Add ~/x, ~/y and add them as Indexed
"""

kcm_config "kcm_splashscreen" """\
- Download Kuro the cat
- Select Kuro
"""

kcm_config "kcm_notifications" """\
- Disable login/logout sounds
    - System Notifications > Login/Logout
"""

kcm_config "kcm_keyboard" """\
- Add layout: English (US, alt. intl.)
"""
kcm_config "kcm_mouse" """\
- Adjust pointer speed
"""

kcm_config "kcm_smserver" """\
- On login, launch apps that were open: Start with an empty session
"""

kcm_config "kcm_feedback" """\
- Plasma: Detailed system information and usage statistics
"""


header "Configure apps"
log "Configure tmux"
echo """\
# Add this to ~/.tmux.conf:
set -g mouse on

# Close kwrite to continue
"""
kwrite ~/.tmux.conf

log "Configure nvim"
mkdir ~/.config/nvim
echo """\
# Add this to ~/.config/nvim/init.lua:
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

# Close kwrite to continue
"""
kwrite ~/.config/nvim/init.lua


header "Configure other settings"
echo """\
1. Discover - Software center
    - Open 'discover' > Settings
        - Flatpak: Make Default
        - Disable repos: Pycharm (& Steam)

2. Taskbar
    - Rightclick empty part of taskbar > Show alternatives > 'Icons-and-Text Task Manager'
    - Rightclick on clock > Configure Digital Clock > Time display > 24-Hour
    - Pin apps to taskbar, e.g.:
        - Discover
        - Konsole
        - Dolphin
        - Kwrite
        - Signal
        - Ungoogled Chromium

3. Application launcher
    - Add/remove apps in favorites

4. Dolphin - File manager
    - Add 'syncthing' folder to Places.

5. Tiling
    - Open tiling configuration: <SUPER>+t

6. (Optional) Fix Libreoffice scaling
    In case the scaling of Libreoffice on a second monitor causes issues:
    Rightclick on e.g. Writer app in menu > edit > Environment variables: QT_QPA_PLATFORM=xcb
"""
