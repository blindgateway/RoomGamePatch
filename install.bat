@echo off
setlocal
rem -- ROOM unlock patch: copies patched files into an existing game install --
set "SRC=%~dp0"
set "DST="
:choose
set /p "DST=Full path to your game folder (the one with Room.exe), or Enter for this patch's parent: "
if "%DST%"=="" set "DST=%SRC%..\"
if not exist "%DST%Room.exe" (
  echo Cannot find Room.exe under "%DST%".
  set DST=
  goto :choose
)
echo Closing ROOM if running...
taskkill /im Room.exe /f >nul 2>&1
echo Copying scenario patch...
if not exist "%DST%resources\app\data\scenario" mkdir "%DST%resources\app\data\scenario"
copy /y "%SRC%resources\app\data\scenario\RP2.ks" "%DST%resources\app\data\scenario\RP2.ks" >nul
echo Copying unlocked save...
copy /y "%SRC%Room_sf.sav" "%DST%Room_sf.sav" >nul
echo Done. Launch Room.exe - all replays + CGs unlocked, recaps included.
pause
