# Escalate script to administrator access if needed
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  $arguments = "& '" + $myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

# Install Chocolatey (Unsafe)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$chocolateyPackages = @(
  # CLI
  "microsoft-windows-terminal",
  "poshgit",
  "jq",

  # Debugging
  "windbg",
  "debugdiagnostic",
  
  # .NET
  "nuget",
  "dotnet3.5",
  "netfx-4.8-devpack",
  "dotnetcore-sdk",
  
  # Node.js
  "nvm",

  # Haskell
  "ghc",
  "haskell-stack",
  "cabal",

  # Text editors
  "visualstudio2019professional",
  "resharper",
  "vscode",
  "atom",
  "sublimetext3",
  "notepadplusplus",
  "linqpad5",
  "linqpad",

  # File comparison
  "p4v",
  "beyondcompare",

  # Browsers
  "googlechrome",
  "firefox",
  "microsoft-edge",

  # Media
  "vlc",
  "spotify",
  "foxitreader",

  # Communication
  "slack",
  "discord",
  "obs-studio",

  # Utility
  "7zip",
  "autohotkey",
  "awscli",
  "baretail",
  "cyberduck",
  "divvy",
  "fiddler",
  "googledrive",
  "malwarebytes",
  "postman",
  "sharex",
  "sysinternals",
  "windirstat",

  # Docker
  "docker-cli"
);

# Maybe? 
# * procmon
# * processhacker

# Missing
# * Microsoft Whiteboard

choco install --confirm @chocolateyPackages

Write-Host "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
