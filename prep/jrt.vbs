' simulating key presses for jrt
' https://www.codeproject.com/Tips/647828/Press-Any-Key-Automatically-Usi
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.AppActivate "junkware removal tool"
WScript.Sleep 5000 ' wait 5 seconds for jrt to check for updates
WshShell.SendKeys "a"
WScript.Sleep 3500 ' a half second so the computer is still with us
' WshShell.SendKeys "a" ' another keypress in case we missed the first one
WshShell.SendKeys "^c" ' cancel system restore
WScript.Sleep 3500
WshShell.SendKeys "n" ' enter no at the terminate batch job prompt
WshShell.SendKeys "{ENTER}"
' another key press in case the system restore fails
WScript.Sleep 3000
WshShell.SendKeys "a"