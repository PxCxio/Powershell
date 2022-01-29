#Use module since I activated Narrator and Speech to text
Import-Module PSReadLine 

#SET/EXPORT Used Variables throughout Year-Semester
function goclass ($arg){
cd "$HOME\Documents\MastersDeg\Classes\Semester4\$arg"
}

$Proj3="$HOME\Documents\MastersDeg\Classes\Semester3\CEN5079SecProgramming\Project3\"
###########
Set-Alias vi vim

function sign ($filename) {

  $cert = @(gci cert:\currentuser\my 

-codesigning)[0]

Set-AuthenticodeSignature $filename $cert

}

function vgrnt {
cd "$HOME\Documents\Vagrant"
}

function bar {
cd "$HOME\Documents\pianobar\pianobar-windows-binaries" 
./pianobar
}

function firefox {
& 'C:\Program Files\Mozilla Firefox\firefox.exe'
}

function swriter {
& 'C:\Program Files\LibreOffice\program\swriter.exe'
}

function stp ($arg){
Get-Process "$arg" | Stop-Process
}

function chrome {
& '..\..\Program Files\Google\Chrome\Application\chrome.exe'
}

function ardour {
& '..\..\Program Files\Ardour6\bin\Ardour.exe'
}

function obs {
cd "C:\Program Files\obs-studio\bin\64bit"
./obs64.exe
}

function putty {
C:\ProgramData\chocolatey\bin\PUTTY.EXE
}

function toDo {
vi %TEMP%/toDo.txt
}

function OCRPDF($in, $out){
python C:\Users\xyriux\Documents\Coding\conda\OCRPDf.py "$in" "$out"
}


function hypv {
    bcdedit /set hypervisorlaunchtype auto  
    shutdown /r /t 00
}

function vmwr {
     bcdedit /set hypervisorlaunchtype off  
     shutdown /r /t 00
}

function kalix {

 wsl -d kali-linux
 
}

function hashcat ($Args) {
cd C:\Users\xyriux\Documents\hashcat-5.1.0
./hashcat64.exe "$Args"
}

function john ($Args){
cd C:\Users\xyriux\Documents\JtR\run\kernels
../john.exe "$Args"
}

#set-alias conda 'C:\tools\miniconda3\_conda.exe'

#function enc ($in, $out){
#openssl enc -aes-256-cbc -md sha512 -salt -in "$in" -out "$out"
#}


function enc ($in, $out){
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -salt -in "$in" -out "$out"
}


#function dec ($in, $out){
#openssl enc -d -aes-256-cbc -md sha512 -in "$in" -out "$out"
#}

function dec ($in, $out){
openssl enc -d -aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -salt -in "$in" -out "$out"
}

function 7zc ($in,$out) {
7z a $out $in
}

function 7zd ($in,$out) {
7z x $in -o$out	 
}

function rwebcm ($filename) {
ffmpeg -f dshow -i video="Integrated Camera" -f dshow -i audio="Microphone Array (Synaptics Audio)" $HOME\Videos\MKV\$filename.mkv
}

function rdsk ($filename) {
ffmpeg -f gdigrab -framerate 30 -i desktop $HOME\Videos\MKV\$filename.mkv
}

function psbmkv2mp4{
Get-ChildItem -Filter '*.mkv' | % { &ffmpeg -i .\$($_.BaseName).mkv -c copy .\$($_.BaseName).mp4 }
}

#function tesseract ($Args) {
#.$HOME\AppData\Local\Programs\Tesseract-OCR\tesseract.exe "$Args" 
#}

function .3 {cd ..\..\..}

Set-Alias ..3 .3

function wtop { while (1) { ps | sort -desc cpu | select -first 30; sleep -seconds 2; cls }}
function whogs { ps | sort -desc cpu | select -first 27}

function rm ($Args) { Remove-Item $Args Confirm:$True }

function mkcd ($1) { mkdir -p "$1" ; cd "$1";}

Set-Alias mcd mkcd

function lsgrep ($Args) {Get-ChildItem -Path "$Args"}

