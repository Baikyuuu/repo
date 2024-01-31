New-ADOrganizationalUnit -Path 'DC=tssr,DC=acab' -Name 'OU1' -Verbose
New-ADOrganizationalUnit -Path 'DC=tssr,DC=acab' -Name 'OU2' -Verbose
New-ADOrganizationalUnit -Path 'OU=OU2,DC=tssr,DC=acab' -Name 'Users' -Verbose
New-ADOrganizationalUnit -Path 'OU=OU2,DC=tssr,DC=acab' -Name 'Computers' -Verbose
New-ADOrganizationalUnit -Path 'OU=OU1,DC=tssr,DC=acab' -Name 'Users' -Verbose
New-ADOrganizationalUnit -Path 'OU=OU1,DC=tssr,DC=acab' -Name 'Computers' -Verbose