# Functions to ignore when listing available commands
_KAFKA_IGNORED_FUNCTIONS=("_kafka_autocomplete" "register_kafka_autocomplete" "handle_kafka_command" "_kafka_get_commands")

_kafka_get_commands() {
  local script_file="${BASH_SOURCE[1]}"
  local all_functions func ignored
  local commands=()

  mapfile -t all_functions < <(grep -E '^[a-zA-Z_][a-zA-Z0-9_]*\(\)' "$script_file" | sed 's/().*//')

  for func in "${all_functions[@]}"; do
    ignored=false
    for ignored_func in "${_KAFKA_IGNORED_FUNCTIONS[@]}"; do
      [[ "$func" == "$ignored_func" ]] && ignored=true && break
    done
    $ignored || commands+=("$func")
  done

  echo "${commands[@]}"
}

# Enable autocomplete for this script
_kafka_autocomplete() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local opcoes
  read -ra opcoes <<< "$(_kafka_get_commands)"
  COMPREPLY=( $(compgen -W "${opcoes[*]}" -- "$cur") )
}

register_kafka_autocomplete() {
  complete -F _kafka_autocomplete kafka
  complete -F _kafka_autocomplete kafka.sh
  complete -F _kafka_autocomplete ./kafka.sh
}

handle_kafka_command() {
  local commands func
  read -ra commands <<< "$(_kafka_get_commands)"

  local cmd="$1"
  for func in "${commands[@]}"; do
    if [[ "$cmd" == "$func" ]]; then
      "$func"
      return
    fi
  done

  printf "Invalid option: %s\nUse: {%s}\n" "$cmd" "$(IFS='|'; echo "${commands[*]}")"
}

start() {
  docker compose -f ~/sources/infra/kafka/docker-compose.yml start
}

stop() {
  docker compose -f ~/sources/infra/kafka/docker-compose.yml stop
}

teste() {
  echo "TESTEEE"
}

if [[ -z "$_KAFKA_SOURCED_FOR_INIT" ]]; then
  handle_kafka_command "$@"
fi
