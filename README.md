# Unofficial-LunarCore-AIO-Installer
Inno Setup Source Code and where the binary will be distributed alongside batch installer (Windows Only). Includes necessary component and client!
# Notice
This installer is NOT AFFILIATED by LunarCore or any third parties, they are credited below and read the [license agreement](https://github.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/blob/main/TextFilesSources/licensetext.txt) for further notices. This is a self project dedicated to make installing it easier but things may still be subject to change.
# Features
- Bundled necessary component and client.
- Choose components to install and/or remove components when uninstalling and create desktop shortcut.
- Shortcuts launches command prompt with the jar executable assuming you have installed it correctly!
- Every file Including data and resources is pre bundled for an out of the box experience (except database, plugin and logs).
- Modified config.json: Relic Level Cap Increased to lv9999 and have disabled `useSSL` for you and some other surprising modifications!
- Haru approved fast installation ([proof attachment expired](https://media.discordapp.net/attachments/840566418227068968/1225857352238895154/image.png?ex=6622a7a0&is=661032a0&hm=80080232d3ecef34da755d42b084823ed4314ce9df6297160a66d75f8937ee78&=&format=webp&quality=lossless))

**Warning:** if you choose to uninstall/remove it, **everything** is removed so backup if you want. The community can explain the backup process for you I'm sure.
# How to use it
Very simply install the [executable](https://github.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/releases/), from there everything is provided in before and after install text, no further explaination is needed.
# Install from Source?
Unfortunately the way Inno setup compiling works is that files get compressed then the installer gets compiled, so by the time you get to have the files you have a fully installed LunarCore and you must posses enough knowledge to install the client and component seperately. 

However per suggestion of member @kostas214 I've made a [batch file](https://github.com/GorujoCY/Unofficial-LunarCore-AIO-Installer/blob/main/LCfromSource.bat) that automatically fetches the latest LunarCore, all from source with me not needing to update it every so months with updates, you can just install the batch itself and it'll handle the rest with some user input.
# Credits
- [Melledy's LunarCore](https://github.com/Melledy/LunarCore/) for their amazing project!
- [Grasscutters Cultivation](https://github.com/Grasscutters/Cultivation) for their amazing client!
- SRData for helping with resources!
- [Inno Setup](https://github.com/jrsoftware/issrc) That it is powering it with!

Please take the time to read the license agreement for more! 
