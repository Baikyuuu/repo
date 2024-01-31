#Scripts créations d'utilisateurs

CLS

do
{
    $Choice = Read-Host "Nouvel utilisateur? 1 pour oui 2 pour non"

        while ($Choice -ne 1 -and $Choice -ne 2)
    {
            $Choice = Read-Host "Nouvel utilisateur? 1 pour oui 2 pour non"
    }

    switch ($Choice)
    {

    1

        {
        $Prenom = Read-Host "Prénom:"
        $Nom = Read-Host "Nom:"
        $Login = ($Prenom.Substring(0,1)+"."+$Nom).toLower()
        $Mail = "$Login@fly-ing.fr"
        $Password = "P@ssw0rd"

        #Vérification présence utilisateur sur l'AD

        if (Get-ADUser -Filter {SamAccountName -eq $Login})
            {
            Write-Warning "Cet utilisateur existe déjà!"
            }
        else
            {
        New-ADUser -Name "$Nom $Prenom" `
                    -DisplayName "$Nom $Prenom" `
                    -GivenName $Prenom `
                    -Surname $Nom `
                    -SamAccountName $Login `
                    -UserPrincipalName "$Login@fly-ing.fr" `
                    -EmailAddress $Mail `
                    -Path "OU=Personnel,DC=fly-ing,DC=fr" `
                    -AccountPassword(ConvertTo-SecureString $Password -AsPlainText -Force) `
                    -ChangePasswordAtLogon $true `
                    -Enabled $true

        Write-Output "Création de l'utilisateur : $Login ($UtilisateurNom $Prenom)"
            }
        }

    2

        {
    break
        }
    }
}
until ($Choice -eq 2)

