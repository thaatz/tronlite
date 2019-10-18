# Tronlite
This is a system maintenance script that is intended to be similar to [TronScript](https://www.reddit.com/r/TronScript/), but with more focus on fixing back-end operating system functionality and less on removing things, debloating, or updating anything. It is also meant to allow the user a little bit more control over what is done in the script.

Tronlite is currently being developed to support Windows XP onwards.

The included `settings.ini` file will accomplish the following:
1. download/update ccleaner and run cleanup via [ccleaner-autoupdate](https://github.com/thaatz/ccleaner-autoupdate)
2. download/update Emsisoft Emergency Kit and run malware scan (Windows 7+) via [Disinfectant](https://github.com/thaatz/disinfectant)
3. run [System File Checker](https://support.microsoft.com/en-us/help/929833/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system) and [Deployment Image Servicing and Management](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/dism---deployment-image-servicing-and-management-technical-reference-for-windows) via [xpSFC](https://github.com/thaatz/xpsfc)
4. download/update defraggler and run defrag via [ccleaner-autoupdate](https://github.com/thaatz/ccleaner-autoupdate)

### Recommended Scripts
* [SMART startup (HDD SMART status check)](https://github.com/thaatz/smart-startup)
* [Disinfectant (antimalware)](https://github.com/thaatz/disinfectant)
* [xpSFC (System file repair)](https://github.com/thaatz/xpsfc)

---

#### todo/ideas man
* make a log folder on to put all log files into
* [done] schedule chkdsk /f then reboot at completion instead of checking and then scheduling (this way chkdsk runs only one time)
* [nah b/c windows xp only] pagedefrag -o

#### dev notes for windows xp support
this is on the backburner, but here are some notes for windows xp
- ccleaner updating script would need to use wget 1.19.4 from https://eternallybored.org/misc/wget/
- emsisoft emergency kit does not support windows xp https://help.emsisoft.com/en/1805/why-can-t-i-install-an-emsisoft-product-on-windows-xp-vista/
