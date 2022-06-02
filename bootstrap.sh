#!/bin/bash

#######################################################################
# This script's purpose to bootstrap your system with the requirements#
# to run the ansible playbook.                                        #
#######################################################################

function set_colors() {
    txtred=$(tput setaf 1) # Red
    txtgrn=$(tput setaf 2) # Green
    txtpur=$(tput setaf 5) # Purple
    txtrst=$(tput sgr0)    # Reset
}

function log() {
    timestamp=$(date +%Y-%m-%d_%H-%M-%S)
    case "$1" in
    i) echo -e "${txtgrn}[$timestamp][INFO] $2${txtrst}" ;;
    w) echo "${txtpur}[$timestamp][WARN] $2${txtrst}" ;;
    e) echo "${txtred}[$timestamp][ERROR] $2${txtrst}" ;;
    *) echo "[$timestamp][==] $2" ;;
    esac
}

function get_os_info() {
    if [ -n "$(command -v lsb_release)" ]; then
        distroname=$(lsb_release -s -d)
    elif [ -f "/etc/os-release" ]; then
        distroname=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
    elif [ -f "/etc/debian_version" ]; then
        distroname="Debian $(cat /etc/debian_version)"
    elif [ -f "/etc/redhat-release" ]; then
        distroname=$(cat /etc/redhat-release)
    else
        distroname="$(uname -s) $(uname -r)"
    fi
}

function install_go_task() {
    echo "test"
}

function fedora_36_desktop_bootstrap() {
    log i "Boostraping dependencies for $distroname."
    log i "The follow dependencies will be installed (if not present).
    ansible
    curl
    task"
    if ! command -v ansible; then
        dnf install -y ansible
    fi
    if ! command -v curl; then
        dnf install -y curl
    fi
    if ! command -v task; then
        # See: https://taskfile.dev/installation/#install-script
        sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
    fi
}

function linux_bootstrap() {
    case "$distroname" in
    "Fedora Linux 36 (Thirty Six)") fedora_36_desktop_bootstrap ;;
    *) log e "Unsupported linux distrobution: $distroname" ;;
    esac
}

function detect_os() {
    get_os_info
    case "$OSTYPE" in
    linux*) linux_bootstrap ;;
    *) log e "Unsupported platform: $OSTYPE" ;;
    esac
}

function main() {
    set_colors
    log i "Please be sure to read over this script before runing!"
    detect_os
}

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi
main
