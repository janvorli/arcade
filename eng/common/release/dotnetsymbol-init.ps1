param (
    $dotnetsymbolVersion = $null
)

$verbosity = "minimal"
. $PSScriptRoot\..\tools.ps1

function Installdotnetsymbol ($dotnetsymbolVersion) {
  $dotnetsymbolPackageName = "dotnet-symbol"

  $dotnetRoot = InitializeDotNetCli -install:$true
  $dotnet = "$dotnetRoot\dotnet.exe"
  $toolList = & "$dotnet" tool list --global

  if ($toolList -like "*$dotnetsymbolPackageName*") {
    & "$dotnet" tool uninstall $dotnetsymbolPackageName --global
  }
 
  Write-Host "Installing dotnet-symbol version $dotnetsymbolVersion..."
  Write-Host "You may need to restart your command window if this is the first dotnet tool you have installed."
  & "$dotnet" tool install $dotnetsymbolPackageName --version $dotnetsymbolVersion --verbosity $verbosity --global
}

Installdotnetsymbol $dotnetsymbolVersion
