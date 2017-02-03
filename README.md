# Tronlite
This is a system maintenance script that is intended to be similar to TronScript (https://www.reddit.com/r/TronScript/), but with more focus on fixing back-end operating system functionality and less on removing things or updating anything. It is also meant to allow the user a little bit more control over what is done in the script.

Tronlite, on its own, doesn't really do much, but is meant to serve as a back-end for other scripts to help in automating system maintenance.

Tronlite is currently being developed to support Windows XP onwards.

The following example scripts have been included:
* fully automated JRT
* rkill
* ccleaner portable
* defraggler portable

todo/ideas man
* [done] schedule chkdsk /f then reboot at completion instead of checking and then scheduling (this way chkdsk runs only one time)
* [nah b/c windows xp only] pagedefrag -o
