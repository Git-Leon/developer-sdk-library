@ECHO OFF
:RunAsAdministrator
    :: Check for permissions
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

    :: If error flag set, we do not have admin.
    IF '%ERRORLEVEL%' NEQ '0' (
        ECHO Requesting administrative privileges... ^(waiting 2 seconds^)
        PING -n 3 127.0.0.1>nul
        GOTO UACPrompt
    ) ELSE ( GOTO gotAdmin )

    :UACPrompt
        ECHO Set UAC = CreateObject^("Shell.Application"^) > "%Temp%\getadmin.vbs"
        ECHO UAC.ShellExecute "%~s0", "", "", "RUNAS", 1 >> "%Temp%\getadmin.vbs"

        "%Temp%\getadmin.vbs"
        EXIT /B

    :gotAdmin
        IF EXIST "%Temp%\getadmin.vbs" ( DEL "%Temp%\getadmin.vbs" )
        PUSHD "%CD%"
        CD /D "%~dp0"
        ECHO BatchGotAdmin Permissions set.
:: End Run-As-Administrator function


@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%SYSTEMDRIVE%\chocolatey\bin;%ALLUSERSPROFILE%\chocolatey\bin

ECHO End %~nx0
EXIT
