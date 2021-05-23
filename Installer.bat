@ECHO OFF
color a
mkdir %TEMP%\jz.wrm
ECHO Close and run as Admin if not already. 
CHOICE /N /M "Are you Admin [Y|N]?"

IF ERRORLEVEL 2 GOTO BAIL
IF ERRORLEVEL 1 GOTO RUN
ECHO.&&ECHO.

:RUN
ECHO.&&ECHO Pls wait, downloading/installing dependencies&&ECHO.
::installing Windows Terminal™ and 7Zip4PowerShell
winget install --id=Microsoft.WindowsTerminal -e
powershell -Command [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; ^
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force; ^
Set-PSRepository -Name 'PSGallery' -SourceLocation "https://www.powershellgallery.com/api/v2" -InstallationPolicy Trusted; ^
Install-Module -Name 7Zip4PowerShell -Force

ECHO Downloading, uncompressing, and installing Python and FFMPEG, this may take more than a minute..&&ECHO.
::downloading Python and FFMPEG installers
powershell -Command $ProgressPreference = 'SilentlyContinue'; ^
Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe -OutFile "%TEMP%\jz.wrm\python-installer.exe" -UseBasicParsing; ^
Invoke-WebRequest -Uri https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z -OutFile "%TEMP%\jz.wrm\ffmpeg.7z" -UseBasicParsing >NUL 2>&1 
"%TEMP%\jz.wrm\python-installer.exe" /quiet InstallAllUsers=0 PrependPath=1 Include_test=0
del "%TEMP%\jz.wrm\python-installer.exe"

::installing the Python dependencies
%localappdata%\Programs\Python\Python39\Scripts\pip install unsilence youtube-dl --no-warn-script-location

::extracting the 7z
powershell -Command Expand-7Zip -ArchiveFileName %TEMP%\jz.wrm\ffmpeg.7z -TargetPath %TEMP%\jz.wrm\

::making folders and moving stuff around
mkdir "%programfiles%\FFMPEG"
robocopy /move /e %TEMP%\jz.wrm\ffmpeg-4.4-full_build "C:\Program Files\FFMPEG" /NFL /NDL /NC /NS /NJS /NJH

::setting Windows Terminal as default for .bat scripts...for the emoji lol
ftype batfile="%localappdata%\Microsoft\WindowsApps\wt.exe" -p "Command Prompt" "%%1" %%*

::adding FFMPEG folder to PATH
setx /M PATH "%PATH%;%programfiles%\FFMPEG\bin"

::cleaning up
rmdir %temp%\jz.wrm\ /q /s

ECHO.&&ECHO.&&ECHO Done! Congrats!
PAUSE&&Exit

:BAIL
ECHO Boooo. Closing
ECHO.&&PAUSE&&Exit
