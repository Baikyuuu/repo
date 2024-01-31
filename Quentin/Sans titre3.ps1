cls
Write-Output "Le nombre Mystère est compris entre 0 et 1000"

$random = Get-Random -Minimum 0000 -Maximum 1000
$tentative = 15

while ($tentative -gt 0) {
    Write-Host "`nIl vous reste" -NoNewline
    Write-Host " $tentative " -ForegroundColor Green -NoNewline
    Write-Host "chances!`n "

    $variable = Read-Host "Quel est le nombre mystère ?"

    if ($variable -lt $random) {
        Write-Output "C'est plus !"
    }
    elseif ($variable -gt $random) {
        Write-Output "C'est moins !"
    }
    else {
        Write-Output "Vous avez gagné, le nombre mystère était bien : $random. Vous avez trouvé en $tentative coups. Missile nucléaire lancé."
        break
    }

    $tentative--

    if ($tentative -eq 0) {
        Write-Host "Perdu, plus de 15 tentatives. Vous êtes officiellement une merde."
    }
}

