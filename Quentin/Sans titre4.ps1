cls
 
$continue = $true
while ($continue)
{
write-host "`n------ Devine entre 1 et 1000 ----"
write-host "------- Choisir un niveau ! -----`n"
write-host " Appuyez sur '1' pour 15 chances"
write-host " Appuyez sur '2' pour 10 chances"
write-host " Appuyez sur '3' pour 100 chances"
write-host "  Appuyer sur 'X' pour quitter`n"
write-host "--------------------------------- `n"
$selection = read-host "Choisissez"
 
$randomNumber = Get-Random -Minimum 1 -Maximum 1000
 
switch ($selection)
{
'1' {
for ($cpt = 15 ;$cpt -gt 0; $cpt--)
 
{
write-host "`nIl vous reste" -nonewline
write-host " $cpt " -foregroundColor green -nonewline
write-host "chances!`n "
[int]$number = Read-Host "Choisissez un nombre entre 1 et 1000"
if ($number -ne $randomNumber)
{
        if (($number -ge 1) -and ($number -lt $randomNumber))
        {
        Write-Host "`nTrop bas `n " -ForegroundColor yellow
        }
        if ($number -gt $randomNumber)
        {
        Write-Host "`nTrop haut `n " -ForegroundColor yellow
        }
}
if ($number -eq $randomNumber)
{
Write-Host "`n Bravo vous avez trouvé ! `n"
break
} 
elseif ($number -gt 1000)
{
write-host "Vous etes au dessus de 1000."
}   
} if ($cpt -eq 0)
{write-host "`nC'etait $randomNumber! Try again !" -ForegroundColor green
} 
}
 
'2' {
for ($cpt = 10 ;$cpt -gt 0; $cpt--)
 
{
}
 



write-host "`nIl vous reste" -nonewline
write-host " $cpt " -foregroundColor green -nonewline
write-host "chances!`n "
[int]$number = Read-Host "Choisissez un nombre entre 1 et 1000"
if ($number -ne $randomNumber)
{
        if (($number -ge 1) -and ($number -lt $randomNumber))
        {
        Write-Host "`nTrop bas `n  " -ForegroundColor yellow
        }
        if ($number -gt $randomNumber)
        {
        Write-Host "`nTrop haut `n  " -ForegroundColor yellow
        }
}
if ($number -eq $randomNumber)
{
Write-Host "`n Bravo vous avez trouvé ! `n" -ForegroundColor green
break
} 
elseif ($number -gt 1000)
{
write-host "Vous etes au dessus de 1000."
}      
}
if ($cpt -eq 0)
{write-host "`nC'etait $randomNumber! Try again !" -ForegroundColor green
}
}
'x' {
$continue = $false 
" `nMerci d'avoir joué. 
    A bientôt!!" 
}
}
}