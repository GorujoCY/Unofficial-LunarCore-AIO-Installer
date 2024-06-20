@echo off

echo Checking winget before we install...

FOR /F %%c IN ('where winget') DO (
    if exist %%c (
        echo Winget is installed, good!
        goto wingetexists
   )
)

:: With windows bundling winget lately, hopefully it is rare for this to occur. 
:wingetdoesntexist
cls
echo For the installation to continue you need to have winget, Please kindly install it to continue. Press to initiate the manual process, just run the installer and install it, after that rerun the batch file
pause
start https://github.com/microsoft/winget-cli/releases/download/v1.7.10861/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
exit

:wingetexists
if exist LunarCore.jar (
cls
echo LunarCore is already installed, choose the following below:
) else (
goto installprompt   
)
echo 1. Update LunarCore
echo 2. Remove LunarCore
CHOICE /C 12 /M "Select option number"

if ERRORLEVEL 2 goto remove
if ERRORLEVEL 1 goto update

 
:installprompt
cls
echo first installing prerequisites for automatic installation
FOR /F %%c IN ('where wget2') DO (
    if exist %%c (
        goto continueinstall
   )
)
winget install GNU.Wget2 Git.Git
echo Because of the way Wget2 installation works please rerun the batch file to continue installation...
pause
exit
:continueinstall
wget2 https://7-zip.org/a/7zr.exe
wget2 https://www.7-zip.org/a/7z2301-extra.7z
7zr e 7z2301-extra.7z 7za.exe
del /F /Q 7z2301-extra.7z 7zr.exe
echo Done!
cls
echo LunarCore is not installed
echo Press if you are sure to continue with installation
pause
cls
echo Choose which componenets you want installed ideally:
echo 1. Java Development Kit 17
echo 2. Cultivation
echo 3. Both (Meaning all of the above)
echo 4. None
CHOICE /C 1234 /M "Select option number" 

if ERRORLEVEL 4 goto install 

if ERRORLEVEL 3 goto installwithboth

if ERRORLEVEL 2 goto installwithcultivation

if ERRORLEVEL 1 goto installwithjdk 

:remove
cls
:: a copy is left on the above directory if you want to run it again
copy LCfromSource.bat .. 
winget uninstall GNU.Wget2 Git.Git
echo -----------------------------------------------------------------------------------------------------------
echo Complete
CHOICE /n /c yn /M "Also Uninstall components? ([Y]es/[N]o): "

if ERRORLEVEL 2 (
echo Removal successful
goto confirmremove
)

if ERRORLEVEL 1 (
winget uninstall Microsoft.OpenJDK.17
msiexec /passive /X{ADEF6C8E-4701-4F8A-9483-E7EBF4D2A8A0}
echo Removal successful
)

:confirmremove
echo please check if you are sure to remove all the files, if needed backup the database.mv file before doing so
:: the end
rmdir /S .
pause
exit

:update
cls
echo Removing necessary files to replace with...
rmdir /S /Q data resources 
del /F /Q LunarCore.jar
del /F /Q "Lunar Core Handbook.txt"
echo Done
echo --------------------------
echo Getting resources ready...
mkdir resources
cd resources 
git clone https://github.com/Dimbreath/StarRailData
cd StarRailData
del /F /Q README.md
for /F %%m in ('dir /b') do move "%%m" ..
cd ..
rmdir /S /Q StarRailData
cd Config
git clone https://gitlab.com/Melledy/LunarCore-Configs
cd LunarCore-Configs
cd Config 
for /F %%m in ('dir /b') do move "%%m" ..\..
cd ..\..
rmdir /S /Q LunarCore-Configs
echo Resources Complete
cd ..\..
echo ---------------------
echo Getting data ready...
git clone https://github.com/Melledy/LunarCore
cd LunarCore
move data ..
cd ..
rmdir /S /Q LunarCore
echo Complete
echo ----------------------------
echo Getting Nightly LunarCore...
wget2 https://nightly.link/Melledy/LunarCore/workflows/build/development/LunarCore.zip
7za e LunarCore.zip
del /F /Q LunarCore.zip
echo Success, Want to run LunarCore? Otherwise close the window
pause
java -jar LunarCore.jar
pause
exit

:install
cls
echo Getting resources ready...
mkdir resources
cd resources 
git clone https://github.com/Dimbreath/StarRailData
cd StarRailData
del /F /Q README.md
for /F %%m in ('dir /b') do move "%%m" ..
cd .. 
rmdir /S /Q StarRailData
cd Config
git clone https://gitlab.com/Melledy/LunarCore-Configs
cd LunarCore-Configs
cd Config  
for /F %%m in ('dir /b') do move "%%m" ..\..
cd ..\..
rmdir /S /Q LunarCore-Configs
echo Resources Complete
cd ..\..
echo ----------------------------------
echo Getting data and keystore ready...
git clone https://github.com/Melledy/LunarCore
cd LunarCore
move data ..
move keystore.p12 ..
cd ..
rmdir /S /Q LunarCore
echo Both Complete
echo ---------------------------------------
echo Getting Nightly LunarCore and config...
wget2 https://raw.githubusercontent.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/main/config.json
wget2 https://nightly.link/Melledy/LunarCore/workflows/build/development/LunarCore.zip
7za e LunarCore.zip
del /F /Q LunarCore.zip
echo Completed!
echo Creating run.bat shortcut
echo java -jar LunarCore.jar > run.bat
echo Success, Want to run LunarCore? Otherwise close the window
pause
java -jar LunarCore.jar
pause
exit

