Write-Host "# Création d'uue OU dans le domaine $((Get-ADDomain).DNSRoot)" -ForegroundColor Cyan
Write-Host "# Veuillez renseigner les différents champs ci-dessous" -ForegroundColor Cyan
$OU1 = Read-Host -Prompt "OU1" 
$OU2 = Read-Host -Prompt "OU2 after OU1"
$OU3 = Read-Host -Prompt "OU3 after OU1"
$OU4 = Read-Host -Prompt "OU4 after OU1"
#The command below uses the New-ADOrganizationUnit cmdlet to create a root OU called $OU1
New-ADOrganizationalUnit -Path 'DC=tssr,DC=acab' -Name '$OU1' -Verbose

#The commands below use the New-ADOrganizationUnit cmdlet to create three new sub 
#OUs called $OU2, OU3, and $OU4

New-ADOrganizationalUnit -Path 'OU=$OU1,DC=tssr,DC=acab' -Name '$OU2' -Verbose
New-ADOrganizationalUnit -Path 'OU=$OU1,DC=tssr,DC=acab' -Name '$OU3' -Verbose
New-ADOrganizationalUnit -Path 'OU=$OU1,DC=tssr,DC=acab' -Name '$OU4' -Verbose

#The commands below use the New-ADOrganizationUnit cmdlet to create two new sub OUs for 
#Users and Computers under the Nest OUs that you created earlier

New-ADOrganizationalUnit -Path 'OU=$OU2,OU=$OU1,DC=tssr,DC=acab' -Name 'Users' -Verbose
New-ADOrganizationalUnit -Path 'OU=$OU2,OU=$OU1,DC=tssr,DC=acab' -Name 'Computers' -Verbose

New-ADOrganizationalUnit -Path 'OU=OU3,OU=$OU1,DC=tssr,DC=acab' -Name 'Users' -Verbose
New-ADOrganizationalUnit -Path 'OU=OU3,OU=$OU1,DC=tssr,DC=acab' -Name 'Computers' -Verbose

New-ADOrganizationalUnit -Path 'OU=$OU4,OU=$OU1,DC=tssr,DC=acab' -Name 'Users' -Verbose
New-ADOrganizationalUnit -Path 'OU=$OU4,OU=$OU1,DC=tssr,DC=acab' -Name 'Computers' -Verbose