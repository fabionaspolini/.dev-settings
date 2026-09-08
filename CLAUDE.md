# .dev-scripts

Coleção pessoal de scripts bash para configuração do ambiente de desenvolvimento (aliases, funções de shell, triggers de sistema e settings de ferramentas).

## Estrutura

- `profile-init/*.sh` — funções e aliases carregados automaticamente no shell via `profile-init.sh` → `profile-init/init.sh`, que faz `source` de todo `*.sh` da pasta (exceto `init.sh`).
- `scripts/utils/*.sh` — bibliotecas utilitárias reutilizáveis (parse de argumentos, diálogos, helpers bash). Não são carregadas automaticamente; cada script que precisa dá `source` explicitamente.
- `scripts/*.sh` — scripts standalone, não carregados automaticamente (backup, git helpers, sync, etc.).
- `system-triggers/session/{on-login,pre-login}/*.sh` — scripts ligados a hooks de sessão gráfica (autostart / `~/.config/plasma-workspace/env/`).
- `settings/` — configurações de ferramentas (ex: vscode).

## Padrões de código

- **Guard contra reload**: bibliotecas que podem ser `source`d mais de uma vez (em `scripts/utils/`) começam com um guard baseado em variável, no padrão:
  ```bash
  [[ -n "${_NOME_SH_LOADED:-}" ]] && return 0
  _NOME_SH_LOADED=true
  ```
- **Source relativo ao próprio arquivo**: quando um script precisa dar `source` em outro, resolve o path com `CURRENT_FOLDER="$(dirname -- "${BASH_SOURCE[0]}")"`, usa `source "$CURRENT_FOLDER/../path/arquivo.sh"` e depois `unset CURRENT_FOLDER`.
- **Parse de argumentos**: usar `scripts/utils/parse-args.sh` (`parse_args "$@"`) em vez de parsing manual. Ele injeta `--flag valor` como variável `flag="valor"` no escopo do caller, e `--flag` sozinho (sem valor seguinte) vira `flag="true"`. Declarar as variáveis com `local` antes de chamar `parse_args`.
- **Scripts em `profile-init/`**: nunca usar `set -e` (um erro derrubaria o terminal do usuário, já que o script é sourced na sessão interativa). Devem ser rápidos — apenas registrar aliases/funções, sem executar lógica pesada no carregamento.
- **Confirmações interativas destrutivas/sensíveis**: usar `read -n1 -s` para "pressione qualquer tecla" antes de ações, ou `read -rp` com menu numerado (`1) opção A`, `2) opção B`) quando há escolha explícita — e permitir que a escolha também venha via argumento (`parse_args`), pulando o prompt quando já informado.
- **Feedback visual no terminal**: uso de ANSI bold/cor manual (`\033[1m...\033[0m`, `\033[33m` para amarelo) em `echo -e`, e `echo "----------------------------------------"` como separador entre etapas de um script longo.
- **Idioma**: código, nomes de função/variável e comentários em inglês; comentários explicando "por quê" (ex: avisos sobre `set -e`) também em português quando o autor considerar mais claro para si mesmo — não há regra rígida, mas a maioria do código é em inglês.
- **Nomes de função**: kebab-case (ex: `upgrade-all-packages`, `show-paths-env`, `fix-keyboard-ibus-errors`), não snake_case nem camelCase.
