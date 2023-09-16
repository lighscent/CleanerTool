rem Ce script a été dev par Azukiov - Update in 2023
rem Discord: https://discord.gg/YfdEgx5yzF
cls

@echo off
title Azukiov - Cleaner Tool
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    color b
    echo Azukiov - Cleaner Windows
    echo. 
    echo Discord: https://discord.gg/YfdEgx5yzF
    echo.
    echo Appuyez sur un touche pour lancer le Tool
    pause > NUL
) else (
    color c
    echo Azukiov - Cleaner Windows
    echo.  
    echo Vous devez lancer le Tool en Administrateur.
    echo Faites Click Droit et  ^'Run as Administrator^'.
    echo.
    echo Appuyer sur une touche pour quitter...
    pause > NUL
    exit
)

color a
echo.

del /s /f /q %WinDir%\Temp\*.*
del /s /f /q %WinDir%\Prefetch\*.*
del /s /f /q %Temp%\*.*
del /s /f /q %AppData%\Temp\*.*
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*

del /s /f /q %SYSTEMDRIVE%\AMD\*.*
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.*
del /s /f /q %SYSTEMDRIVE%\INTEL\*.*

rd /s /q %WinDir%\Temp
rd /s /q %WinDir%\Prefetch
rd /s /q %Temp%
rd /s /q %AppData%\Temp
rd /s /q %HomePath%\AppData\LocalLow\Temp

rd /s /q %SYSTEMDRIVE%\AMD
rd /s /q %SYSTEMDRIVE%\NVIDIA
rd /s /q %SYSTEMDRIVE%\INTEL

md %WinDir%\Temp
md %WinDir%\Prefetch
md %Temp%
md %AppData%\Temp
md %HomePath%\AppData\LocalLow\Temp

echo.
echo Azukiov - Cleaner Windows
echo.
echo Les fichiers inutiles de votre PC ont ete supprimes
echo Appuyez sur un touche pour fermer le Tool
pause > NUL
exit
