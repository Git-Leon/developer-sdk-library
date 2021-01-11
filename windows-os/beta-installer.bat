@ECHO OFF
SET curlPath=%cd%\resources\curl\bin\curl.exe
SET unzipperPath=%cd%\resources\native-zipper\unzipper.vbs
ECHO "Deserializing '%cd%\resources\curl\binn' directory..."
ROBOCOPY "%cd%\\resources\\curl\\binn\\" %cd%\resources\curl\bin\
GOTO:MAIN

:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:defaultdownloadAndInstall
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET executableUrl=%~2
        SET curlExecutionStatement="^"%curlPath%^" -o ^"%cd%\%applicationName%^" ^"%executableUrl%^""
        
        call:downloadAndInstall %applicationName% %curlExecutionStatement%
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################




:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:downloadAndInstall
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET curlExecutionStatement=%~2

        ECHO "Would you like to download and install '%applicationName%'?"
        :PROMPT
            SET /P areYouSure="Are you sure (Y/[N])?"
            IF /I "%areYouSure%" NEQ "y" GOTO END
                ECHO "downloading %applicationName% installer..."
                %curlExecutionStatement%

                ECHO "Installing %applicationName%"
                START %applicationName%
        :END
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################



:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:download
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET curlExecutionStatement=%~2

        ECHO "Would you like to download and install '%applicationName%'?"
        :PROMPT
            SET /P areYouSure="Are you sure (Y/[N])?"
            IF /I "%areYouSure%" NEQ "y" GOTO END
                ECHO "downloading %applicationName% installer..."
                ECHO %curlExecutionStatement%
                %curlExecutionStatement%
                ECHO "downloaded %applicationName% installer."
        :END
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################









:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application' via chocolatey
:chocoInstall
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET chocoPackage=%~1
        ECHO "Would you like to download and install '%chocoPackage%'?"
        :PROMPT
            SET /P areYouSure="Are you sure (Y/[N])?"
            IF /I "%areYouSure%" NEQ "y" GOTO END
                ECHO " "
                ECHO "##########################################################################################"
                ECHO "Beginning installation of %chocoPackage%"
                choco install %chocoPackage% -dvfy
                ECHO "Completed installation of %chocoPackage%"
        :END
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################











:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: install Chocolatey
:installChocolatey
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName="Chocolatey"
        ECHO "Would you like to download and install '%applicationName%'?"
        :PROMPT
            SET /P areYouSure="Are you sure (Y/[N])?"
            IF /I "%areYouSure%" NEQ "y" GOTO END
                ECHO "downloading %applicationName% installer..."
                :: Check for permissions
                > nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

                :: If error flag set, we do not have admin.
                IF '%ERRORLEVEL%' NEQ '0' (
                    ECHO Requesting administrative privileges... ^(waiting 2 seconds^)
                    PING -n 3 127.0.0.1>nul
                    ECHO Set UAC = CreateObject^("Shell.Application"^) > "%Temp%\getadmin.vbs"
                    ECHO UAC.ShellExecute "%~s0", "", "", "RUNAS", 1 >> "%Temp%\getadmin.vbs"

                    "%Temp%\getadmin.vbs"
                    EXIT /B
                ) ELSE (
                    IF EXIST "%Temp%\getadmin.vbs" ( DEL "%Temp%\getadmin.vbs" )
                        PUSHD "%CD%"
                        CD /D "%~dp0"
                        ECHO BatchGotAdmin Permissions set.
                )
                @powershell -NoProfile -ExecutionPolicy Unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%SYSTEMDRIVE%\chocolatey\bin;%ALLUSERSPROFILE%\chocolatey\bin
                @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
        :END
    ENDLOCAL
    ECHO End %~nx0
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################



