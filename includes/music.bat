@echo off
setlocal

if "%1"=="stop" goto :STOP
if "%2"=="forever" goto :PLAYFOREVER

:PLAY
(
  echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%1"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000
) > sound.vbs
start /min sound.vbs
start /b includes\music_delete_vbs.bat
exit /b

@echo off
:PLAYFOREVER
(
  echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%1"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo do while true
  echo wscript.sleep (int(Sound.currentmedia.duration^)*1000^)
  echo Sound.Controls.currentPosition = 0
  echo Sound.Controls.play
  echo loop
) > sound.vbs
start /min sound.vbs
start /b includes\music_delete_vbs.bat
exit /b

:STOP
taskkill /f /t /im "wscript.exe" 1>$null 2>&1
if exist $null del $null
exit /b