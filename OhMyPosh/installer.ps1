$Path = "$env:LOCALAPPDATA/Programs/oh-my-posh/"

$mydocuments = [Environment]::GetFolderPath("MyDocuments")

# Download OhMyPosh Theme JSON
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MathisTRD/configs/main/OhMyPosh/theme/mathis.omp.json -OutFile "$Path/mathis.omp.json"

# Add content to the downloaded JSON file

$mydocuments = [Environment]::GetFolderPath("MyDocuments")
Add-Content -Path "$mydocuments/Powershell/Microsoft.PowerShell_profile.ps1" -Value "oh-my-posh init pwsh --config 'C:\Users\Mathis\AppData\Local\Programs\oh-my-posh\mathis.omp.json' | Invoke-Expression"

