# ReverseWOL
Lets you turn off your PC with a WOL packet

To make this functional on start up you have to create a shortcut of the file with the following parameters C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "& 'C:\Users\<PATH>\<To>\reversewol.ps1'" -WindowStyle Hidden

Then move that shortcut to the Startup Folder, you can quickly access it by WinKey+R and typing shell:startup or you can find it here C:\Users\<User>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
