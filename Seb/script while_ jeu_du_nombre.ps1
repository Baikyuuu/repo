cls  #nettoyage de l'écran avant de commencer le jeu
$al = Get-Random -maximum 101  #choix du nombre aléatoire 
$tours = 0 
while ($chiffre -ne "$al") #mise en place de la boucle et de la condition a respecter pour en sortir
{
[int]$chiffre = read-host "Devinez le chiffre entre 0 et 100" #affichage de la phrase qui lance le jeu pour l'utilisateur: il doit choisir un chiffre
$tours++
if ($chiffre -eq "$al") #cas ou l'utilisateur trouve le bon chiffre : message de victoire + fin de la boucle
{
Write-Host "Félicitations, vous avez trouvé le bon chiffre ! "
Write-Host "en $tours coups "
}
elseif ($chiffre -gt "$al") #cas ou l'utilisateur donne un chiffre trop élevé : indice + reprise de la boucle
{
Write-Host "C'est moins"
}
elseif ($chiffre -lt "$al") #cas ou l'utilisateur donne un chiffre trop bas : indice + reprise de la boucle
{
Write-Host "C'est plus"
}
}