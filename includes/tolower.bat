@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    exit /b
)

set "_STRING=%~1"

set "_UCASE=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "_LCASE=abcdefghijklmnopqrstuvwxyz"

for /l %%a in (0,1,25) do (
   set "_FROM=!_UCASE:~%%a,1!"
   set "_TO=!_LCASE:~%%a,1!"
   set "_STRING=!_STRING:!_FROM!=!_TO!!"
)

endlocal
SET CHOICE.INPUT=%_STRING%
exit /b