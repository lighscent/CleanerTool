@echo off
title Azukiov - Cleaner Tool
color 0A
setlocal enabledelayedexpansion

:: Vérification des droits d'administration
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Droits d'administration accordes.
) else (
    echo Vous devez lancer le Tool en tant qu'administrateur.
    echo Faites un clic droit sur le fichier batch et choisissez "Executer en tant qu'administrateur".
    pause
    exit /b
)

:: Fonction pour demander une confirmation
:confirmation
set /p "confirm=Voulez-vous vraiment supprimer ces fichiers et dossiers ? (O/N): "
if /i "%confirm%"=="O" (
    goto :cleanup
) else (
    echo Annulation de l'opération.
    pause
    exit /b
)

:: Nettoyage des fichiers et dossiers
:cleanup
echo Nettoyage en cours...

:: Liste des répertoires de fichiers temporaires sous Windows
set "cleanup_dirs=%WinDir%\Temp %WinDir%\Prefetch %Temp% %AppData%\Local\Temp %LocalAppData%\Temp %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache %SYSTEMDRIVE%\AMD %SYSTEMDRIVE%\NVIDIA %SYSTEMDRIVE%\INTEL"

for %%d in (%cleanup_dirs%) do (
    if exist "%%d" (
        echo Suppression de %%d...
        del /s /f /q "%%d\*.*"
        rd /s /q "%%d" 2>nul
        md "%%d"
    )
)

:: Nettoyage du registre (exemple)
:: Reg delete "HKCU\Software\MonApplication" /f >nul 2>&1

echo Nettoyage terminé.
echo Appuyez sur une touche pour quitter.
pause >nul
exit /b