:installwithjdk
cls
echo Getting resources ready...
mkdir resources
cd resources 
git clone https://github.com/Dimbreath/StarRailData
cd StarRailData
del /F /Q README.md
for /F %%m in ('dir /b') do move "%%m" ..
cd .. 
rmdir /S /Q StarRailData
cd Config
git clone https://gitlab.com/Melledy/LunarCore-Configs
cd LunarCore-Configs 
cd Config 
for /F %%m in ('dir /b') do move "%%m" ..\..
cd ..\..
rmdir /S /Q LunarCore-Configs
echo Resources Complete
cd ..\..
echo ----------------------------------
echo Getting data and keystore ready...
git clone https://github.com/Melledy/LunarCore
cd LunarCore
move data ..
move keystore.p12 ..
cd ..
rmdir /S /Q LunarCore
echo Both Complete
echo ---------------------------------------
echo Getting Nightly LunarCore and config...
wget2 https://raw.githubusercontent.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/main/config.json
wget2 https://nightly.link/Melledy/LunarCore/workflows/build/development/LunarCore.zip
7za e LunarCore.zip
del /F /Q LunarCore.zip
echo Completed!
echo -------------------------------------
echo Installing Java Development Kit 17...
winget install Microsoft.OpenJDK.17
echo Install success!
echo Creating run.bat shortcut
echo java -jar LunarCore.jar > run.bat
echo Success, Want to run LunarCore? Otherwise close the window
pause
java -jar LunarCore.jar
pause
exit

:installwithcultivation
cls
echo Getting resources ready...
mkdir resources
cd resources 
git clone https://github.com/Dimbreath/StarRailData
cd StarRailData
del /F /Q README.md
for /F %%m in ('dir /b') do move "%%m" ..
cd .. 
rmdir /S /Q StarRailData
cd Config
git clone https://gitlab.com/Melledy/LunarCore-Configs
cd LunarCore-Configs 
cd Config  
for /F %%m in ('dir /b') do move "%%m" ..\..
cd ..\..
rmdir /S /Q LunarCore-Configs
echo Resources Complete
cd ..\..
echo ----------------------------------
echo Getting data and keystore ready...
git clone https://github.com/Melledy/LunarCore
cd LunarCore
move data ..
move keystore.p12 ..
cd ..
rmdir /S /Q LunarCore
echo Both Complete
echo ---------------------------------------
echo Getting Nightly LunarCore and config...
wget2 https://raw.githubusercontent.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/main/config.json
wget2 https://nightly.link/Melledy/LunarCore/workflows/build/development/LunarCore.zip
7za e LunarCore.zip
del /F /Q LunarCore.zip
echo Completed!
echo -------------------------
echo Installing Cultivation...
wget2 https://github.com/Grasscutters/Cultivation/releases/download/v1.2.0-alpha/Cultivation_1.2.0_x64_en-US.msi
msiexec /i Cultivation_1.2.0_x64_en-US.msi
del /F /Q Cultivation_1.2.0_x64_en-US.msi
echo Install success!
echo Creating run.bat shortcut
echo java -jar LunarCore.jar > run.bat
echo Success, Want to run LunarCore? Otherwise close the window
pause
java -jar LunarCore.jar
pause
exit

:installwithboth
cls
echo Getting resources ready...
mkdir resources
cd resources 
git clone https://github.com/Dimbreath/StarRailData
cd StarRailData
del /F /Q README.md
for /F %%m in ('dir /b') do move "%%m" ..
cd .. 
rmdir /S /Q StarRailData
cd Config
git clone https://gitlab.com/Melledy/LunarCore-Configs
cd LunarCore-Configs 
cd Config  
for /F %%m in ('dir /b') do move "%%m" ..\..
cd ..\..
rmdir /S /Q LunarCore-Configs
echo Resources Complete
cd ..\..
echo ----------------------------------
echo Getting data and keystore ready...
git clone https://github.com/Melledy/LunarCore
cd LunarCore
move data ..
move keystore.p12 ..
cd ..
rmdir /S /Q LunarCore
echo Both Complete
echo ---------------------------------------
echo Getting Nightly LunarCore and config...
wget2 https://raw.githubusercontent.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/main/config.json
wget2 https://nightly.link/Melledy/LunarCore/workflows/build/development/LunarCore.zip
7za e LunarCore.zip
del /F /Q LunarCore.zip
echo Completed!
echo -----------------------------------------------------
echo Installing Java Development Kit 17 and Cultivation...
winget install Microsoft.OpenJDK.17
wget2 https://github.com/Grasscutters/Cultivation/releases/download/v1.2.0-alpha/Cultivation_1.2.0_x64_en-US.msi
msiexec /i Cultivation_1.2.0_x64_en-US.msi
del /F /Q Cultivation_1.2.0_x64_en-US.msi
echo Install success!
echo Creating run.bat shortcut
echo java -jar LunarCore.jar > run.bat
echo Success, Want to run LunarCore? Otherwise close the window
pause
java -jar LunarCore.jar