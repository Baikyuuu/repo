cls  #nettoyage de l'écran avant de commencer le jeu
$al = Get-Random -maximum 101  #choix du nombre aléatoire 
$tours = 0  #cette variable sert a indiquer le nombre de coups que l'on as mis a trouver le chiffre
$valeur = 0..10  #cette variable sert a alimenter le compte a rebours qui indique le nombre de tentatives restantes
For($i=10;$i -ge 0;$i--)  #mise en place de la boucle $i=10 : c'est le point de départ      $i -ge 0 : c'est la fin du décompte      $i-- : la commande pour faire diminuer $i de 1 a chaque tour
{
[int]$chiffre = read-host "Devinez le chiffre entre 0 et 100" #affichage de la phrase qui lance le jeu pour l'utilisateur: il doit choisir un chiffre
$tours++
if ($chiffre -eq "$al") #cas ou l'utilisateur trouve le bon chiffre : message de victoire + fin de la boucle
{
Write-Host "Félicitations, vous avez trouvé le bon chiffre ! "
Write-Host "en $tours coups "
}
elseif ($chiffre -gt "$al") #cas ou l'utilisateur donne un chiffre trop élevé : indice + nombre de tentatives restantes + reprise de la boucle
{
Write-Host "C'est moins"
Write-Host "Il vous reste $($valeur[$i]) tentatives" 
}
elseif ($chiffre -lt "$al") #cas ou l'utilisateur donne un chiffre trop bas : indice + nombre de tentatives restantes + reprise de la boucle
{
Write-Host "C'est plus"
Write-Host "Il vous reste $($valeur[$i]) tentatives" 
}
}
