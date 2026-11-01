# File Viewer for V2Mac Sandbox

Opens a PDF or Office file you don't trust in a V2Mac mini VM, not on your Mac. Put the file in the mini VM's Shared folder (`~/V2Mac Sandbox/<Mini VM>/Shared`) and pick it in the app. Debian supplies and updates Evince and LibreOffice. Macros, active content and link updates are locked off.

It doesn't make a bad file harmless. A successful attack is kept away from your Mac's other files and its IP, but it can read and change that mini VM's Shared folder and send data through its exit. Use a mini VM just for this and keep only the files you want to view there.

Build: `Scripts/package.sh . "$(cat base.txt)" <url prefix>`. Release: push a `v*` tag. Built from [v2mac-plugin-template](https://github.com/v2macapp/v2mac-plugin-template). Licence: 0BSD.