function compDir($fs,$fsoB){
$fso = Get-ChildItem -Recurse -path $fs 
$fsoBU = Get-ChildItem -Recurse -path $fsoB
Compare-Object -ReferenceObject $fso -DifferenceObject $fsoBU
}

function compHashDir($Source,$Dest){
$SourceDocs = Get-ChildItem –Path $Source | foreach  {Get-FileHash –Path $_.FullName}
$DestDocs = Get-ChildItem –Path $Dest | foreach  {Get-FileHash –Path $_.FullName}
compare-Object -ReferenceObject $SourceDocs.Hash  -DifferenceObject $DestDocs.Hash
echo "----------------------------------------------------------------------------------"
(Compare-Object -ReferenceObject $SourceDocs -DifferenceObject $DestDocs  -Property hash -PassThru).Path
}

#WhenInBootCamp
function script:bootToOsX
{
    & "C:\Program Files\Boot Camp\Bootcamp.exe" -StartupDisk "Macintosh HD"
    restart-computer -force
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function getPubIP() {dig +short myip.opendns.com `@resolver1.opendns.com}

#Awk Splitter $1 delimiter, $2 index0 which object
function awkF ($1) {%{ $_.Split('"')[$1]; }}
set-alias awkX awkF

function mix(){
start ms-settings:apps-volume
}


function srtDate (){

ls | Sort-Object -Property @{Expression = {$_.CreationTime - $_.LastWriteTime}; Descending = $False} 
}

function termTrans(){
C:\Users\xyriux\Documents\Coding\AutoHotkey\WinTransparency.ahk
}

####VirtualBox

function vvm-start ($VM){
VBoxManage startvm $VM --type headless
}

function vvm-stop ($VM){
VBoxManage controlvm $VM poweroff 
}

function vvm-reset ($VM) {
VBoxManage controlvm $VM reset
}

function vvm-pause ($VM) {
VBoxManage controlvm $VM pause
}

function vvm-resume ($VM) {
VBoxManage controlvm $VM resume
}

function dEcho () {
echo "the VM is:" $VM
}

function cd.. () {
cd ..
}

function .. () {
cd ..
}

function ..2 () {
cd ..\..\
}


function .3 () {
cd ..\..\..
}

function BigO(){
cat ~/Desktop/BigOSheet
}

function SortRuntimes(){
cat C:\Users\xyriux\Documents\MastersDeg\Classes\Semester4\COT5407IntroAlgo\SortRuntimes.txt
}

#CreateVM
function vvm-create ($VM, $SIZE, $MEM, $isoFile) {
#ISO OS
#$OS = VBoxManage unattended detect --iso=$isoFile
VBoxManage createvm --name $VM --ostype "Debian_64" --register --basefolder "$HOME\VirtualBox VMs\New group"

#SetMem&Network

#Set IO APIC
VBoxManage modifyvm $VM --ioapic on                     
#Add Memory
VBoxManage modifyvm $VM --memory $MEM --vram 128       
#Set Network Adapter
$BRG = Get-NetAdapter -Name Wi-Fi | select -Expand interfaceDescription
VBoxManage modifyvm $VM --nic1 bridged --bridgeadapter1 "$BRG"

#PortForwarding Option
#VBoxManage modifyvm $VM --natpf1 "SSH,tcp,127.0.0.1,2522,10.0.2.15,22"

#CreatDisk&ConnectISO
VBoxManage createhd --filename "$HOME/VirtualBox VMs/New group/$VM/$VM_DISK.vdi" --size $SIZE --format VDI                     
VBoxManage storagectl $VM --name "SATA Controller" --add sata --controller IntelAhci       
VBoxManage storageattach $VM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  "$HOME/VirtualBox VMs/New group/$VM/$VM_DISK.vdi"               
VBoxManage storagectl $VM --name "IDE Controller" --add ide --controller PIIX4       
VBoxManage storageattach $VM --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium "$HOME/VirtualBox VMs/New group/debian.iso"      
VBoxManage modifyvm $VM --boot1 dvd --boot2 disk --boot3 none --boot4 none 

#Specify (host) location of a shared folder
#VBoxManage sharedfolder add $VM --name shr --hostpath "$(get-location)\sharedFolder" --automount

#Set RDP
VBoxManage modifyvm $VM --vrde on                  
VBoxManage modifyvm $VM --vrdemulticon on --vrdeport 10001

}

function vvm-disp () {
$env:path="C:\Program Files\Oracle\VirtualBox;$env:path"

$VMD = "Disposable"
$SIZED = "5000"
$MEMD = "1024"

vvm-create $VMD $SIZED $MEMD $isoFile

# Download debian.iso
if ( ! (Test-Path "$HOME\VirtualBox VMs\New group\debian.iso")){
    wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.5.0-amd64-netinst.iso -O "$HOME\VirtualBox VMs\New group\debian.iso"

$USR = Read-Host "To Set Up Disposable, type User"
$PWD = Read-Host "To Set Up Disposable, type Password"
$isoFile = "$HOME\VirtualBox VMs\New group\debian.iso"
#$OS = VBoxManage unattended detect --iso=$isoFile
$TempBPath = $env:USERPROFILE
mkdir "$TempBPath\unattended-install-XXXXX" -ea 0
$TempBPathX = "$env:USERPROFILE\unattended-install-XXXXX"
start-sleep -s 3

VBoxManage unattended install --auxiliary-base-path $TempBPathX/ $VMD --user=$USR --password=$PWD --full-user-name=xy --country=US --time-zone=EST --locale=en_US --language=en-US --hostname=server01.example.com  --install-additions --iso=$isoFile --post-install-command="VBoxControl guest property set installation_finished y" 
sed -i 's/^default vesa.*/default install/' $TempBPathX/isolinux-isolinux.cfg

VBoxManage setextradata $VMD GUI/RestrictedRuntimeMenus ALL 
VBoxManage startvm $VMD --type headless
VBoxManage guestproperty wait $VMD installation_finished
VBoxManage snapshot $VMD take after-installation
#delete TempDirectories?
#rm "$TempBPath\unattended-install-XXXXX" 

}
else{

$isoFile = "$HOME\VirtualBox VMs\New group\debian.iso"
$TempBPath = $env:USERPROFILE
mkdir "$TempBPath\unattended-install-XXXXX" -ea 0
$TempBPathX = "$env:USERPROFILE\unattended-install-XXXXX"

VBoxManage setextradata $VMD GUI/RestrictedRuntimeMenus ALL 
VBoxManage unattended install --auxiliary-base-path $TempBPathX/ $VMD --user=$USR --password=$PWD --country=US --time-zone=EST --locale=en_US --language=en-US --hostname=server01.example.com --install-additions --iso=$isoFile 

sed -i 's/^default vesa.*/default install/' $TempBPathX/isolinux-isolinux.cfg
#VBoxManage snapshot  $VMD restore after-installation
VBoxHeadless --startvm Disposable
}

}

function gpgPWD (){
if (!(Test-Path $pwdPath)){
#Ask First Time For Pwd
$pass = Read-Host 'Guest User Password'
mkdir -p $HOME/.gnupg/.xvm -ea 0
echo $pass > $HOME\.gnupg\.xvm\$VM
$upwdPath =  "$HOME/.gnupg/.xvm/""$VM"""
gpg -e $upwdPath
}
}

function sshKey () {
$FILE = "$HOME\.ssh\$VM.gpg"
	if (!(Test-Path $FILE)){
ssh-keygen -f $HOME\.ssh\$VM.gpg -t ecdsa -b 521 
ssh-copy-id $gu@$gIP -i $HOME/.ssh/$VM 
echo "key generated"
}
}

function vvm-run ($VM, $gu, $cmd) {
$pwdPath = "$HOME/.gnupg/.xvm/$VM.gpg"
gpgPWD
$gp = (gpg --decrypt $pwdPath)
$gIP = VBoxManage guestproperty get $VM "/VirtualBox/GuestInfo/Net/0/V4/IP"  | awk -F: '{ print $2 }'| sed s/" "//g
echo "the ip is $gIP"  
$WifiIP = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress
sshKey
ssh -t $gu@$gIP "export DISPLAY=""$WifiIP"":0.0;  $cmd " 
}


function vvm-delete ($VM){
VBoxManage controlvm $VM poweroff
VBoxManage unregistervm $VM --delete
rmdir -recurse $VM
rm $HOME\.ssh\$VM.gpg 
if ($VM -eq "Disposable"){
rm "$HOME\VirtualBox VMs\New group\debian.iso"
}
}

function vvm-gls($VM, $gu){
<#
    .vvm-gls
    Displays processes in guest 
    Uses: vvm-gl [vm] [guestUser]
#>
$pwdPath = "$HOME/.gnupg/.xvm/$VM.gpg"
$gp = (gpg --decrypt $pwdPath)
$gIP = VBoxManage guestproperty get $VM "/VirtualBox/GuestInfo/Net/0/V4/IP"  | awk -F: '{ print $2 }'| sed s/" "//g
$Wifi = Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi
$WifiIP = $Wifi.IPAddress

ssh -t $gu@$gIP "export DISPLAY=""$WifiIP"":0.0;  "ps -ef" " 

#VBoxManage guestcontrol --username dsp --password $gp $VM list all
}

function vvm-ls(){
VBoxManage list vms
}

####VMWare

function wvm-start ($VM) {
$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
vmrun -T ws start $vmPath nogui
}

function wvm-stop ($VM) {
$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
vmrun -T ws stop $vmPath soft
}

function wvm-reset ($VM) {
$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
vmrun -T ws reset $vmPath soft
}

function wvm-suspend ($VM) {
$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
vmrun -T ws suspend $vmPath soft
}

function wvm-unpause ($VM) {
$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
vmrun -T ws unpause $vmPath soft
}

function wvm-run ($VM, $gu, $cmd) {
#takes 3 arguments guestuser, pwdPath and the command

$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
$pwdPath = "$HOME/.gnupg/.xvm/$VM.gpg"

if (!(Test-Path $pwdPath)){
#Ask First Time For Pwd
$pass = Read-Host 'Guest User Password'
mkdir -p $HOME/.gnupg/.xvm -ea 0
echo $pass > $HOME\.gnupg\.xvm\$VM
$upwdPath =  "$HOME/.gnupg/.xvm/""$VM"""

gpg -e $upwdPath
$gp = (gpg --decrypt $pwdPath)
}

#check for tools
$chkTools = (vmrun checkToolsState ""$vmPath"" )
echo $chkTools

if ( $chkTools -ne "running" )
{
echo "VMTools Havent been installed. Installing..."
vmrun installTools $vmPath
}
else
{
#vmrun -T ws -gu $gu -gp $gp runProgramInGuest $vmPath -activeWindow /bin/bash ""$cmd"" ;

$gIP = vmrun -T ws getGuestIPAddress ""$vmPath""
echo "IP is: $gIP "
$Wifi = Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi
$WifiIP = $Wifi.IPAddress

$FILE = "$HOME\.ssh\$VM.gpg"

	if (!(Test-Path $FILE)){
ssh-keygen -f $HOME\.ssh\$VM.gpg -t ecdsa -b 521 
ssh-copy-id $gu@$gIP -i $HOME/.ssh/$VM 
echo "key generated"
#vmrun -T ws -gu Dbxiatan -gp $pwdX start "$VM" nogui & sleep 5;
}

ssh -t $gu@$gIP " export DISPLAY=""$WifiIP"":0.0;  $cmd " 

}
}

function wvm-gls ($VM, $gu){

$vmPath = gci -Path $HOME"\Documents\Virtual Machines" -recurse -include ""$VM"".vmx | select -Expand FullName
$pwdPath = "$HOME/.gnupg/.xvm/""$VM"".gpg"
$gp = (gpg --decrypt $pwdPath)

vmrun -T ws -gu $gu -gp $gp listProcessesInGuest ""$vmPath"";

}

function wvm-disp () {
mkdir $HOME"\Documents\Virtual Machines\Disposable\"
vmware-vdiskmanager -c -t 0 -s 5GB -a ide "$HOME\Documents\Virtual Machines\Disposable\Disposable.vmdk"

}

