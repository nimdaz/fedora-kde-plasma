#!/bin/bash
source common-functions.sh

header "Install ungoogled-chromium"
flatpak install --noninteractive flathub io.github.ungoogled_software.ungoogled_chromium

header "Manual actions"
echo """
1. Create profiles, e.g.: browsing, logins, social, selfhosted
    The steps below should be repeated for each relevant profile"""

echo """
2. Install chomium-web-store:
    - Enable \"Always prompt for installation\" for extension files.
        chrome://flags/#extension-mime-request-handling
    - Download the .crx from Releases, you should be prompted to install the extension.
        https://github.com/NeverDecaf/chromium-web-store/releases/latest
    - Install the Bitwarden extension
        https://chromewebstore.google.com/detail/nngceckbapebfimnlniiiahkandclblb"""

echo """
3. Add bookmarks (for example: import, extention, bookmark-site)"""

echo """
4. Set default search engine
    chrome://settings/search"""

echo """
5. Using a boomarks-site as new tab
    - Set homepage to bookmarks app
         chrome://flags/#custom-ntp
    NOTE:
    If the bookmarks-site requires basic auth, the login cannot be persisted.
    A workaround for this could be including the credential in the URL.
    The stackoverflow post explains how the credentials are send to the server
    as Authentication headers: https://stackoverflow.com/a/57080626
    Although this is done in plain-text, using HTTPS ensures this is sent
    encrypted. However, the password is still readable in the chrome settings.

    Example URL:
    https://<username>:<password>@<bookmarks-website>/"""
