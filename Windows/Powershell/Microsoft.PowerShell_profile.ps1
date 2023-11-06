$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\zachb\.config\komorebi'
Invoke-Expression (&starship init powershell)

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
