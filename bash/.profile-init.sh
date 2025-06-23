DEV_SETTINGS_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

. $DEV_SETTINGS_DIR/.aws-aliases.sh
. $DEV_SETTINGS_DIR/.docker-aliases.sh
. $DEV_SETTINGS_DIR/.dotnet-aliases.sh
. $DEV_SETTINGS_DIR/.git-aliases.sh
. $DEV_SETTINGS_DIR/.terraform-aliases.sh
. $DEV_SETTINGS_DIR/scripts/.aliases.sh


# Enable Git branch display in prompt
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
fi
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCONFLICTSTATE="yes"
export GIT_PS1_SHOWCOLORHINTS=true
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '
