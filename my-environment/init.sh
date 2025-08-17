CURRENT_FOLDER="$(dirname -- "${BASH_SOURCE[0]}")"

. "$CURRENT_FOLDER"/android.sh
. "$CURRENT_FOLDER"/bash-prompt-format.sh
. "$CURRENT_FOLDER"/dotnet.sh
. "$CURRENT_FOLDER"/java.sh

unset CURRENT_FOLDER