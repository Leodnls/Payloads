curl -X POST https://content.dropboxapi.com/2/files/upload ^
--header "Authorization: Bearer sl.CB0zmp7M1u-9a7vcDvNwLKTAaod1rkVHkwvrl0clxsROFsGkwWO8ihngTJUN9wYo_dwRi4uXcZ6GgZZIxdSHgAVMK-rNmU1TcISER1fXo3Zhg__7F8tLb2tnbcVRuCuIQIJ0pr_wHEWV" ^
--header "Dropbox-API-Arg: {\"path\": \"/arbo.txt\", \"mode\": \"add\", \"autorename\": true, \"mute\": false}" ^
--header "Content-Type: application/octet-stream" ^
--data-binary @arbo.txt