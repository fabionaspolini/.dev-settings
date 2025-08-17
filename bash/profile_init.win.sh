# Utilizar para inicializar profile do git bash no Windows

CURRENT_FOLDER="$(dirname -- "${BASH_SOURCE[0]}")"

. "$CURRENT_FOLDER"/profile_init.sh
. "$CURRENT_FOLDER"/wsl_aliases.win.sh

unset CURRENT_FOLDER