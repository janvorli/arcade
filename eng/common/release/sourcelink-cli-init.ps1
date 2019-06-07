param (
    $sourcelinkCliVersion = $null
)

$verbosity = "minimal"
. $PSScriptRoot\..\tools.ps1

function InstallSourcelinkCli ($sourcelinkCliVersion) {
  $sourcelinkCliPackageName = "sourcelink"

  $dotnetRoot = InitializeDotNetCli -install:$true
  $dotnet = "$dotnetRoot\dotnet.exe"
  $toolList = & "$dotnet" tool list --global

  if ($toolList -like "*$sourcelinkCliPackageName*") {
    & "$dotnet" tool uninstall $sourcelinkCliPackageName --global
  }
 
  Write-Host "Installing SourceLink CLI version $sourcelinkCliVersion..."
  Write-Host "You may need to restart your command window if this is the first dotnet tool you have installed."
  & "$dotnet" tool install $sourcelinkCliPackageName --version $sourcelinkCliVersion --verbosity $verbosity --global
}

InstallSourcelinkCli $sourcelinkCliVersion
