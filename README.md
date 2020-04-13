# windows-setup

## Usage

### Install Chocolatey and packages
Run in PowerShell:
```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/danclien/windows-setup/master/install.ps1'))
```

### Generate SSH key
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```