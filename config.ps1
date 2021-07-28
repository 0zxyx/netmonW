$p = pwd
start-process -verb runas powershell -argumentlist "mkdir c:\Users\$env:username\netm ;cp $p\netm.ps1 c:\Users\$env:username\netm\ ;cp $p\netm.bat c:\Users\$env:username\desktop\"
