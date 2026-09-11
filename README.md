# W11-PC-Setup

> The purpose of this guide is to help you to set up your hardware correctly for best performance in your favourite games.

Command to download the PC-Setup Pack:
```cmd
powershell "IWR "https://codeload.github.com/els212/W11-PC-Setup/zip/refs/heads/main" -OutFile "%userprofile%\Desktop\W11-PC-Setup.zip"
```

You also need to save your actual BIOS settings, important files on your disk and know how to clear CMOS


<h1 id="table-of-contents">TABLE OF CONTENTS<a href="#table-of-contents"></a></h1>

- [1. BIOS](#bios)
    - [1.1. BIOS Update](#bios-update)
    - [1.2. BIOS Settings](#bios-settings)
- [2. Hardware Check](#hardware-check)



<h1 id="bios">1. BIOS<a href="#bios"></a></h1>
Configuring your BIOS settings is the most important step if you're looking to improve performance.

<h2 id="bios-update">1.1. BIOS Update<a href="#bios-update"></a></h2>
Make sure your BIOS is up to date (latest non-beta version) before doing anything.

<h2 id="bios-settings">1.2. BIOS Settings<a href="#bios-settings"></a></h2>
At a minimum, you should: enable XMP/EXPO/DOCP, disable power-saving features, enable resizable bar, apply basic overclock settings with PBO on AMD CPUs, set a proper fan curve, and disable auto download motherboard software. If you play games with demanding anti-cheats, make sure to enable their required BIOS settings.


<h1 id="hardware-check">2. Hardware Check<a href="#hardware-check"></a></h1>


<h1 id="windows-reset">3. Windows Reset<a href="#windows-reset"></a></h1>
You should follow this guide to install Windows without a microsoft account and avoid automatic drivers downloads. Plug in a USB stick of at least 8GB to proceed. Make sure to save the files on your USB stick because this will erase everything.
Download:
    - Windows 11 ISO: https://www.microsoft.com/en-us/software-download/windows11
    - Rufus: https://rufus.ie/en/
Then set up your USB stick to make it bootable and install Windows with. It can take longer depending on your network and USB speed.

When your USB stick is ready, create a .reg file and paste this:
```reg
Windows Registry Editor Version 5.00
; Fichier créé et edité par el.s212 le 10/09/2026 et mis à jour le 10/09/2026

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]
"ExcludeWUDriversInQualityUpdate"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching]
"SearchOrderConfig"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata]
"PreventDeviceMetadataFromNetwork"=dword:00000001
```

Then install Windows with network cable unplugged. When you're in OOBE setup, if you don't see the "I don't have Internet" button, press "SHIFT + F10", a cmd window will open, then enter this command:
```cmd
oobe\bypassnro
```
Proceed to normal setup without a microsoft account. Once on the desktop, run the `.reg` that you created. Restart your PC and plug your network cable back in.