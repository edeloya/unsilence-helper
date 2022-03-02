@ECHO off
cd %~dp0
SET as=%2
SET ss=%3
SET av=%4
SET sv=%5
IF [%as%] EQU [] SET as=2.15
IF [%ss%] EQU [] SET ss=16
IF [%av%] EQU [] SET av=1
IF [%sv%] EQU [] SET sv=0.5
IF [%1] NEQ [] (
    SET file=%1
    ECHO.%1 | findstr /C:"http" > NUL
    IF ERRORLEVEL 1 (
        GOTO :EXEC
        ) ELSE (
        GOTO :CLIWEB
        )
    )
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
ECHO ex: GMT202242069-Recording_1920x1080.mp4
SET /p file="Filename w/ extension pls: "
ECHO.
ECHO.%file% | findstr /C:"http" > NUL
IF ERRORLEVEL 1 (
    REM
    ) ELSE (
    GOTO :WEB
    )
:INPUT
ECHO Mash Enter to use defaults or input integers/decimals
SET /p as="Set Audible_Speed (Speed the audible parts play at. Default: 2.15): "
SET /p ss="Set Silent_Speed (Speed the non-audible parts play at. Default: 16): "
SET /p av="Set Audible_Volume (Volume the audible parts play at. Default: 1): "
SET /p sv="Set Silent_Volume (Volume the non-audible. Default: 0.5): "
::SET /p t"Set Threads used: "
ECHO.

:EXEC
ECHO Output filename will end with '_output.mkv'
Unsilence "%file%" "%file:~0,-4%_output.mkv" -as %as% -ss %ss% -av %av% -sv %sv% -t %NUMBER_OF_PROCESSORS% -y
ECHO.
ENDLOCAL
PAUSE
GOTO :EOF

:CLIWEB
ECHO Working with link: %file%
yt-dlp "%file:~1,-1%" --restrict-filenames -f mp4 -o "%%(title)s.%%(ext)s"
FOR /F "USEBACKQ delims=" %%Y IN (`youtube-dl --get-filename --restrict-filenames --no-warnings -f mp4 "%file:~1,-1%" -o "%%(title)s.%%(ext)s"`) DO (SET "file=%%~Y")
GOTO :EXEC

:WEB
ECHO Working with link: %file%
cd %USERPROFILE%\downloads
SET cooki="dir /s /b /a:-d *_cookies.txt"
cd %~dp0
yt-dlp "%file%" --restrict-filenames -f mp4 -o "%%(title)s.%%(ext)s" --cookies %cooki%
GOTO :INPUT

:ERROR
ECHO Try quotes around URLs or files with spaces
PAUSE
ENDLOCAL
GOTO :EOF
