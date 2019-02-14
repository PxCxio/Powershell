	
alias vi vim

function sign ($filename) {
  $cert = @(gci cert:\currentuser\my 
-codesigning)[0]
Set-AuthenticodeSignature $filename $cert
}


function ..3 {cd ..\..\..}
alias .3 ..3

function mkcd { mkdir -p "$1" && cd "$1";}
alias mcd mkcd

function script:bootToOsX 
{ 
    & "C:\Program Files\Boot Camp\Bootcamp.exe" -StartupDisk "Macintosh HD" 
    restart-computer -force 
} 