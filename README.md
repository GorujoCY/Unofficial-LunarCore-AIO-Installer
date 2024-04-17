# Unofficial-LunarCore-AIO-Installer
Inno Setup Source Code and where the binary will be distributed (Windows Only). Includes necessary component and client!
# Notice
This installer is NOT AFFILIATED by LunarCore or any third parties, they are credited below and read the [license agreement](https://github.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/blob/main/TextFilesSources/licensetext.txt) for further notices. This is a self project dedicated to make installing it easier but things may still be subject to change.
# Features
- Bundled necessary component and client.
- Choose components to install and/or remove components when uninstalling and create desktop shortcut.
- Shortcuts launches command prompt with the jar executable assuming you have installed it correctly!
- Every file Including data and resources is pre bundled for an out of the box experience (except database, plugin and logs).
- Modified config.json: Relic Level Cap Increased to lv9999 and have disabled `useSSL` for you and some other surprising modifications!
- Haru approved fast installation ([proof](https://media.discordapp.net/attachments/840566418227068968/1225857352238895154/image.png?ex=6622a7a0&is=661032a0&hm=80080232d3ecef34da755d42b084823ed4314ce9df6297160a66d75f8937ee78&=&format=webp&quality=lossless))

**Warning:** if you choose to uninstall it **everything** is removed so backup if you want. The community can explain the backup process for you I'm sure.
# How to use it
Very simply install the [executable](https://github.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/releases/download/1.0/LunarCoreSetup.exe), from there everything is provided in before and after install text, no further explaination is needed.
# Install from Source?
Unfortunately the way Inno setup compiling works is that files get compressed then the installer gets compiled, so by the time you get to have the files you have a fully installed LunarCore and you must posses enough knowledge to install the client and component seperately. 

As suggested by @kostas214 I may ultimately make a batch file that behaves similarly but grabs from source (since winget is bundled these days) and it will be better than the current setup because it grabs the latest github commit and nightly automatically as meanwhile this current approach requires me to maintain/updating the files then posting a new release (but that's how installers work though, files are bundled ready for use so). Dont worry the .exe installer will still be maintaned for as long as I can otherwise im sure there would be others willing to take the job...
# Credits
- [Melledy's LunarCore](https://github.com/Melledy/LunarCore/) for their amazing project!
- [Grasscutters Cultivation](https://github.com/Grasscutters/Cultivation) for their amazing client!
- SRData for helping with resources!
- [Inno Setup](https://github.com/jrsoftware/issrc) That it is powering it with!

Please take the time to read the license agreement for more! 
