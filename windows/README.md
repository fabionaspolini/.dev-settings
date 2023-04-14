## PowerShell

Atualizar arquivo: `%USERPROFILE%\Documentos\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

Com o conteúdo de [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1)

Para gerenciador **cmder** edite o arquivo `.\cmder\vendor\profile.ps1`

```powershell
Import-Module "%USERPROFILE%\Documentos\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
```

## cmd

[Tutorial](https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt)

```reg
[HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor]
"AutoRun"="%USERPROFILE%\\settings\\windows\\alias.cmd"
```

## bash

