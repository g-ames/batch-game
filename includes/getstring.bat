@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for /f %%a in ('"prompt $H&for %%b in (1) do rem"') do set "BACKSPACE=%%a"

SET "CHOICE=CALL includes\choice.bat"

SET "INPUT="

:eachChar
%CHOICE%

if "!CHOICE.INPUT!"=="" (
    ENDLOCAL
    SET GETSTRING.INPUT=%INPUT%
    EXIT /B
)

if "!CHOICE.INPUT!"=="TAB" (
    SET "INPUT=!INPUT!     "
) else if "!CHOICE.INPUT!"=="SPACE" (
    SET "INPUT=!INPUT! "
) else if "!CHOICE.INPUT!"=="COMMA" (
    SET "INPUT=!INPUT!,"
) else if "!CHOICE.INPUT!"=="EQUAL" (
    SET "INPUT=!INPUT!="
) else if "!CHOICE.INPUT!"=="%BACKSPACE%" (
    SET "INPUT=!INPUT:~0,-1!"
) else (
    SET "INPUT=!INPUT!!CHOICE.INPUT!"
) 

if "!INPUT!"=="" ( 
    if "%1"=="cls" (
        cls
    )
    echo " " 
) else (
    if "%1"=="cls" (
        cls
    )
    echo !INPUT!
)

GOTO eachChar