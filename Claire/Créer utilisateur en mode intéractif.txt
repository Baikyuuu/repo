Write-Host "# Création d'un utilisateur dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan

Do{ $UtilisateurPrenom = Read-Host -Prompt "Prénom" }While($UtilisateurPrenom -eq "") #boucle tant que la question n'est pas remplie
Do{ $UtilisateurNom = Read-Host -Prompt "Nom" }While($UtilisateurNom -eq "") #boucle tant que la question n'est pas remplie

$UtilisateurLogin = (($UtilisateurPrenom).Substring(0,1) + "." + $UtilisateurNom).ToLower()  #remplit auto login (1ère lettre prénom.nom) en minuscule avec .ToLower

$UtilisateurMotDePasse = (ConvertTo-SecureString –AsPlainText "P@ssword" -Force) #donne automatiquement 'P@ssw0rd' comme mot de passe

$UtilisateurEmail = "$UtilisateurLogin@$((Get-ADDomain).DNSRoot)" #définit automatiquement l'@ avec login + domaine

$UtilisateurFonction = Read-Host -Prompt "Fonction"
$UtilisateurOU = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Choisissez une OU pour cet utilisateur" -PassThru
$UtilisateurGroupes = (Get-ADGroup -Filter * -SearchBase "OU=OU_GroupesGlobaux, DC=nau-agri,DC=fr").Name | Out-GridView -Title "Choisissez un ou plusieurs groupes pour cet utilisateur" -PassThru

Write-Host "# Formulaire complété, le compte va être créé dans l'Active Directory..." -ForegroundColor Cyan

# Vérifier la présence de l'utilisateur dans l'AD
if (Get-ADUser -Filter {SamAccountName -eq $UtilisateurLogin})
{
    Write-Warning "L'identifiant $UtilisateurLogin existe déjà dans l'AD"
}
else
{
    New-ADUser -Name "$UtilisateurNom $UtilisateurPrenom" `
               -DisplayName "$UtilisateurNom $UtilisateurPrenom" `
               -GivenName $UtilisateurPrenom `
               -Surname $UtilisateurNom `
               -SamAccountName $UtilisateurLogin `
               -UserPrincipalName "$UtilisateurLogin@$((Get-ADDomain).DNSRoot)" `
               -EmailAddress $UtilisateurEmail `
               -Title $UtilisateurFonction `
               -Path $UtilisateurOU `
               -AccountPassword $UtilisateurMotDePasse `
               -ChangePasswordAtLogon $true `
               -Enabled $true

    Write-Host "# Création de l'utilisateur pour $UtilisateurNom $UtilisateurPrenom : $UtilisateurLogin" -ForegroundColor Cyan
}

Foreach($Groupe in $UtilisateurGroupes){
   Write-Host "# L'utilisateur $UtilisateurLogin va être ajouté au groupe $Groupe" -ForegroundColor Cyan
   Add-ADGroupMember -Identity $Groupe -Members $UtilisateurLogin
}
