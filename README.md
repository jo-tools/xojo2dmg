# Xojo2DMG
Xojo2DMG: CodeSign, DMG creation and Notarization (Post Build Script)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description
Are you distributing macOS Software outside of the Mac App Store? For your users best experience and confidence, your applications have to be notarized by Apple.
A requirement for that is to CodeSign with Hardened Runtime. This might lead to a different Runtime behavior compared to a simple *(unsigned)* DebugRun within the Xojo IDE.
That's why I encourage everyone to CodeSign *(with Hardened Runtime)* each and every DebugRun on macOS, allowing you to develop and debug as close to a Release Build as possible.

This example shows how a Post Build Script can be used in a Xojo project in order to create a customized DiskImage, sign and notarize both .app and .dmg.
You can easily customize the DiskImage's appearance by setting a couple of Variables in the Post Build Script. Additionally, even Notarization can be performed fully scripted. That requires to set up an item in your Keychain - see Info in the Script provided.


### Requirements
1. Xojo running on macOS *(obviously... you can't CodeSign for macOS on Windows)*
2. CodeSigning, CodeSigning-Validation and Notarization requires Xcode to be installed
3. CodeSign of .dmg requires OS X 10.11.5 (or later)
4. Validation of the .dmg's CodeSignature requires macOS 10.12.0 *(or later)*.
5. Notarization: Xcode 11, macOS 10.13.6

### ScreenShots
[This DMG](example-build/Xojo2DMG.dmg) has been created with Xojo2DMG *(built with Xojo 2021r3.1, macOS 12.2, Xcode 13.2.1 for CodeSigning/Notarization)*. It contains the built example app *(built as macOS Universal: x86_64 & ARM64)*.
![ScreenShot: Disk Image](screenshots/xojo2dmg_screenshot_1.png?raw=true)

Xojo IDE with the Post Build Script:  
![ScreenShot: Xojo IDE - PostBuildScript](screenshots/xojo2dmg_screenshot_2.png?raw=true)

## Xojo
### Requirements
[Xojo](https://www.xojo.com/) is a rapid application development for Desktop, Web, Mobile & Raspberry Pi.  

The Desktop application Xojo example project ```Xojo2DMG.xojo_project``` is using:
- Xojo 2018r4
- API 1

### How to use in your own Xojo project?
1. Copy the folder ```scripts``` to your project folder.
2. Create a PostBuild Script in your project and copy-and-paste the example PostBuild Script provided in Xojo2DMG.
3. Read the Comments in PostBuild Script, modify according to your needs *(CodeSign Entitlements, Notarization, DMG look and feel)*.

## About
Juerg Otter is a long term user of Xojo and working for [CM Informatik AG](https://cmiag.ch/). Their Application [CMI LehrerOffice](https://cmi-bildung.ch/) is a Xojo Design Award Winner 2018. In his leisure time Juerg provides some [bits and pieces for Xojo Developers](https://www.jo-tools.ch/).

### Contact
[![E-Mail](https://img.shields.io/static/v1?style=social&label=E-Mail&message=xojo@jo-tools.ch)](mailto:xojo@jo-tools.ch)
&emsp;&emsp;
[![Follow on Facebook](https://img.shields.io/static/v1?style=social&logo=facebook&label=Facebook&message=juerg.otter)](https://www.facebook.com/juerg.otter)
&emsp;&emsp;
[![Follow on Twitter](https://img.shields.io/twitter/follow/juergotter?style=social)](https://twitter.com/juergotter)

### Donation
Do you like this project? Does it help you? Has it saved you time and money?  
You're welcome - it's free... If you want to say thanks I'd appreciate a [message](mailto:xojo@jo-tools.ch) or a small [donation via PayPal](https://paypal.me/jotools).  

[![PayPal Dontation to jotools](https://img.shields.io/static/v1?style=social&logo=paypal&label=PayPal&message=jotools)](https://paypal.me/jotools)
