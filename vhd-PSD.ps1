Enter-PSSession -VMName $1
Invoke-Command -VMName $1 -ScriptBlock {$2}