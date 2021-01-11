@ECHO OFF
GOTO:MAIN

:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:chocoInstall
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
		SET applicationName=%~1
		ECHO "Installing %applicationName%"
        choco install %applicationName% -dvfy
		REFRESHENV
		ECHO "Completed installation of %applicationName%"
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------


:MAIN

ECHO "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
ECHO "Chocolatey installed"
REFRESHENV



ECHO "Downloading .NET version 4.5.2"
curl -o "%cd%\DNET_v4.5.2.exe" "https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"^
 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0"^
 -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"^
 -H "Accept-Language: en-US,en;q=0.5" ^
 -H "Connection: keep-alive"^
 -H "Referer: https://curriculeon.github.io/Curriculeon/lectures/terminal/dos/upgrade-powershell/content.html"^
 -H "Cookie: MC1=GUID=ad1cf26150d54bb0a1b9d6e8e630328b&HASH=ad1c&LV=202007&V=4&LU=1593878411611; MUID=2B2284CFC54863AF25048A1BC46162AF; _ga=GA1.2.513799868.1601769674; AMCV_EA76ADE95776D2EC7F000101"%"40AdobeOrg=-894706358"%"7CMCIDTS"%"7C18606"%"7CMCMID"%"7C27881605365137188830551564152411570870"%"7CMCAAMLH-1608160900"%"7C7"%"7CMCAAMB-1608177435"%"7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y"%"7CMCOPTOUT-1607579819s"%"7CNONE"%"7CMCSYNCSOP"%"7C411-18614"%"7CvVersion"%"7C2.3.0"%"7CMCCIDH"%"7C-1461146710; mbox=PC#363cc33c0a7443a58ae9d327f8345e92.34_0#1670817444|session#2c97bba376fe44498c8a4f14840093bd#1607574480; _cs_c=0; _cs_id=ae664152-aaa4-a084-d8f8-aa7d4eeec638.1604852881.13.1607636592.1607636592.1594299326.1639016881860.Lax.0"^
 -H "Upgrade-Insecure-Requests: 1"
ECHO ".NET downloaded"
ECHO "installing DNET_v4.5.2"
START ./DNET_v4.5.2.exe

ECHO "STOP! Complete .NET installation before continuing!"
PAUSE
REFRESHENV


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