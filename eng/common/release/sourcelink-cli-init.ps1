param (
    $sourcelinkCliVersion = $null
)

$verbosity = "m"
. $PSScriptRoot\..\tools.ps1

function InstallSourcelinkCli ($sourcelinkCliVersion) {
  $sourcelinkCliPackageName = "sourcelink"

  $dotnetRoot = InitializeDotNetCli -install:$true
  $dotnet = "$dotnetRoot\dotnet.exe"
  $toolList = & "$dotnet" tool list -g

  if ($toolList -like "*$sourcelinkCliPackageName*") {
    & "$dotnet" tool uninstall $sourcelinkCliPackageName -g
  }
 
  Write-Host "Installing SourceLink CLI version $sourcelinkCliVersion..."
  Write-Host "You may need to restart your command window if this is the first dotnet tool you have installed."
  & "$dotnet" tool install $sourcelinkCliPackageName --version $sourcelinkCliVersion -v $verbosity -g
}

InstallSourcelinkCli $sourcelinkCliVersion
