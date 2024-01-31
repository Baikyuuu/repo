write-Output "Le nombre Mystère est compris entre 0 et 50" #on affiche la présentation
$variable=Read-Host "Quel est le nombre mystère ?" #on demande à l'utilisateur d'entre un chiffre
$Random=Get-Random -minimum 0 -maximum 50 #on tire au sort un nombre


For ($i10;$i -eq 0;$i--)
if ($variable -lt $Random) {Write-Output "plus"
if ($variable -gt $Random) {Write-Output "moins"
$variable=Read-Host "Quel est le nombre mystère ?" 

Write-OutPut ""
if ($variable -eq $Random) {Write-Output "Vous avez gagné, le nombre mystère était bien:" $Random "En $tentative coups, Missile nucléaire lancé."

