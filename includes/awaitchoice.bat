SET "CHOICE=CALL includes\choice.bat"

:start
%CHOICE%
if "%CHOICE.INPUT%"==%1 exit /b
GOTO start