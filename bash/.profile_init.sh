scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

. "$scriptDir/.aws_aliases.sh"
. "$scriptDir/.git_aliases.sh"
. "$scriptDir/.terraform_aliases.sh"