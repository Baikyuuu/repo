Write-Host "# Création d'un utilisateur dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan
$UtilisateurPrenom = Read-Host -Prompt "Prénom" 
$UtilisateurNom = Read-Host -Prompt "Nom"
$UtilisateurLogin = Read-Host -Prompt "Identifiant"
$UtilisateurMotDePasse = Read-Host -Prompt "Mot de passe" -AsSecureString
$UtilisateurEmail = Read-Host -Prompt "Adresse e-mail"
$UtilisateurFonction = Read-Host -Prompt "Fonction"
$UtilisateurOU = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Choisissez une OU pour cet utilisateur" -PassThru
$UtilisateurGroupes = (Get-ADGroup -Filter * -SearchBase "OU=Organisation,OU=Groupes,DC=tssr,DC=acab").Name | Out-GridView -Title "Choisissez un ou plusieurs groupes pour cet utilisateur" -PassThru
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