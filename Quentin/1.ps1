write-Output "Le nombre Myst�re est compris entre 0 et 50" #on affiche la pr�sentation
$variable=Read-Host "Quel est le nombre myst�re ?" #on demande � l'utilisateur d'entre un chiffre
$Random=Get-Random -minimum 0 -maximum 50 #on tire au sort un nombre


For ($i10;$i -eq 0;$i--)
if ($variable -lt $Random) {Write-Output "plus"
if ($variable -gt $Random) {Write-Output "moins"
$variable=Read-Host "Quel est le nombre myst�re ?" 

Write-OutPut ""
if ($variable -eq $Random) {Write-Output "Vous avez gagn�, le nombre myst�re �tait bien:" $Random "En $tentative coups, Missile nucl�aire lanc�."

