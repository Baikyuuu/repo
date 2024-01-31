cls  #nettoyage de l'écran avant de commencer le jeu
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer  # ces 2 commandes rajoutent la synthése vocale, nécessaire pour la suite
$proposition = Read-Host -Prompt "voulez-vous jouer ? Oui/Non" # mise en place du menu
switch ($proposition)
{
    "Oui" { "Go!"  #mise en place du premier choix : si l'utilisateur répond "oui", le message Go! s'affiche puis le script du jeu des nombre est lancé, car il est contenu tout entier dans les parenthéses du premier choix
    $speak.Speak("Go!") # Speak est la commande pour activer la synthése vocale. Le mot/phrase entre parenthése est prononcé par la synthése vocale juste aprés l'affichage du texte
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
$speak.Speak("Félicitations, vous avez trouvé le bon chiffre !") 
Write-Host "en $tours coups "
}
elseif ($chiffre -gt "$al") #cas ou l'utilisateur donne un chiffre trop élevé : indice + nombre de tentatives restantes + reprise de la boucle
{
Write-Host "C'est moins"
$speak.Speak("C'est moins") 
Write-Host "Il vous reste $($valeur[$i]) tentatives" 
}
elseif ($chiffre -lt "$al") #cas ou l'utilisateur donne un chiffre trop bas : indice + nombre de tentatives restantes + reprise de la boucle
{
Write-Host "C'est plus"
$speak.Speak("C'est plus") 
Write-Host "Il vous reste $($valeur[$i]) tentatives" 
}
}
}
"Non" {"Alors... AU BOULOT!"
$speak.Speak("Alors, AU BOULOT!")
Start-Process outlook.exe}  #si l'utilisateur choisi non, un message l'incitant a retourner travailler apparait et le programme lance outlook"
Default { "fatal error, veuillez relancer l'application" 
$speak.Speak("fatal error, veuillez relancer l'application") 
}   #si l'utilisateur répond autre chose, un message d'erreur apparait et le script s'arréte. Il s'agit en fait du troisiéme choix du menu : un choix "caché", qui ne lance rien, d'ou l'arrêt du script
}
