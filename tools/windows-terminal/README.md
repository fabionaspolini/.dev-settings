Atualizar arquivo `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`.

Blocos de configurações:

| Configuração                          | [JSON Query](https://www.jsonquerytool.com/) |
| ------------------------------------- | -------------------------------------------- |
| Esquema de cores para tema "My Light" | `$.schemes[?(@.name=="My Light")]`           |
| Tema padrão                           | `$.profiles.defaults.colorScheme`            |
