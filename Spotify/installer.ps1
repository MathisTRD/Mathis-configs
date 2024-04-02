# Spicetify installation 
Invoke-WebRequest -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | Invoke-Expression

# download extensions
Invoke-WebRequest https://raw.githubusercontent.com/timll/spotify-group-session/main/src/group-session.js -OutFile "$env:APPDATA/spicetify/Extensions/group-session.js"
Invoke-WebRequest https://raw.githubusercontent.com/daksh2k/Spicetify-stuff/master/Extensions/playNext.js -OutFile "$env:APPDATA/spicetify/Extensions/playNext.js"
Invoke-WebRequest https://raw.githubusercontent.com/huhridge/huh-spicetify-extensions/main/fullAppDisplayModified/fullAppDisplayMod.js -OutFile "$env:APPDATA/spicetify/Extensions/fullAppDisplayMod.js"
Invoke-WebRequest https://raw.githubusercontent.com/ohitstom/spicetify-extensions/main/immersiveView/immersiveView.js -OutFile "$env:APPDATA/spicetify/Extensions/immersiveView.js"


# check for theme folder
$folderPath = "$env:APPDATA\spicetify\Themes\Clark"

if(!(Test-Path -Path $folderPath))
{
    New-Item -ItemType Directory -Path $folderPath
}

# download theme
Invoke-WebRequest https://raw.githubusercontent.com/MathisTRD/configs/main/Spotify/Theme/color.ini -OutFile $folderPath/color.ini
Invoke-WebRequest https://raw.githubusercontent.com/MathisTRD/configs/main/Spotify/Theme/user.css -OutFile $folderPath/user.css
Invoke-WebRequest https://raw.githubusercontent.com/MathisTRD/configs/main/Spotify/Theme/user.scss -OutFile $folderPath/user.scss

# configure extensions
spicetify config extensions group-session.js
spicetify config extensions playNext.js
spicetify config extensions fullAppDisplayMod.js
spicetify config extensions immersiveView.js

# configure theme
spicetify config current_theme Clark

# configure custom apps
spicetify config custom_apps new-releases
spicetify config custom_apps lyrics-plus

# apply modifications
spicetify apply

Write-Output "Spotify is now ready!"
