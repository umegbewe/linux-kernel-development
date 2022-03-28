#!/bin/bash

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREENS="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

function check() {
# checks if your distribution is ready for kernel development.

if [[ `command -v mutt` ]]; then
  echo "mutt OK"
  echo ""
else
  echo "mutt ${RED}NO${RESETBG}"
  install
fi
}

function install {
echo
read -p "install packages not found?[y/n] "
if [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v apt-get` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Apt package manager detected installing packages........."
	sleep 1
	sudo apt-get update && sudo apt-get install mutt && echo ${RED} "Packages installed!!!"
elif [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v yum` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum package manager detected installing packages........."
	sleep 1
	sudo sudo yum groupinstall "Development Tools" && sudo yum update && sudo yum install mutt && echo ${RED} "Packages installed!!!"
elif [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v dnf` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Dnf package manager detected installing packages........."
	sleep 1
	sudo dnf group install "Development Tools" && sudo dnf install mutt && echo ${RED} "Packages installed!!!"
else echo -ne "${RESETBG}\n${WHITEBG}${BLACK}[${BLACK}!${BLACK}]${BLACK} Thanks for using this tool have a good day and spread the love 💖 ${RESETBG}\n" && exit
fi
echo
}

function setup {
  # create folders & files
  if [[ ! -d "~/.mutt/cache/headers" ]]; then
    mkdir -p ~/.mutt/cache/headers
  fi

  if [[ ! -d "~/.mutt/cache/bodies" ]]; then
    mkdir -p ~/.mutt/cache/bodies
  fi

  if [[ ! -f "~/.mutt/certificates" ]]; then
    touch ~/.mutt/certificates
  fi

  if [[ ! -f "~/.muttrc" ]]; then
    touch ~/.muttrc
  fi

  # Info & configuration
  read -p "Enter your email: " imap_user
  username=${imap_user%@*} #  keep only the username

  read -p "Enter your password: " imap_pass

  # Auto configuration
  read -p "Enter email provider [ gmail / outlook / manual ]: "
  if [[ "$REPLY" == 'gmail' ]]; then
    # ================  IMAP ====================
    spoolfile="imaps://imap.gmail.com/INBOX"
    folder="imaps://imap.gmail.com/"
    record="imaps://imap.gmail.com/[Gmail]/Sent Mail"
    postponed="imaps://imap.gmail.com/[Gmail]/Drafts"
    mbox="imaps://imap.gmail.com/[Gmail]/All Mail"

    # ================  SMTP  ====================
    smtp_url="smtp://$username@smtp.gmail.com:587/"
    smtp_pass=${imap_pass}
    ssl_force_tls='yes' # Require encrypted connection
  elif [[ "$REPLY" == 'outlook' ]]; then
    echo "Sorry! Outlook auto-configuration is not available yet..."
    exit
  elif [[ "$REPLY" == 'manual' ]]; then
    read -p "Enter spoolfile: " spoolfile
    read -p "Enter folder: " folder
    read -p "Enter record: " record
    read -p "Enter postponed: " postponed
    read -p "Enter mbox: " mbox
    read -p "Enter smtp url: " smtp_url
    smtp_pass=${imap_pass}
    ssl_force_tls='yes'
  fi

  # ================  Composition  ====================
  read -p "Enter editor [vim]: " editor
  editor=${editor:-'vim'}
  edit_headers="yes"
  charset="UTF-8"
  read -p "Enter your name: " realname
  from=$imap_user # *** I AM NOT SURE ABOUT THIS ***
  use_from='yes'

  # Text for .muttrc file
  text=(
    "# .muttrc"
    "# ================  IMAP ===================="
    "set imap_user = '$imap_user'"
    "set imap_pass = '$imap_pass'"
    "set spoolfile = $spoolfile"
    "set folder = $folder"
    "set record=\"$record\""
    "set postponed=\"$postponed\""
    "set mbox =\"$mbox\""
    ""
    "# ================  SMTP  ===================="
    "set smtp_url = \"$smtp_url\""
    "set smtp_pass = '$imap_pass'"
    "set ssl_force_tls = $ssl_force_tls # Require encrypted connection"
    ""
    "# ================  Composition  ===================="
    "set editor = $editor"
    "set edit_headers = $edit_headers  # See the headers when editing"
    "set charset = $charset     # value of $LANG; also fallback for send_charset"
    "# Sender, email address, and sign-off line must match"
    "unset use_domain        # because joe@localhost is just embarrassing"
    "set realname = \"$realname\""
    "set from = \"$from\""
    "set use_from = $use_from"
    )
    printf '%s\n' "${text[@]}" > ~/.muttrc
    printf "~/.muttrc file is ready"
    echo -ne "${RESETBG}\n${WHITEBG}${BLACK}[${BLACK}!${BLACK}]${BLACK} Thanks for using this tool have a good day and spread the love 💖 ${RESETBG}\n"
}

check
setup
