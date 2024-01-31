$proposition = Read-Host -Prompt  "Que voulez-vous faire ? Créer une OU: tapez 1 Modifier une OU: tapez 2 Supprimer une OU : tapez 3" # mise en place du menu
switch ($proposition)
{
    "1"{Write-Host "# Création d'une OU dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan
Do{ $Name = Read-Host -Prompt "Nom" }While($Name -eq "")
Do{ $OUDescription = Read-Host -Prompt "Description de L'OU"}While($GroupDescription -eq "")
Write-Host "# Formulaire complet, l'OU va être crée dans l'Active Directory" -ForegroundColor Cyan
New-ADOrganizationalUnit -Name "$Name" `
                         -Path "DC=Shinra,DC=corp" `
                         -Description "$OUDescription" 
Write-Host "# Création de l'OU $Name" -ForegroundColor Cyan
}
  "2"{Write-Host "# modification d'une OU dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan
Do{ $Name = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Choisissez l'OU a modifier" -PassThru }While($OU -eq "")
Do{ $OUDescription = Read-Host -Prompt "Rajoutez une description de L'OU"}While($GroupDescription -eq "")
Set-ADOrganizationalUnit -identity "$Name" `
                         -Description "$OUDescription" 
Write-Host "# Modification de l'OU $Name" -ForegroundColor Cyan}
    "3"{Write-Host "# SUpression d'une OU dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan
$Name = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Sélectionnez l'OU à supprimer" -PassThru
"$Name" | Set-ADOrganizationalUnit  -ProtectedFromAccidentalDeletion $False 
"$Name" | Remove-ADOrganizationalUnit -Recursive
Write-Host "# supression de l'OU $Name" -ForegroundColor Cyan}
}