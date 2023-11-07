Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# alises
function psconfig { code $profile }
new-alias lg lazygit
new-alias gf "git fetch"
function gpl { git pull }
function nrdev { npm run dev }

remove-alias -name z
new-alias z "zi"

remove-alias -name ls
function ls { eza -l --group-directories-first --color=auto --git --icons --no-permissions --no-user }