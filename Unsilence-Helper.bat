::To update before running, just uncomment (delete the `::`) from the below command ↓
::python -m pip install --upgrade pip unsilence youtube-dl

@ECHO off
color a
chcp 65001
cd %~dp0
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
SET file=EXAMPLE VIDEO - LECTURE5.mp4
SET /p file="Filename w/ extension pls: "
ECHO.
ECHO Just keep slapping Enter for defaults.
SET "as=1"
SET /p as="Set Audible_Speed (Speed the audible parts play at. Default: 1): "
SET "ss=6"
SET /p ss="Set Silent_Speed (Speed the non-audible parts play at. Default: 8): "
SET "av=1"
SET /p av="Set Audible_Volume (Volume the audible parts play at. Default: 1): "
SET "sv=0.5"
SET /p sv="Set Silent_Volume (Volume the non-audible. Default: 0.5): "
SET "t=%NUMBER_OF_PROCESSORS%"
::SET /p t"Set Threads used: "
ECHO.
ECHO File will be named "%file:~0,-4%_output.mkv"
unsilence "%file%" "%file:~0,-4%_output.mkv" -as %as% -ss %ss% -av %av% -sv %sv% -t %t% -y
ECHO.
:END
PAUSE
