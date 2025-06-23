DEV_SETTINGS_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

. $DEV_SETTINGS_DIR/.aws_aliases.sh
. $DEV_SETTINGS_DIR/.docker_aliases.sh
. $DEV_SETTINGS_DIR/.dotnet_aliases.sh
. $DEV_SETTINGS_DIR/.git_aliases.sh
. $DEV_SETTINGS_DIR/.terraform_aliases.sh
. $DEV_SETTINGS_DIR/scripts/.aliases.sh


# Enable Git branch display in prompt
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_SHOWCOLORHINTS=true

USERNAME_BG="\[\e[1;37;40m\]"   # negrito, texto branco, fundo escuro
CWD_BG="\[\e[1;37;44m\]"        # negrito, texto branco, fundo azul
RESET_BG="\[\e[0m\]"            # reseta cor/fundo

# Template para colorir cursor do bash => user@hostname directory [git branch] $ )
PS1_BASE="${USERNAME_BG} \u@\h ${RESET_BG}${CWD_BG} \w ${RESET_BG}"
PS1="$PS1_BASE"
PS1+='$(__git_ps1 "[%s]")\$ '

unset PS1_BASE USERNAME_BG CWD_BG RESET_BG

# original no arquivo ~/.bashrc
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '