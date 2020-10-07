:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: rename bin
ren "./resources/curl/binn/" "bin"

:: configure aliases
@DOSKEY unzip =  "./resources/native-zipper/unzipper.vbs" $* 
@DOSKEY zip =  "./resources/native-zipper/zipper.vbs" $* 
@DOSKEY curl = "./resources/curl/bin/curl.exe" $*



:: configure msvcr120.dll for 32-bit
echo "Renaming 'msvcr120-32.dll' to to 'msvcr120.dll'"
ren "./resources/msvcr120-32.dll" "msvcr120.dll"

echo "Copying 'msvcr120.dll' for 32-bit to System32
cp "./resources/msvcr120.dll" "C:\Windows\System32\"

echo "Moving 'msvcr120.dll' for 32-bit to SysWOW64"
mv "./resources/msvcr120.dll" "C:\Windows\SysWOW64\"


:: configure msvcr120.dll for 32-bit
echo "Renaming 'msvcr120-64.dll' to to 'msvcr120.dll'"
ren "./resources/msvcr120-32.dll" "msvcr120.dll"

echo "Copying 'msvcr120.dll' for 64-bit to System32
cp "./resources/msvcr120.dll" "C:\Windows\System32\"

:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
























:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'Python'
echo "Would you like to download and install 'Python'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

:: -----------------------------------------------------------------------------------------



:: -----------------------------------------------------------------------------------------
:: install 'python' installer to run 'python' utilities.
echo "downloading Python installer installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\python-v3.7.3-installer.exe" "https://www.python.org/ftp/python/3.7.3/python-3.7.3-amd64.exe"

echo "Installing python3"
start python-v3.7.3-installer.exe
:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################












:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install Node.js
echo "Would you like to download and install 'Node.js'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
:: -----------------------------------------------------------------------------------------



:: -----------------------------------------------------------------------------------------
:: install 'Node' installer to create projects with 'Node.js'
echo "downloading NPM installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\node-v10.16.0-x64.msi" "https://nodejs.org/dist/v10.16.0/node-v10.16.0-x64.msi"

echo "Installing NodeJS"
start node-v10.16.0-x64.msi
:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
























:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install Notepad++
echo "Would you like to download and install 'Notepad++'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
:: -----------------------------------------------------------------------------------------



:: -----------------------------------------------------------------------------------------
:: install 'Notepad++' text editor
echo "downloading Notepad++ installer installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\npp-installer.exe" "https://notepad-plus-plus.org/repository/7.x/7.7.1/npp.7.7.1.Installer.exe"

echo "Installing Notepad++"
start npp-installer.exe
:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################



























:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install Notepad++
echo "Would you like to download and install 'Markdown Pad'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
:: -----------------------------------------------------------------------------------------



:: -----------------------------------------------------------------------------------------
:: install 'Notepad++' text editor
echo "downloading Markdown Pad installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\markdownpad-installer.exe" "http://markdownpad.com/download/markdownpad2-setup.exe"

echo "Installing Markdown Pad++"
start markdownpad-installer.exe
:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################



























:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install VSCode
echo "Would you like to download and install 'Visual Studio Code'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
:: -----------------------------------------------------------------------------------------



:: -----------------------------------------------------------------------------------------
:: install 'VSCode' to edit code
echo "downloading Visual Studio Code installer installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\vscode-installer.exe" "https://az764295.vo.msecnd.net/stable/2213894ea0415ee8c85c5eea0d0ff81ecc191529/VSCodeUserSetup-ia32-1.36.1.exe"

echo "Installing Visual Studio Code"
start vscode-installer.exe
:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################



























:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install git-bash
echo "Would you like to download and install 'git-bash'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END



:: -----------------------------------------------------------------------------------------
:: install 'Git Bash' installer to clone projects from command line
echo "downloading Git-Bash installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\gitbash-installer.exe" "https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe"

echo "Installing GitBash"
set __compat_layer=win7
reg Add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "./gitbash-installer.exe" /T REG_SZ /D CompatibilityMode /F
reg Add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "./gitbash-installer.exe" /d "WIN7"
start gitbash-installer.exe

:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################





















:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install git-bash
echo "Would you like to download and install 'IntelliJ Community Edition??"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END



:: -----------------------------------------------------------------------------------------
:: install 'Git Bash' installer to clone projects from command line
echo "downloading IntelliJ Community Edition installer..."
"./resources/curl/bin/curl.exe" -o "%cd%\intellij-installer.exe" "https://download-cf.jetbrains.com/idea/ideaIU-2020.2.1.exe" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Accept-Language: en-US,en;q=0.5" --compressed -H "Referer: https://www.jetbrains.com/idea/download/download-thanks.html?platform=windows" -H "Connection: keep-alive" -H "Cookie: _gcl_au=1.1.1556281742.1599423447; _ga=GA1.1.1454185254.1599423448; _gid=GA1.2.2076224765.1599423448; _ga_TNKGS6FGXX=GS1.1.1599423447.1.1.1599423467.0" -H "Upgrade-Insecure-Requests: 1"

echo "Installing intellij"
start intellij-installer.exe

:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################















:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install git-bash
echo "Would you like to download and install 'PyCharm Community Edition'?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END



:: -----------------------------------------------------------------------------------------
:: install 'Git Bash' installer to clone projects from command line
echo "downloading PyCharm Community Edition installer..."
curl -o "%cd%\pycharm-installer.exe" "https://download-cf.jetbrains.com/python/pycharm-community-2020.2.2.exe" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Accept-Language: en-US,en;q=0.5" -H "Referer: https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=windows&code=PCC" -H "Connection: keep-alive" -H "Cookie: _ga=GA1.1.594083364.1573664930; _hjid=71889476-ad4a-4ac6-adbf-5b18f197ce6e; _ga_TNKGS6FGXX=GS1.1.1601590894.6.1.1601590896.58; _gcl_au=1.1.996650656.1596036073; _ga_1QPM2PL8QR=GS1.1.1601580227.1.0.1601580227.0; _gid=GA1.2.1807665973.1601580228; _gat_UA-47631155-3=1; _mkto_trk=id:426-QVD-114&token:_mch-jetbrains.com-1601590894765-43628; _fbp=fb.1.1601590894939.762435895; _uetsid=d006bdc0041b11eba84347b1f8af49b0; _uetvid=d006c2a0041b11eb963d6d7533874fca" -H "Upgrade-Insecure-Requests: 1"

echo "Installing PyCharm Community Edition"
start pycharm-installer.exe

:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################


















:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install Chrome
echo "Would you like to download and install Chrome?"
@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
:: -----------------------------------------------------------------------------------------



:: -----------------------------------------------------------------------------------------
:: Download Chrome installer
echo "Downloading Chrome installer"
start "C:\Program Files (x86)\Internet Explorer\iexplore.exe" "https://www.google.com/chrome/thank-you.html?statcb=1&installdataindex=defaultbrowser#"
:END
endlocal
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################




exit