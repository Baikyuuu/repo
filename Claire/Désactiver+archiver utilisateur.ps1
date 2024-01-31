Write-Host "# Désactiver et archiver un utilisateur dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan

Do{ $UtilisateurPrenom = Read-Host -Prompt "Prénom" }While($UtilisateurPrenom -eq "") #boucle tant que la question n'est pas remplie
Do{ $UtilisateurNom = Read-Host -Prompt "Nom" }While($UtilisateurNom -eq "") #boucle tant que la question n'est pas remplie
$UtilisateurLogin = (($UtilisateurPrenom).Substring(0,1) + "." + $UtilisateurNom).ToLower()  #remplit auto login (1ère lettre prénom.nom) en minuscule avec .ToLower

#retirer l'utilisateur des gpes dont il est membre
Get-AdPrincipalGroupMembership -Identity $UtilisateurLogin | Where-Object { $_.Name -Ne "Utilisateurs du domaine" } | Remove-AdGroupMember -Members $UtilisateurLogin -Confirm:$false 

#Désactiver l'utilisateur
Set-ADUser -Identity $UtilisateurLogin -Enabled:$false -Description "Désactivé le $(Get-Date -Format dd/MM/yyyy)"

#Déplacer l'utilisateur dans une OU dédiée aux comptes archivés

$UtilisateurOU = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Choisissez  l'OU de cet utilisateur" -PassThru

$DN = "CN=$UtilisateurNOM $UtilisateurPrenom, $UtilisateurOU"
$OUArchivage = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Choisissez  l'OU Users dans OU_Archivage" -PassThru

Move-ADObject -Identity "$DN" -TargetPath "$OUArchivage"