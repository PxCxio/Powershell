<#devcon64.exe disable PCI\VEN_10DE&DEV_1F91&SUBSYS_22A817AA&REV_A1\4&125A03BB&0&0008
sleep 4
devcon64.exe enable PCI\VEN_10DE&DEV_1F91&SUBSYS_22A817AA&REV_A1\4&125A03BB&0&0008
#>

pnputil.exe /restart-device "PCI\VEN_10DE&DEV_1F91&SUBSYS_22A817AA&REV_A1\4&125A03BB&0&0008"
