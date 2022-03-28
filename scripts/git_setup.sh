#!/bin/bash

ORANGE="$(printf '\033[33m')" RESETBG="$(printf '\e[0m\n')"

read -p "Enter full name: " name
read -p "Enter email: " email
read -p "Enter SMTP server [gmail]: " smtp
smtp=${smtp:-smtp.gmail.com}
read -p "Enter your password ${ORANGE}[*security risk*]: ${RESETBG}" password

git config --global user.name "$name"
git config --global user.email "$email"
git config --global sendmail.smtpencryption tls
git config --global sendmail.smtpserver "$smtp"
git config --global sendmail.smtpuser "$email"
git config --global sendmail.serverport 587
git config --global sendmail.smtppass "$password"

echo
echo "Content of ~/.gitconfig file"
cat ~/.gitconfig
