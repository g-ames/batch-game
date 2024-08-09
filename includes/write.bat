@echo off
:write  Str
setlocal disableDelayedExpansion
set "str=%~1"
call :writeVar str
exit /b

:writeVar  StrVar
if not defined %~1 exit /b
setlocal enableDelayedExpansion
if not defined $write.sub call :writeInitialize
set $write.special=1
if "!%~1:~0,1!" equ "^!" set "$write.special="
for /f delims^=^ eol^= %%A in ("!%~1:~0,1!") do (
  if "%%A" neq "=" if "!$write.problemChars:%%A=!" equ "!$write.problemChars!" set "$write.special="
)
if not defined $write.special (
  <nul set /p "=!%~1!"
  exit /b
)
>"%$write.temp%_1.txt" (echo !str!!$write.sub!)
copy "%$write.temp%_1.txt" /a "%$write.temp%_2.txt" /b >nul
type "%$write.temp%_2.txt"
del "%$write.temp%_1.txt" "%$write.temp%_2.txt"
set "str2=!str:*%$write.sub%=%$write.sub%!"
if "!str2!" neq "!str!" <nul set /p "=!str2!"
exit /b

:writeInitialize
set "$write.temp=%temp%\writeTemp%random%"
copy nul "%$write.temp%.txt" /a >nul
for /f "usebackq" %%A in ("%$write.temp%.txt") do set "$write.sub=%%A"
del "%$write.temp%.txt"
for /f %%A in ('copy /z "%~f0" nul') do for /f %%B in ('cls') do (
  set "$write.problemChars=%%A%%B    ""
  REM the characters after %%B above should be <space> <tab> <0xFF>
)
exit /b