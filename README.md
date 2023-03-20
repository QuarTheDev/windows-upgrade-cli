<p align="center">
<h1 align="center">Windows Upgrade CLI</h1>
</p>

### What is this?

This is a fairly buggy command-line tool that upgrades your Windows 11 version from Home to Pro, Education, or Enterprise, completely free of cost.

This is meant to be used **legally** in a mass-setup line for schools or businesses.

### Features:

- Choose between Home, Pro, Education, or Enterprise
- In theory, works on Windows 8 and up (tested on Windows 11)
- Fairly simple setup

### Disadvantages

- You **cannot** downgrade back to Home without a fresh install. Use this wisely.
- Setup is pretty buggy, no crash detection yet (soon<sup><sup>TM</sup></sup>)

### ✨ **Installation** ✨

Press `⊞ + S` to open the Search menu, and type `terminal`, right click and press Run as Administrator.

Once you've done that, copy the following script into the terminal:
```
iwr -useb https://raw.githubusercontent.com/QuarTheDev/windows-upgrade-cli/main/upgrader.ps1 | iex
```
A command line will open, and it will ask you which version to upgrade to, asks if you'd like No Media Player mode or not, then installs it.

### What now?

You've upgraded! Congratulations.

### Downgrading:
Open `Settings > System > Recovery`, then select `Reset PC`. As stated before, you **cannot** downgrade without a factory reset.

I am not responsible for any damage this script does. You are the one who chooses to run it.

### Future features
In the future, I plan to work on the following features:

- An automatic 'thumb-drive' version to automatically mass-upgrade many machines
- Removing annoying Windows Script Host dialog boxes
- Proper error-catching & error-codes
- A possible GUI

### Known Issues
There's a small list of known issues. They are currently being worked on or investigated;

- The script always pushes error `0xC004F069`. I have no idea how to stop this.
- On some systems, exit commands are not understood when ran as a standalone `.cmd` script rather than curling from GitHub.
- Sometimes it just doesn't work man. :(

### Questions

> **I found an error. What do I do?**

I encourage you to make an issue regardless of the severity.

> **How can I contribute?**

Make a PR or create an issue!

> **Did anyone really ask these questions?**

Nope!

### Credits
Thanks so much to [`msguides.com`](https://msguides.com/) for their [guide on how to upgrade Windows 11](https://msguides.com/windows-11), which inspired me to make this script.
