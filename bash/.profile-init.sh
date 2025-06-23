. ~/.dev-settings/bash/.aws-aliases.sh
. ~/.dev-settings/bash/.docker-aliases.sh
. ~/.dev-settings/bash/.dotnet-aliases.sh
. ~/.dev-settings/bash/.git-aliases.sh
. ~/.dev-settings/bash/.terraform-aliases.sh
. ~/.dev-settings/bash/scripts/.aliases.sh

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