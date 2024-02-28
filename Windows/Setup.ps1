Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine -AllowPrerelease -Force

if (!(Get-Command "scoop" -errorAction SilentlyContinue)){ 
  Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

winget install --id Starship.Starship
winget install ajeetdsouza.zoxide
scoop install lazygit
scoop install fzf
scoop install eza


$mappings = @(
  # Git
  @{
    source = "$Env:USERPROFILE\.gitconfig"
    dest = "$PWD\..\Global\Git\.gitconfig"
  },
  # Powershell
  @{
    source = "$Env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    dest = "$PWD\Powershell\Microsoft.PowerShell_profile.ps1"
  },
  # Terminal
  @{
    source = "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    dest = "$PWD\Terminal\settings.json"
  },
  # VSCode
  @{
    source = "$Env:AppData\Cursor\User\settings.json"
    dest = "$PWD\..\Global\VSCode\settings.json"
  },
  @{
    source = "$Env:AppData\Cursor\User\keybindings.json"
    dest = "$PWD\..\Global\VSCode\keybindings.json"
  },
  @{
    source = "$Env:USERPROFILE\.cursor\extensions\extensions.json"
    dest = "$PWD\..\Global\VSCode\extensions.json"
  },
  # FancyWM
  @{
    source = "$Env:LocalAppData\Packages\2203VeselinKaraganev.FancyWM_9x2ndwrcmyd2c\LocalCache\Roaming\FancyWM\settings.json"
    dest = "$PWD\FancyWM\settings.json"
  },
  # Virtual Space
  @{
    source = "$Env:USERPROFILE\Documents\VirtualSpace\settings.json"
    dest = "$PWD\VirtualSpace\settings.json"
  }
)

foreach ($mapping in $mappings) {
  Write-Output `Creating symlink for $($mapping.source) -> $($mapping.dest)`

  if (Test-Path -Path $mapping.source) {
    # do not run this without knowing what you're doing
    # only run this if your repo has your up to date configs
    # it will wipe your real config and replace it with a symlink
    $(Get-Item $mapping.source).Delete()
  }

  New-Item -ItemType SymbolicLink -Path $mapping.source -Target $mapping.dest
}