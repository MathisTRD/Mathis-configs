$Path = "$env:LOCALAPPDATA/Programs/oh-my-posh/"
$mydocuments = [Environment]::GetFolderPath("MyDocuments")

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
Invoke-Command { & "pwsh.exe"       } -NoNewScope

Invoke-WebRequest -Uri https://raw.githubusercontent.com/MathisTRD/configs/main/OhMyPosh/theme/mathis.omp.json -OutFile "$Path/mathis.omp.json"

$mydocuments = [Environment]::GetFolderPath("MyDocuments")
Add-Content -Path "$mydocuments/Powershell/Microsoft.PowerShell_profile.ps1" -Value "oh-my-posh init pwsh --config 'C:\Users\Mathis\AppData\Local\Programs\oh-my-posh\mathis.omp.json' | Invoke-Expression"

