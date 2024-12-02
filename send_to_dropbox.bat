curl -X POST https://content.dropboxapi.com/2/files/upload ^
--header "Authorization: Bearer sl.CB0fJF54Q9SbDUSU3enAdPrVa42L7Yf5bPbuH6PmqONAwoe17ZucbVN4Co6BiyLvyoQ9J_LePV7JLNs1FKf6jpnPdPFGl8Eu93-eax_vW20CH0fkkCX8zveLAiXd2T_ThdTMityyF9ec" ^
--header "Dropbox-API-Arg: {\"path\": \"/arbo.txt\", \"mode\": \"add\", \"autorename\": true, \"mute\": false}" ^
--header "Content-Type: application/octet-stream" ^
--data-binary @arbo.txt
