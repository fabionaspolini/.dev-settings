# .dev-settings

Configurações para ambiente de desenvolvimento.

- [Como usar?](#como-usar)
- [bash](#bash)
- [cmd](#cmd)
- [PowerShell](#powershell)
- [Windows Terminal](#windows-terminal)
- [WSL](#wsl)

## Como usar?

1. Clonar o repositório em sua pasta de usuário:

```bash
cd ~
git clone https://github.com/fabionaspolini/.dev-settings.git

# ou por ssh
git clone git@github.com:fabionaspolini/.dev-settings.git
```

2. Realize as configurações em cada tecnologia abaixo.

## bash

Para **Windows**:

Editar arquivo `~/.bash_profile` e adicionar:

```bash
. ~/.dev-settings/bash/.profile_init.win.sh
```

Para **Linux**:

Editar arquivo `~/.bashrc` e adicionar:

```bash
. ~/.dev-settings/bash/.profile_init.sh
```

## cmd

[Tutorial](https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt)

```reg
[HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor]
"AutoRun"="%USERPROFILE%\\.dev-settings\\cmd\\alias.cmd"
```

## PowerShell

Editar script de inicialização do profile

- WindowsPowerShell: `%USERPROFILE%\Documentos\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
- cmder: `<cmder-install-folder>\cmder\vendor\profile.ps1`

e adicionar:

```powershell
Import-Module "~\.dev-settings\powershell\Profile.ps1"
```

## Windows Terminal

Configurações e temas

- Path: `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`
- Arquivo: [windows-terminal/settings.json](windows-terminal/settings.json)

## WSL

Limitar uso de recursos de hardware com o arquivo `~/.wslconfig`.