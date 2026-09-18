#!/bin/sh
# ROOM unlock patch: copy into an existing game install
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
if [ $# -ge 1 ]; then DST="$1"; else DST="$(cd "$SRC/.." && pwd)"; fi
if [ ! -f "$DST/Room.exe" ] && [ ! -f "$DST/Room" ] && [ ! -f "$DST/Room.app/Contents/MacOS/Room" ]; then
  echo "Can't find the game under '$DST'. Pass the game folder as an argument." >&2
  exit 1
fi
mkdir -p "$DST/resources/app/data/scenario"
cp -f "$SRC/resources/app/data/scenario/RP2.ks" "$DST/resources/app/data/scenario/RP2.ks"
cp -f "$SRC/Room_sf.sav" "$DST/Room_sf.sav"
echo "Done - all replays + CGs unlocked, recaps included."
