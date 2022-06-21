@ECHO on
cd %~dp0


::#########       Change       ###########
::#########      Defaults      ###########
::#########        Here        ###########

::  Speed when sounds are detected
SET as=2.00


::  Speed when "silence" is detected
SET ss=16


::  Volume when sounds
SET av=1


::  Volume when "silence"
SET sv=0.3

::########################################
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


ECHO ft. Unsilence
ECHO.
ECHO.
ECHO ex: GMT202242069-Recording_1920x1080.mp4
ECHO.(Quotes around FILENAMES with spaces/spicy symbols like %%^^^$^=^# etc)
ECHO.
SET /p file="Full filename or link pls: "

::Check if input was a file or link
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
::Unsilence defaults as set at the top
ECHO.&&ECHO.
ECHO Mash Enter to use defaults or input integers/decimals
SET /p as="Set Audible_Speed (Speed the audible parts play at. Default: 2.00): "
SET /p ss="Set Silent_Speed (Speed the non-audible parts play at. Default: 16): "
SET /p av="Set Audible_Volume (Volume the audible parts play at. Default: 1): "
SET /p sv="Set Silent_Volume (Volume the non-audible. Default: .3): "
ECHO.


:EXEC
::Run video through Unsilence
ECHO.&&ECHO.
ECHO Output filename will end with '_output.mkv'
Unsilence "%vidin%" "un\%vidin:~0,-4%_output.mkv" -as %as% -ss %ss% -av %av% -sv %sv% -t %NUMBER_OF_PROCESSORS% -y
ECHO.
ENDLOCAL
Echo Closing..
PAUSE
GOTO :EOF


:WEB
::Working with a link
ECHO.&&ECHO.
ECHO Working with link: %link%

::Check User Downloads folder for a filename ending with cookies.txt
%SYSTEMDRIVE%
cd %USERPROFILE%\downloads
FOR %%C in (*cookies.txt) DO (SET cooki="%%~fC")
IF [%cooki%] NEQ [] (GOTO :cooki)

::Navigate to script drive and path
%~d0
cd %~dp0

::Check for '--video-password' inputs
ECHO Is there a video passcode?
ECHO.
ECHO ^(Yes ^-^> use quotes
SET /p vp=No  ^-^> leave blank^)^: 
IF [%vp%] NEQ [] (GOTO :passcode)

ECHO.
SET command=yt-dlp "%link%" --restrict-filenames -f "bv*[height<=1080]+ba / b[height<=1080]" 
FOR /F "USEBACKQ delims=" %%Y IN (`%command% --get-filename`) DO (SET "vidin=%%~Y")
GOTO :INPUT


:cooki
::Download video from link using cookies
ECHO.&&ECHO.
%command% --cookies %cooki%
FOR /F "USEBACKQ delims=" %%Y IN (`%command% --get-filename --cookies %cooki%`) DO (SET "vidin=%%~Y")
GOTO :INPUT


:passcode
::Download video from link using cookies and password
ECHO.&&ECHO.
%command% --cookies %cooki% --video-password %vp%
FOR /F "USEBACKQ delims=" %%Y IN (`%command% --cookies %cooki% --video-password %vp%`) DO (SET "vidin=%%~Y")
GOTO :INPUT
