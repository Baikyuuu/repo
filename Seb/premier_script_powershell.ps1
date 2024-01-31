cls
# cls = nettoyage
$dateetheure = Read-Host "Bonjour et bienvenue à l'horloge muette !
Désirez-vous connaitre le jour et l'heure ? Oui/Non"  
if ($dateetheure -Like "Oui") 
{ 
Write-Host "Nous sommes le" -ForegroundColor White -BackgroundColor Black 
Get-Date -Format "dd/MM/yyyy" 
Write-Host "et il est" -ForegroundColor White -BackgroundColor Black 
Get-Date -Format "HH:mm:ss" 
} 
elseif ($dateetheure -Like "Non") 
{ 
Write-Host "Ben, qu'est-ce que vous faite là alors ?" -ForegroundColor Green -BackgroundColor Black 
} 
else
{ 
Write-Host "Mauvaise réponse, veuillez relancer l’application" -ForegroundColor Red -BackgroundColor Black 
}  
 
