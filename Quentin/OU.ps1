 $OUExist = [adsi]::Exists("LDAP://OU=TESTING,OU=Computers,OU=DomainName,dc=Domain,dc=RootDomain")
if ($OUExist)
{
    "It already exists"
} Else {
    "Creating the OU"
    New-ADOrganizationalUnit -Name 'TESTING' -Path "OU=Computers,OU=DomainName,dc=Domain,dc=RootDomain"
}


 $OUExist = [adsi]::Exists("LDAP://OU=TESTING,OU=Computers,OU=DomainName,dc=Domain,dc=RootDomain")
if ($OUExist)
{
    "OU already exists"
} Else {
    "OU does NOT exist"
}-ADOrganizationalUnit -Path 'OU=$OU4,OU=$OU1,DC=tssr,DC=acab' -Name 'Computers' -Verbose