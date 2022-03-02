@ECHO OFF
color a
ECHO Close and run as Admin if not already. 
CHOICE /N /M "Are you Admin [Y|N]?"

IF ERRORLEVEL 2 GOTO BAIL
IF ERRORLEVEL 1 GOTO RUN
ECHO.&&ECHO.

:RUN
ECHO.&&ECHO Pls wait, downloading/installing dependencies&&ECHO.
::installing Windows Terminal™ and 7Zip4PowerShell
powershell -Command ^
Set-ExecutionPolicy Bypass -Scope Process -Force; ^
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; ^
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
refreshenv && choco install -y microsoft-windows-terminal ffmpeg python yt-dlp
refreshenv && pip install unsilence --no-warn-script-location

::setting Windows Terminal as default for .bat scripts...for the emoji lol
ftype batfile="%localappdata%\Microsoft\WindowsApps\wt.exe" -p "Command Prompt" "%%1" %%*

ECHO.&&ECHO.&&ECHO Done! Congrats!
PAUSE&&Exit

:BAIL
ECHO Boooo. Closing
ECHO.&&PAUSE&&Exit
