#!/bin/bash

# Script de backup genérico para compactar múltiplos conjuntos de arquivos
# Permite definir facilmente novos backups na estrutura de dados BACKUPS


# Configurações globais
DESTINO="/home/fabio/GoogleDrive/Backups/Automatic"

# Cores para mensagens
VERDE='\033[0;32m'
VERMELHO='\033[0;31m'
AMARELO='\033[1;33m'
AZUL='\033[0;34m'
NC='\033[0m' # Sem cor

# ============================================================================
# ESTRUTURA DE BACKUPS
# ============================================================================
# Formato: [nome_destino]="caminho_origem1:caminho_origem2:..."
# Os caminhos podem ser arquivos ou diretórios
# ============================================================================

declare -A BACKUPS=(
    [qwen]="/home/fabio/.qwen/agents:/home/fabio/.qwen/skills:/home/fabio/.qwen/settings.json"
    # Adicione mais backups conforme necessário:
    # [outro_backup]="/path/1:/path/2:/path/3"
)

# ============================================================================
# FUNÇÕES
# ============================================================================

exibir_msg() {
    echo -e "${VERDE}[BACKUP]${NC} $1"
}

exibir_erro() {
    echo -e "${VERMELHO}[ERRO]${NC} $1" >&2
}

exibir_aviso() {
    echo -e "${AMARELO}[AVISO]${NC} $1"
}

exibir_secao() {
    echo -e "\n${AZUL}═══════════════════════════════════════${NC}"
    echo -e "${AZUL}$1${NC}"
    echo -e "${AZUL}═══════════════════════════════════════${NC}\n"
}

# Criar diretório de destino se não existir
criar_diretorio_destino() {
    if [ ! -d "$DESTINO" ]; then
        exibir_msg "Criando diretório de destino: $DESTINO"
        if ! mkdir -p "$DESTINO"; then
            exibir_erro "Falha ao criar diretório: $DESTINO"
            return 1
        fi
    fi
    return 0
}

# Validar se path existe
validar_path() {
    local path="$1"
    if [ ! -e "$path" ]; then
        return 1
    fi
    return 0
}

# Executar backup individual
executar_backup() {
    local nome_backup="$1"
    local paths_origem="$2"
    local nome_arquivo="${nome_backup}.tar.gz"
    local caminho_completo="$DESTINO/$nome_arquivo"
    
    local IFS=':'
    local paths=($paths_origem)
    unset IFS
    
    # Validar paths de origem
    exibir_msg "Validando arquivos de origem..."
    local paths_validos=()
    
    for path in "${paths[@]}"; do
        if validar_path "$path"; then
            paths_validos+=("$path")
            exibir_msg "✓ Encontrado: $path"
        else
            exibir_aviso "✗ Não encontrado: $path"
        fi
    done
    
    # Verificar se temos pelo menos um path válido
    if [ ${#paths_validos[@]} -eq 0 ]; then
        exibir_erro "Nenhum arquivo ou diretório válido encontrado para: $nome_backup"
        return 1
    fi
    
    # Criar arquivo de backup
    exibir_msg "Criando arquivo de backup: $nome_arquivo"
    
    if tar -czf "$caminho_completo" "${paths_validos[@]}" 2>&1 > /dev/null; then
        # Exibir informações do arquivo criado
        if [ -f "$caminho_completo" ]; then
            local tamanho=$(du -h "$caminho_completo" | cut -f1)
            exibir_msg "Backup concluído com sucesso!"
            exibir_msg "Arquivo: $nome_arquivo"
            exibir_msg "Tamanho: $tamanho"
            exibir_msg "Caminho: $caminho_completo"
            return 0
        else
            exibir_erro "Arquivo de backup não foi criado"
            return 1
        fi
    else
        exibir_erro "Falha ao criar arquivo de backup: $nome_arquivo"
        return 1
    fi
}

# ============================================================================
# PROGRAMA PRINCIPAL
# ============================================================================

main() {
    exibir_secao "INICIANDO BACKUPS"
    
    # Validar diretório de destino
    if ! criar_diretorio_destino; then
        exibir_erro "Não foi possível criar o diretório de destino"
        return 1
    fi
    
    # Verificar se há backups configurados
    if [ ${#BACKUPS[@]} -eq 0 ]; then
        exibir_erro "Nenhum backup configurado"
        return 1
    fi
    
    exibir_msg "Total de backups a executar: ${#BACKUPS[@]}"
    
    local total_backups=${#BACKUPS[@]}
    local backups_sucesso=0
    local backups_falha=0
    
    # Executar cada backup
    for nome_backup in "${!BACKUPS[@]}"; do
        exibir_secao "BACKUP: $nome_backup"
        
        if executar_backup "$nome_backup" "${BACKUPS[$nome_backup]}"; then
            ((backups_sucesso++))
        else
            ((backups_falha++))
        fi
        
        echo ""
    done
    
    # Resumo final
    exibir_secao "RESUMO FINAL"
    exibir_msg "Total: $total_backups | Sucesso: $backups_sucesso | Falha: $backups_falha"
    
    if [ $backups_falha -gt 0 ]; then
        return 1
    fi
    
    return 0
}

main
#exit $?
