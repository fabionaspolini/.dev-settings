start() {
  docker compose -f ~/sources/infra/kafka/docker-compose.yml start
}

stop() {
  docker compose -f ~/sources/infra/kafka/docker-compose.yml stop
}

# Esta linha é essencial para permitir a chamada externa
#"$@"

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