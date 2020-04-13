$project = "windows-setup"

# Setup temporary directory
$tempFolder = $env:TEMP + "\" + $project

# File settings
$file = "install.ps1"
$scriptWebPath = "https://raw.githubusercontent.com/danclien/windows-setup/master/" + $file
$targetPath = $tempFolder + "\" + $file

# Create the temporary directory if it doesn't exist
New-Item -ItemType Directory -Force -Path $tempFolder | Out-Null

# Download the file
Import-Module BitsTransfer
Start-BitsTransfer -source $scriptWebPath -destination $targetPath

# Run the file
Powershell.exe -ExecutionPolicy Bypass -File $targetPath