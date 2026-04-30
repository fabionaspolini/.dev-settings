# Enable autocomplete for this script
_kafka_autocomplete() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local opcoes="start stop"
  
  # compgen gera a lista filtrando pelo que já foi digitado
  COMPREPLY=( $(compgen -W "${opcoes}" -- "$cur") )
}

register_kafka_autocomplete() {
  complete -F _kafka_autocomplete kafka
  complete -F _kafka_autocomplete kafka.sh
  complete -F _kafka_autocomplete ./kafka.sh
}

handle_kafka_command() {
  case "$1" in
      start)
          start
          ;;
      stop)
        stop
        ;;
      *)
          printf "Invalid command: $@\nUse: {start|stop}\n"
  esac
}

start() {
  docker compose -f ~/sources/infra/kafka/docker-compose.yml start
}

stop() {
  docker compose -f ~/sources/infra/kafka/docker-compose.yml stop
}

if [[ -z "$_KAFKA_SOURCED_FOR_INIT" ]]; then
  handle_kafka_command "$@"
fi
