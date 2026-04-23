#!/bin/bash

# Atualizar valores das variáveis 

source "$HOME/.profile"
source "$HOME/.bashrc"
source "$HOME/.bash_profile"

# Sincroniza o ambiente do D-Bus com o do Systemd
dbus-update-activation-environment --systemd --all

# Apenas uma variável (ou lista)
#systemctl --user import-environment TESTE # terminal
#dbus-update-activation-environment --systemd TESTE # graphic env
