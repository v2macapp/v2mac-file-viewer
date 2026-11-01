#!/bin/sh
# Picks a file in Shared and opens it read-only. Home and the LibreOffice profile live in memory, so nothing a document does to them survives closing the app.
# The base's sway makes every window fullscreen, which hides GTK's header bar and the file picker's buttons.
SWAYSOCK=$(ls "$XDG_RUNTIME_DIR"/sway-ipc.*.sock | head -n1) swaymsg 'for_window [all] fullscreen disable' >/dev/null
export HOME=/tmp/viewer SHARED=/root/Shared
# Wayland through GTK: there is no X server here.
export SAL_USE_VCLPLUGIN=gtk3 GDK_BACKEND=wayland
mkdir -p "$HOME"
# Debian updates LibreOffice without a V2Mac release: say once per run when a version nobody here tested arrives.
tested=25.2
version=$(dpkg-query -W -f '${Version}' libreoffice-writer | sed 's/^[0-9]*://; s/^\([0-9]*\.[0-9]*\).*/\1/')
[ "$version" = "$tested" ] || zenity --warning --title="LibreOffice $version" --text="Debian updated LibreOffice to $version. V2Mac has tested $tested, so its locked settings may behave differently until V2Mac tests this one." &
view() {
  case "$(printf %s "$1" | tr '[:upper:]' '[:lower:]')" in
    *.pdf) evince "$1" ;;
    *) soffice -env:UserInstallation=file:///tmp/viewer/lo --nologo --nofirststartwizard --view "$1" ;;
  esac
}
if [ -n "$1" ]; then view "$1"; exit; fi
while f=$(zenity --file-selection --title="Open a file from Shared" --filename="$SHARED/"); do view "$f"; done
