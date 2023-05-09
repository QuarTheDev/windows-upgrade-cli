<p align="center">
<h1 align="center">Windows Upgrade CLI</h1>
</p>

### What is this?

This is a command-line utility that upgrades your Windows 11 version from Home to Pro, Education, or Enterprise, completely free of cost.

This is meant to be used **legally** in a mass-setup line for schools or businesses.

### Features:

- Choose between Home, Pro, Education, or Enterprise
- Works on Windows 10 and up (tested on Windows 11)
- Automatically creates a restore point before installation
- Automatic simple installation or verbose manual installation
- Simple to run and execute

### Disadvantages

- No proper error-catching
- Inefficient code
- No wiki (yet)

### DISCLAIMER

**I'm not responsible for any damage this script does.** In the end, **you** are the one who chose to run it. Understand the risks involved with this tool:

 - Possible product key loss

### ✨ **Installation** ✨ <sup><sub>For *one* machine</sub></sup>

**Method 1 - Stable**
Press `⊞ + S` to open the Search menu, and type `wt`, right click and press Run as Administrator.

Once you've done that, copy the following script into the terminal:
```
'[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12'; iwr -useb 'https://raw.githubusercontent.com/QuarTheDev/windows-upgrade-cli/main/upgrader_single.ps1'|%{$_}|iex
```
A command line will open, and it will ask you which version to upgrade to, asks if you'd like No Media Player mode or not, then upgrades for you.

**Method 2 - Unstable**<br>
If you like quirky, unstable stuff like me, I've uploaded experimental binaries (.exe) files that you can execute simply by double-clicking. They ***do*** require administrator privileges.<br><br>
[⬇️ **UpgradeCLI_Single_x64.exe**](https://github.com/QuarTheDev/windows-upgrade-cli/releases/latest/download/UpgradeCLI_Single_x64.exe)  (64-bit)<br>
[⬇️ **UpgradeCLI_Single_x86.exe**](https://github.com/QuarTheDev/windows-upgrade-cli/releases/latest/download/UpgradeCLI_Single_x86.exe)  (32-bit)

### ✨ **Installation** ✨ <sup><sub>For *multiple* machines</sub></sup>

**Method 1 - Stable**
Press `⊞ + S` to open the Search menu, and type `wt`, right click and press Run as Administrator.

Once you've done that, copy the following script into the terminal:
```
'[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12'; iwr -useb 'https://raw.githubusercontent.com/QuarTheDev/windows-upgrade-cli/main/upgrader_multiple.ps1'|%{$_}|iex
```
A command line will open, and it will ask you which version to upgrade to, asks if you'd like No Media Player mode or not, then upgrades for you.

**Method 2 - Unstable**<br>
If you like quirky, unstable stuff like me, I've uploaded experimental binaries (.exe) files that you can execute simply by double-clicking. They ***do*** require administrator privileges.<br><br>
[⬇️ **UpgradeCLI_Multi_x64.exe**](https://github.com/QuarTheDev/windows-upgrade-cli/releases/latest/download/UpgradeCLI_Multi_x64.exe)  (64-bit)<br>
[⬇️ **UpgradeCLI_Multi_x86.exe**](https://github.com/QuarTheDev/windows-upgrade-cli/releases/latest/download/UpgradeCLI_Multi_x86.exe)  (32-bit)

### ✨ Downgrading ✨

Do you **not** want an active Windows installation anymore, or do you want to revert back to your OEM product key? Well, **you're in luck!**

Press `⊞ + S` to open the Search menu, and type `restore`, then press enter

Once you've done that, click 'System Restore...'

A new window will open. At the bottom, select 'Choose a different restore point', press Next, and select the restore point titled `Windows Key Upgrade Utility`. Press next.

Double-check that you selected the correct restore point, and then press Finish to revert back to your old key. **This will require a restart.**

### Future features
In the future, I plan to work on the following features:<br><sup>**ⓘ** ‌ ‌ Entries marked as ✨ are actively being developed:</sup>

- <sup><sub>✨</sub></sup> An automatic 'thumb-drive' version to automatically mass-upgrade many machines 
- <sup><sub>✨</sub></sup> Removing annoying Windows Script Host dialog boxes
- Proper error-catching & error-codes
- A possible GUI

### What's new?
In v1.10 (major), I've implemented the following:

- An automatic version to mass-upgrade many machines 
- Removed annoying Windows Script Host dialog boxes
- Paving the way for proper error-catching & exit-codes
- Some code clean-up after months of studying PowerShell

### Known Issues
There's a small list of known issues. They are currently being worked on or investigated.

- On virtual machines (i.e. Windows Sandbox), some of the commands are not interpreted properly.

### Questions

**I found an error. What do I do?**

> I encourage you to [make an issue](https://github.com/QuarTheDev/windows-upgrade-cli/issues). Thank you in advance!

**How can I contribute?**

> Make a [PR](https://github.com/QuarTheDev/windows-upgrade-cli/pulls) or [create an issue](https://github.com/QuarTheDev/windows-upgrade-cli/issues)!

**Did anyone really ask these questions?**

> Nope!

### Credits
Thanks so much to [`msguides.com`](https://msguides.com/) for their [guide on how to upgrade Windows 11](https://msguides.com/windows-11), which inspired me to make this little script.
Bundle of thanks to [`stackedit.io`](https://github.com/benweet/stackedit/) for their fantastic [online Markdown editor](https://stackedit.io/app).
