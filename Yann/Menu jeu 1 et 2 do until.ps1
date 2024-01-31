# Programme création d'OU

    CLS

    Write-Host "Programme de création d'OU."

# Obtention du nom du domaine et du nom de l'ordinateur

    $DomainName = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    $ServerName = $ENV:COMPUTERNAME

# Divisez la chaîne de caractères en deux sous-chaînes

    $DC = $DomainName -split '\.'
    $DC1 = $DC[0]
    $DC2 = $DC[1]

# Création de l'OU

    $OU1 = Read-Host "Entrez votre OU racine"

    New-ADOrganizationalUnit -Name "$OU1" -Path "DC=$DC1,DC=$DC2" -ProtectedFromAccidentalDeletion $false -Server "$ServerName.$DC1.$DC2"
    write-host  "L'OU $OU1 a été créée dans DC=$DC1,DC=$DC2"

#Choix 

    $Choice1 = Read-Host "Souhaitez-vous créer:`n1-Une sous OU?`n2-Une OU service?"

#Boucle si erreur choix

    while ($Choice1 -ne 1 -and $Choice1 -ne 2)    
        {
        $Choice1 = Read-Host "Je n'ai pas compris votre choix. Souhaitez-vous créer:`n1-Une sous OU?`n2-Une OU service (direction, compta, administratif..)?"
        }

#Choix 1

Switch ($Choice1)
        {
          1 {
            $OU2 = Read-Host "Entrez le nom de votre sous OU"
            New-ADOrganizationalUnit -Name "$OU2" -Path "OU=$OU1,DC=$DC1,DC=$DC2" -ProtectedFromAccidentalDeletion $false -Server "$ServerName.$DC1.$DC2"
            write-host  "L'OU $OU2 a été créée dans OU=$OU1,DC=$DC1,DC=$DC2"
            }

#Choix2

    
         2 {
        $Service1 = Read-Host "Entrez le nom du service? (Les sous OU Users et Computers seront automatiquement créés dedans)"

        New-ADOrganizationalUnit -Name "$Service1" -Path "OU=$OU1,DC=$DC1,DC=$DC2" -ProtectedFromAccidentalDeletion $false -Server "$ServerName.$DC1.$DC2"
        New-ADOrganizationalUnit -Name "Users" -Path "OU=$Service1,OU=$OU1,DC=$DC1,DC=$DC2" -ProtectedFromAccidentalDeletion $false -Server "$ServerName.$DC1.$DC2"
        New-ADOrganizationalUnit -Name "Computers" -Path "OU=$Service1,OU=$OU1,DC=$DC1,DC=$DC2" -ProtectedFromAccidentalDeletion $false -Server "$ServerName.$DC1.$DC2"

        write-host  "L'OU $Service1 a été créée dans OU=$OU1,DC=$DC1,DC=$DC2"
           }
        }