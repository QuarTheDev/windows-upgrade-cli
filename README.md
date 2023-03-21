<p align="center">
<h1 align="center">Windows Upgrade CLI</h1>
</p>

### What is this?

This is a fairly buggy command-line tool that upgrades your Windows 11 version from Home to Pro, Education, or Enterprise, completely free of cost.

This is meant to be used **legally** in a mass-setup line for schools or businesses.

### Features:

- Choose between Home, Pro, Education, or Enterprise
- Works on Windows 10 and up (tested on Windows 11)
- Fairly simple to run and execute

### Disadvantages

- No error-catching
- *Lots* of inefficient code
- No real wiki yet

### DISCLAIMER

**I'm not responsible for any damage this script does.** In the end, **you** are the one who chose to run it. Understand the risks involved with this tool:
 - Irreversible data loss
 - Product key loss

### ✨ **Installation** ✨ <sup><sub>For *one* machine</sub></sup>

Press `⊞ + S` to open the Search menu, and type `wt`, right click and press Run as Administrator.

Once you've done that, copy the following script into the terminal:
```
iwr -useb https://github.com/QuarTheDev/windows-upgrade-cli/raw/main/upgrader.ps1 | iex
```
A command line will open, and it will ask you which version to upgrade to, asks if you'd like No Media Player mode or not, then upgrades for you.

### What now?

You've upgraded! Congratulations.

### ✨ **Installation** ✨ <sup><sub>For *multiple* machines</sub></sup>

There is currently no mass-upgrader tool available. I've tried using `autorun` functionality, but it seems it's been disabled on modern versions of Windows. As such, you may have to click the 'thumb-drive/mass-upgrade' tool manually, but beyond there it will automatically upgrade depending on which selection you make. Please wait until I make this part.

### ✨ Downgrading ✨

Do you **not** want an active Windows installation anymore, or do you want to revert back to your OEM product key? Well, **you're in luck!**

Press `⊞ + S` to open the Search menu, and type `restore`, then press enter

Once you've done that, click 'System Restore...'

A new window will open. At the bottom, select 'Choose a different restore point', press Next, and select the restore point titled `Windows Key Upgrade Utility`. Press next.

Double-check that you selected the correct restore point, and then press Finish to revert back to your old key. **This will require a restart.**

### Future features
In the future, I plan to work on the following features:
<sup>**ⓘ** ‌ ‌ Entries marked as ✨ are actively being developed:</sup>

- <sup><sub>✨</sub></sup> An automatic 'thumb-drive' version to automatically mass-upgrade many machines 
- <sup><sub>✨</sub></sup> Removing annoying Windows Script Host dialog boxes
- Proper error-catching & error-codes
- A possible GUI

### Known Issues
There's a small list of known issues. They are currently being worked on or investigated;

- The script always pushes error `0xC004F069`. I'm not sure how to prevent this dialog box from appearing.
- On virtual machines, some of the commands are not understood.

### Questions

> **I found an error. What do I do?**

I encourage you to [make an issue](https://github.com/QuarTheDev/windows-upgrade-cli/issues) regardless of the severity.

> **How can I contribute?**

Make a [PR](https://github.com/QuarTheDev/windows-upgrade-cli/pulls) or [create an issue](https://github.com/QuarTheDev/windows-upgrade-cli/issues)!

> **Did anyone really ask these questions?**

Nope!

### Credits
Thanks so much to [`msguides.com`](https://msguides.com/) for their [guide on how to upgrade Windows 11](https://msguides.com/windows-11), which inspired me to make this little script.
