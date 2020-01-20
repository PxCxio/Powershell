set-alias vi vim

function bar {
cd C:\Users\xyriux\Documents\pianobar\pianobar-windows-binaries 
./pianobar
}

function sign ($filename) {

  $cert = @(gci cert:\currentuser\my 

-codesigning)[0]

Set-AuthenticodeSignature $filename $cert

}

function rwebcm ($filename) {
ffmpeg -f dshow -i video="Integrated Camera" -f dshow -i audio="Microphone Array (Synaptics Audio)" C:\Users\xyriux\Videos\MKV\$filename.mkv
}

function rdsk ($filename) {
ffmpeg -f gdigrab -framerate 30 -i desktop C:\Users\xyriux\Videos\MKV\$filename.mkv
}

function psbmkv2mp4{
Get-ChildItem -Filter '*.mkv' | % { &ffmpeg -i .\$($_.BaseName).mkv -c copy .\$($_.BaseName).mp4 }
}

function .3 {cd ..\..\..}

set-alias ..3 .3



function mkcd ($1) { mkdir -p "$1" ; cd "$1";}

set-alias mcd mkcd
