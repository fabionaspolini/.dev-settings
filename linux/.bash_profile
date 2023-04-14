alias gf="git fetch --prune"
alias gp="git pull --prune"
alias gr="git remote -v"
alias git-get-all-branchs='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'
alias awslocal="AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test AWS_DEFAULT_REGION=us-east-1 aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"

# Load Angular CLI autocompletion.
source <(ng completion script)
