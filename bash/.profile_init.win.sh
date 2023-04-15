scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

. "$scriptDir/.profile_init.sh"
. "$scriptDir/.docker_aliases.win.sh"