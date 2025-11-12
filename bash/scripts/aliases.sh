CURRENT_FOLDER="$(dirname -- "${BASH_SOURCE[0]}")"

alias clear-dev-folders=". \"$CURRENT_FOLDER\"/clear-dev-folders.sh"
alias delete-merged-branchs=". \"$CURRENT_FOLDER\"/delete-merged-branchs.sh"

unset CURRENT_FOLDER