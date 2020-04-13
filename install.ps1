# Check for administrator role
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  Write-Host "Run this script as an administrator"
  Break
}

# Install Chocolatey (Unsafe)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$packageSets = @{
  cli = @(
    "microsoft-windows-terminal",
    "poshgit",
    "jq"  
  );
  debugging = @(
    "windbg",
    "debugdiagnostic"
  );
  dotnet = @(
    "nuget.commandline",
    "dotnet3.5",
    "netfx-4.8-devpack",
    "dotnetcore-sdk"  
  );
  nodejs = @(
    "nvm"
  );
  haskell = @(
    "ghc",
    "haskell-stack"  
  );
  docker = @(
    "docker-cli"
  )
  textEditors = @(
    "visualstudio2019professional",
    "resharper",
    "vscode",
    "atom",
    "sublimetext3",
    "notepadplusplus",
    "linqpad5",
    "linqpad6"  
  );
  fileComparison = @(
    "p4v",
    "beyondcompare"
  );
  browsers = @(
    "googlechrome",
    "firefox",
    "microsoft-edge"  
  );
  entertainment = @(
    "vlc",
    "spotify"  
  );
  chat = @(
    "slack",
    "discord"  
  );
  misc = @(
    "7zip",
    "autohotkey",
    "awscli",
    "baretail",
    "cyberduck",
    "divvy",
    "fiddler",
    "foxitreader",
    "googledrive",
    "malwarebytes",
    "obs-studio",
    "postman",
    "procmon",
    "sharex",
    "sysinternals",
    "windirstat"
  );
}

# Create an array with all the packages listed in the hash
$packages = @($packageSets.Values | % {$_})

# Install packages
choco install --confirm @packages

# Need to manually install
$missingFromChocolatey = @(
  "1password",
  "Microsoft Whiteboard"
)

Write-Host "Needs to be manually installed:"
$missingFromChocolatey