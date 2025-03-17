#!/bin/echo source this file in a bash script:

# Colors copied from: https://stackoverflow.com/a/4332530
# Commented colors are not in use.
# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

log(){
	message=$@
	time=$(date +%T)
	printf -- "[${time}] $message\n"
}

header(){
	message=$@
	time=$(date +%T)
	printf -- "\n${REVERSE}[${time}] ----- $message -----${NORMAL}\n"
}

prompt_sudo(){
	log "Prompting for sudo permissions:"
	sudo /bin/true
}

kcm_config(){
    module=$1
    text=$2
    echo
    log "Configure \`$module\`:"
    printf -- "$text"
    kcmshell6 --highlight $module > /dev/null 2>&1
    read -p "Press enter to start the next part: "
}