:MAIN
call:downloadAndInstall "DNET_v4.5.2.exe"^
    "%curlPath% -o ^"https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe^"^
        -H ^"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0^"^
        -H ^"Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8^"^
        -H ^"Accept-Language: en-US,en;q=0.5^" ^
        -H ^"Connection: keep-alive^"^
        -H ^"Referer: https://curriculeon.github.io/Curriculeon/lectures/terminal/dos/upgrade-powershell/content.html^"^
        -H ^"Cookie: MC1=GUID=ad1cf26150d54bb0a1b9d6e8e630328b&HASH=ad1c&LV=202007&V=4&LU=1593878411611; MUID=2B2284CFC54863AF25048A1BC46162AF; _ga=GA1.2.513799868.1601769674; AMCV_EA76ADE95776D2EC7F000101^"%^"40AdobeOrg=-894706358^"%^"7CMCIDTS^"%^"7C18606^"%^"7CMCMID^"%^"7C27881605365137188830551564152411570870^"%^"7CMCAAMLH-1608160900^"%^"7C7^"%^"7CMCAAMB-1608177435^"%^"7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y^"%^"7CMCOPTOUT-1607579819s^"%^"7CNONE^"%^"7CMCSYNCSOP^"%^"7C411-18614^"%^"7CvVersion^"%^"7C2.3.0^"%^"7CMCCIDH^"%^"7C-1461146710; mbox=PC#363cc33c0a7443a58ae9d327f8345e92.34_0#1670817444|session#2c97bba376fe44498c8a4f14840093bd#1607574480; _cs_c=0; _cs_id=ae664152-aaa4-a084-d8f8-aa7d4eeec638.1604852881.13.1607636592.1607636592.1594299326.1639016881860.Lax.0^"^
        -H ^"Upgrade-Insecure-Requests: 1^""

ECHO "STOP and complete .NET installation before continuing!"
PAUSE

call:download "windows-management-framework_x64.zip"^
    "%curlPath% -o ^"https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win7AndW2K8R2-KB3191566-x64.zip^"^
        -H ^"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0^"^
        -H ^"Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8^"^
        -H ^"Accept-Language: en-US,en;q=0.5^"^
        -H ^"Connection: keep-alive^"^
        -H ^"Referer: https://curriculeon.github.io/Curriculeon/lectures/terminal/dos/upgrade-powershell/content.html^"^
        -H ^"Cookie: MC1=GUID=ad1cf26150d54bb0a1b9d6e8e630328b&HASH=ad1c&LV=202007&V=4&LU=1593878411611; MUID=2B2284CFC54863AF25048A1BC46162AF; _ga=GA1.2.513799868.1601769674; AMCV_EA76ADE95776D2EC7F000101^"%^"40AdobeOrg=-894706358^"%^"7CMCIDTS^"%^"7C18606^"%^"7CMCMID^"%^"7C27881605365137188830551564152411570870^"%^"7CMCAAMLH-1608160900^"%^"7C7^"%^"7CMCAAMB-1608177435^"%^"7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y^"%^"7CMCOPTOUT-1607579819s^"%^"7CNONE^"%^"7CMCSYNCSOP^"%^"7C411-18614^"%^"7CvVersion^"%^"7C2.3.0^"%^"7CMCCIDH^"%^"7C-1461146710; mbox=PC#363cc33c0a7443a58ae9d327f8345e92.34_0#1670817444|session#2c97bba376fe44498c8a4f14840093bd#1607574480; _cs_c=0; _cs_id=ae664152-aaa4-a084-d8f8-aa7d4eeec638.1604852881.13.1607636592.1607636592.1594299326.1639016881860.Lax.0^"^
        -H ^"Upgrade-Insecure-Requests: 1^""
%unzipperPath% "windows-management-framework_x64.zip" "windows-management-framework_x64"
START "windows-management-framework_x64/Win7AndW2K8R2-KB3191566-x64.msu"
ECHO "STOP and complete Windows Management Framework installation before continuing!"
PAUSE



:: ##########################################################################################
:: Partially stable chocolatey installs; inconsistent results; opens several terminals
call:installChocolatey
call:chocoInstall "notepadplusplus"
call:chocoInstall "markdownpad.portable"
call:chocoInstall "git.install"
call:chocoInstall "node"
call:chocoInstall "vscode"
call:chocoInstall "python --version=3.8.0"
call:chocoInstall "pycharm-community"
call:chocoInstall "jdk8"
call:chocoInstall "maven"
call:chocoInstall "intellijidea-community"
call:chocoInstall "eclipse"
call:chocoInstall "postman"
call:chocoInstall "firefox"
:: ##########################################################################################





