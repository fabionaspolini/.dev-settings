# Carrega autocomplete do kubectl
if ! command -v kubectl &> /dev/null; then
    return 0
fi

source <(kubectl completion bash)

alias k="kubectl"

# Associar a conclusão do kubectl ao alias 'k'
complete -o default -F __start_kubectl k
