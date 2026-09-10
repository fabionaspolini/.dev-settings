#!/bin/bash

# Detecta se o sistema está em modo Dark ou Light
# (retorna true para escuro no Plasma)
IS_DARK=$(kreadconfig6 --group "General" --key "ColorScheme" | grep -i -e "macchiato" -e "dark")

if [ -n "$IS_DARK" ]; then
    NEW_PROFILE="Nightly"
else
    NEW_PROFILE="Daily"
fi

# Altera o profile padrão usado ao abrir novos terminais.
# OBS: o Konsole só lê essa chave uma vez, no início do processo (ProfileManager
# cacheia o valor em memória — não há D-Bus/SIGHUP/KConfigWatcher para reload).
# Ou seja, isso só afeta terminais abertos DEPOIS que o processo konsole reiniciar;
# instâncias já rodando não percebem essa mudança sozinhas.
kwriteconfig6 --file konsolerc --group "Desktop Entry" --key "DefaultProfile" "$NEW_PROFILE.profile"

# Busca todos os serviços do Konsole rodando no barramento de sessão do D-Bus
services=$(busctl --user list --no-legend | awk '$1 ~ /^org\.kde\.konsole/ {print $1}')

denied=false

for service in $services; do
    # 2. Obtém os caminhos de todas as sessões ativas
    # (grep -o extrai só o path, descartando os caracteres de árvore │/└─ que o busctl imprime)
    sessions=$(busctl --user tree "$service" --no-legend | grep -oE '/Sessions/[0-9]+')

    for session in $sessions; do
        # 3. Altera o perfil chamando a interface org.kde.konsole.Session
        error=$(busctl --user call "$service" "$session" org.kde.konsole.Session setProfile s "$NEW_PROFILE" 2>&1 >/dev/null)
        if [ -n "$error" ]; then
            echo "$error" >&2
            [[ "$error" == *"Access denied"* ]] && denied=true
        fi
    done
done

if [ "$denied" = true ]; then
    echo "Konsole está bloqueando chamadas D-Bus sensíveis (setProfile/runCommand)." >&2
    echo "Para habilitar, adicione em ~/.config/konsolerc:" >&2
    echo "  [KonsoleWindow]" >&2
    echo "  EnableSecuritySensitiveDBusAPI=true" >&2
    echo "e reinicie o Konsole. Isso também libera runCommand/sendText via D-Bus." >&2
fi
