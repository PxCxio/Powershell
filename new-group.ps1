New-ADGroup -Name "$1" -SamAccountName $1 -GroupCategory Security -GroupScope Global -Path "CN=Users,DC=ID,DC=Internal"