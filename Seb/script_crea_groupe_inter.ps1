Write-Host "# Création d'un groupe dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan
Do{ $Name = Read-Host -Prompt "Nom" }While($Name -eq "")
Do{ $GroupScope = Read-Host -Prompt "niveau du groupe : DomainLocal ou Global ? (ATTENTION !ne choisisez que parmis ces deux options en respectant minuscules et majuscules, sous peine d'un échec de la création du Groupe !)"}While($GroupScope -eq "")
Do{ $GroupeOU = (Get-ADOrganizationalUnit -Filter *).DistinguishedName | Out-GridView -Title "Choisissez une OU pour ce groupe" -PassThru }While($GrouperOU -eq "")
Do{ $GroupDescription = Read-Host -Prompt "Description du Groupe"}While($GroupDescription -eq "")
Write-Host "# Formulaire complété, le groupe va être créé dans l'Active Directory..." -ForegroundColor Cyan
New-ADGroup -Name "$Name" `
            -Path "$GroupeOU" `
            -GroupScope $GroupScope `
            -Description "$GroupDescription"
Write-Host "# Création du groupe $Name" -ForegroundColor Cyan