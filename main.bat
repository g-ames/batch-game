@ECHO OFF

title Cowboy Simulator
mode con: cols=160 lines=78

CALL "includes\fullscreen.bat"

SET "CHOICE=CALL ^"includes\choice.bat^""
SET "ACHOICE=CALL ^"includes\awaitchoice.bat^""
@REM stop any music currently playing
CALL includes\music.bat stop

ECHO Loading assets...

ECHO Press E to play...

CALL includes\music.bat assets\cool.mp3 forever

%ACHOICE% e

:initMainMusic_main
CALL includes\music.bat stop
CALL includes\music.bat assets\cool.mp3 forever
GOTO main

:main

cls
echo Playing music!!!

timeout /t 1 > NUL

GOTO main