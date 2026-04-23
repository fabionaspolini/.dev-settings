#!/bin/bash

# Atualizar valores das variáveis 

source "$HOME/.profile"
source "$HOME/.bashrc"
source "$HOME/.bash_profile"

# Atualizar o ambiente do Systemd (User)
systemctl --user import-environment

# Atualizar o ambiente do D-Bus. Para que aplicativos gráficos (que geralmente são lançados via D-Bus) reconheçam a mudança.
dbus-update-activation-environment --systemd --all

# Apenas uma variável (ou lista)
#systemctl --user import-environment TESTE # terminal
#dbus-update-activation-environment --systemd TESTE # graphic env
