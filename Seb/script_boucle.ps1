cls
$reponse = " "
while ($reponse -notlike "Bien") 
{
$reponse = read-host "Comment allez-vous ?" 
if ($reponse -eq "Bien") 
{
Write-Host "Bonne réponse !"
}
else
{
Write-Host "Vous n'avez pas donné la bonne réponse"
}
}