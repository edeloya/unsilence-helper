@ECHO off
cd %~dp0
::#########       Change       ###########
::#########      Defaults      ###########
::#########        Here        ###########

::  Speed when sounds
SET as=2.00


::  Speed when "silence"
SET ss=16


::  Volume when sounds
SET av=1


::  Volume when "silence"
SET sv=0.3

::########################################
::########################################

color a
chcp 65001
cls
ECHO.&&ECHO.
ECHO     🎷🐛
ECHO    $$$$$\                               $$\      $$\
ECHO    \__$$ ^|                              $$ ^| $\  $$ ^|                           🎷🐛
ECHO       $$ ^| $$$$$$\  $$$$$$$$\ $$$$$$$$\ $$ ^|$$$\ $$ ^| $$$$$$\   $$$$$$\  $$$$$$\$$$$\
ECHO       $$ ^| \____$$\ \____$$  ^|\____$$  ^|$$ $$ $$\$$ ^|$$  __$$\ $$  __$$\ $$  _$$  _$$\
ECHO $$\   $$ ^| $$$$$$$ ^|  $$$$ _/   $$$$ _/ $$$$  _$$$$ ^|$$ /  $$ ^|$$ ^|  \__^|$$ / $$ / $$ ^|
ECHO $$ ^|  $$ ^|$$  __$$ ^| $$  _/    $$  _/   $$$  / \$$$ ^|$$ ^|  $$ ^|$$ ^|      $$ ^| $$ ^| $$ ^|
ECHO \$$$$$$  ^|\$$$$$$$ ^|$$$$$$$$\ $$$$$$$$\ $$  /   \$$ ^|\$$$$$$  ^|$$ ^|      $$ ^| $$ ^| $$ ^|
ECHO  \______/  \_______^|\________^|\________^|\__/ 🎷🐛\__^| \______/ \__^|      \__^| \__^| \__^|
ECHO                                                                           ft. Unsilence
ECHO.
ECHO.
ECHO ex: GMT202242069-Recording_1920x1080.mp4
ECHO.(needs quotes if it has spaces or spicy symbols like %%^^^$^&^=^# etc)
ECHO.
SET /p file="Full filename or link pls: "


IF ["%file%"] NEQ [] (
ECHO.%file% | findstr /C:"http" > NUL
    IF ERRORLEVEL 1 (
        SET vidin=%file%
        ) ELSE (
        SET link=%file%
        GOTO :WEB
        )
    )

ECHO.

:INPUT
ECHO.
ECHO Mash Enter to use defaults or input integers/decimals
SET /p as="Set Audible_Speed (Speed the audible parts play at. Default: 2.00): "
SET /p ss="Set Silent_Speed (Speed the non-audible parts play at. Default: 16): "
SET /p av="Set Audible_Volume (Volume the audible parts play at. Default: 1): "
SET /p sv="Set Silent_Volume (Volume the non-audible. Default: .3): "
::SET /p t"Set Threads used: "
ECHO.

:EXEC
ECHO.
ECHO Output filename will end with '_output.mkv'
Unsilence "%vidin%" "%vidin:~0,-4%_output.mkv" -as %as% -ss %ss% -av %av% -sv %sv% -t %NUMBER_OF_PROCESSORS% -y
ECHO.
ENDLOCAL
Echo Closing..
PAUSE
GOTO :EOF

:WEB
ECHO.
ECHO Working with link: %link%
%SYSTEMDRIVE%
cd %USERPROFILE%\downloads
FOR %%C in (*_cookies.txt) DO (SET cooki="%%~fC")
%~d0
cd %~dp0
ECHO Is there a video passcode?
ECHO.
ECHO ^(Yes ^-^> use quotes
SET /p vp=No  ^-^> leave blank^)^: 
IF [%vp%] NEQ [] (GOTO :vidpass)

ECHO.
yt-dlp "%link%" --restrict-filenames -f mp4 -o "%%(title)s.%%(ext)s" --cookies %cooki%
FOR /F "USEBACKQ delims=" %%Y IN (`yt-dlp --get-filename --restrict-filenames --no-warnings -f mp4 "%link%" --cookies %cooki% -o "%%(title)s.%%(ext)s"`) DO (SET "vidin=%%~Y")
GOTO :INPUT

:vidpass
ECHO.
yt-dlp "%link%" --restrict-filenames -f mp4 -o "%%(title)s.%%(ext)s" --cookies %cooki% --video-password %vp%
FOR /F "USEBACKQ delims=" %%Y IN (`yt-dlp --get-filename --restrict-filenames --no-warnings -f mp4 "%link%" --cookies %cooki% --video-password %vp% -o "%%(title)s.%%(ext)s"`) DO (SET "vidin=%%~Y")
GOTO :INPUT
