@echo off
setlocal enabledelayedexpansion

:: Lire le contenu du fichier token.txt dans la variable TOKEN
set /p TOKEN=<token.txt

:: Exécuter la commande curl
curl -X POST https://content.dropboxapi.com/2/files/upload ^
--header "Authorization: Bearer !TOKEN!" ^
--header "Dropbox-API-Arg: {\"path\": \"/arbo.txt\", \"mode\": \"add\", \"autorename\": true, \"mute\": false}" ^
--header "Content-Type: application/octet-stream" ^
--data-binary @"arbo.txt"

pause
