$Path = "$env:LOCALAPPDATA/Programs/oh-my-posh/"

$mydocuments = [Environment]::GetFolderPath("MyDocuments")

# Download OhMyPosh Theme JSON
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MathisTRD/configs/main/OhMyPosh/theme/mathis.omp.json -OutFile "$Path/mathis.omp.json"

# Add content to the downloaded JSON file

$mydocuments = [Environment]::GetFolderPath("MyDocuments")
Add-Content -Path "$mydocuments/Powershell/Microsoft.PowerShell_profile.ps1" -Value "oh-my-posh init pwsh --config 'C:\Users\Mathis\AppData\Local\Programs\oh-my-posh\mathis.omp.json' | Invoke-Expression"




####################




# Define the URL of the JSON configuration file on GitHub
$jsonUrl = "https://raw.githubusercontent.com/MathisTRD/configs/main/OhMyPosh/theme/color.json"

# Define the path where you want to save the downloaded JSON file
$localFilePath = "C:\Users\Mathis\Desktop\color.json"

# Download the JSON configuration file from GitHub
Invoke-WebRequest -Uri $jsonUrl -OutFile $localFilePath

# Define the path to the Windows Terminal settings.json file
$settingsFilePath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Read the downloaded JSON content
$downloadedJsonContent = Get-Content -Raw -Path $localFilePath | ConvertFrom-Json

# Get the scheme you want to replace (for example, "Campbell")
$targetSchemeName = "Campbell"

# Find the index of the target scheme in the downloaded JSON content
$targetSchemeIndex = $downloadedJsonContent.profiles.list.FindIndex({ $_.name -eq $targetSchemeName })

# If the target scheme is found
if ($targetSchemeIndex -ne -1) {
    # Read the Windows Terminal settings JSON content
    $settingsJsonContent = Get-Content -Raw -Path $settingsFilePath | ConvertFrom-Json

    # Replace the scheme with the one from the downloaded JSON content
    $settingsJsonContent.profiles.list[$targetSchemeIndex] = $downloadedJsonContent

    # Convert the modified JSON back to string and save it to the settings file
    $settingsJsonContent | ConvertTo-Json | Set-Content -Path $settingsFilePath

    Write-Host "Scheme '$targetSchemeName' replaced successfully."
} else {
    Write-Host "Error: Scheme '$targetSchemeName' not found in the downloaded JSON."
}
