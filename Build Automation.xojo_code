#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep Xojo2DMG , AppliesTo = 0
					'**************************************************
					'Xojo2DMG - How to use with your Xojo-built .app?
					'**************************************************
					'1. copy the folder 'scripts' to your project folder.
					'2. create a PostBuild Script, place it after the
					'   build step and copy-and-paste this one.
					'3. Read the Comments in the PostBuild Script,
					'   modify according to your needs (DMG Look&Feel,
					'   CodeSign Entitlements, Notarization).
					'**************************************************
					
					'**************************************************
					'Setup Xojo2DMG - Post Build Script
					'**************************************************
					'1. Read the comments in this PostBuild Script
					'2. Edit the values according to your needs
					'**************************************************
					'3. If it's working for you: Do you like it? Does it help you? Has it saved you time and money?
					'   You're welcome - it's free...
					'   If you want to say thanks I appreciate a message or a small donation.
					'   Contact: xojo@jo-tools.ch
					'   PayPal:  https://paypal.me/jotools
					'**************************************************
					
					
					'The following Variables are just for convenience:
					Dim sApp_Version As String = PropertyValue("App.ShortVersion")
					If (sApp_Version = "") Then
					sApp_Version = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					End If
					Dim sApp_StageCode As String = ""
					Select Case PropertyValue("App.StageCode")
					Case "0"
					sApp_StageCode = "Dev"
					Case "1"
					sApp_StageCode = "Alpha"
					Case "2"
					sApp_StageCode = "Beta"
					End Select
					
					'if you want to see what's going on in Terminal.app, then set bOpenInTerminal to true
					'this might be a more helpful output when something goes wrong
					'Notarization might take a long while... so you don't want the IDE to seem
					'not be responding in the post build step (it will show a Spinning Wheel during
					'execution of a synchronous ShellScript, opening in Terminal will do this
					'synchronously)
					Dim bOpenInTerminal As Boolean = True
					
					
					'*********************************************************
					'DebugBuilds: do you want to CodeSign the DebugRun's, too?
					'*********************************************************
					'a good idea, since the application's behavior with HardenedRuntime
					'will be different...
					'Note: You will need to add your DeveloperID below to activate CodeSigning
					Dim bDebugBuild_DoCodeSign As Boolean = True
					
					If bDebugBuild_DoCodeSign And DebugBuild Then
					'just Codesigning (without DMG Creation and Notarization) is
					'fine in a 'hidden way', since it doesn't take too long
					bOpenInTerminal = False
					'this will be enforced below... you don't want the IDE to be launching
					'the app while it is still being codesigned (asynchronous in Terminal)
					End If
					
					'*******************************
					'required: Xojo Project Settings
					'*******************************
					Dim sPROJECT_PATH As String = Trim(DoShellCommand("echo $PROJECT_PATH", 0))
					If Right(sPROJECT_PATH, 1) = "/" Then
					'no trailing /
					sPROJECT_PATH = Mid(sPROJECT_PATH, 1, Len(sPROJECT_PATH)-1)
					End If
					Dim sBUILD_LOCATION As String = ReplaceAll(CurrentBuildLocation, "\", "") 'don't escape Path
					Dim sBUILD_APPNAME As String = CurrentBuildAppName
					Dim sBUILD_TYPE As String = "release"
					If DebugBuild Then sBUILD_TYPE = "debug"
					Dim sDEBUGBUILD_CODESIGN As String = "no"
					If bDebugBuild_DoCodeSign Then sDEBUGBUILD_CODESIGN = "yes"
					
					'************************************
					'required: DMG settings/customization
					'************************************
					Dim sDMG_VOLUME_FILENAME As String = Trim(CurrentBuildAppName + " " + sApp_StageCode)
					Dim sDMG_VOLUME_TITLE As String = CurrentBuildAppName + " " + sApp_Version
					Dim sDMG_VOLUME_ICON As String = sPROJECT_PATH + "/scripts/resources/volumeicon.icns"
					'Please note: the Images have to be 72DPI!
					Dim sDMG_BACKGROUND_IMG_1x As String = sPROJECT_PATH + "/scripts/resources/backgroundImage_1x.png" 'Non-Retina
					Dim sDMG_BACKGROUND_IMG_2x As String = sPROJECT_PATH + "/scripts/resources/backgroundImage_2x.png" 'Retina
					Select Case PropertyValue("App.StageCode")
					Case "3" 'Final
					'use the BackgroundImage set just above
					Else
					'not a final build - you might want to use a different BackgroundImage that has a 'PreRelease label'
					'sDMG_BACKGROUND_IMG_1x = sPROJECT_PATH + "/scripts/resources/backgroundImage_1x.png" 'Non-Retina
					'sDMG_BACKGROUND_IMG_2x = sPROJECT_PATH + "/scripts/resources/backgroundImage_2x.png" 'Retina
					End Select
					Dim sDMG_ALIAS_CAPTION As String = "copy 2 Applications" 'how to label the Alias to the Applications folder
					Dim sDMG_WINDOW_BOUNDS As String = "200, 100, 845, 575" 'position the window, change according to your BackgroundPicture
					Dim sDMG_ICON_SIZE As String = "128"
					Dim sDMG_TEXT_SIZE As String = "16"
					Dim sDMG_ICON_POSITION_APP As String = "160, 315" 'where to position the Icon of your App
					Dim sDMG_ICON_POSITION_ALIAS As String = "500, 315"'where to position the Icon of the Alias to Applications
					Dim sDMG_FILE_ICON As String = sPROJECT_PATH + "/scripts/resources/volumeicon.icns"
					
					'*************************
					'CodeSign with DeveloperID
					'*************************
					'https://developer.apple.com/support/developer-id/
					'You obviously need to be a registered Apple Developer.
					'Then you can get your DeveloperID Certificate using Xcode
					'Xcode -> Preferences -> Account: [Manage Certificates]
					'https://help.apple.com/xcode/mac/current/#/dev154b28f09
					'
					'To enable CodeSign with Xojo2DMG:
					'fill in sCODESIGN_IDENT below... Otherwise, no CodeSigning will be performed
					'
					'Open "Keychain Access" and look at your certificates
					'find your DeveloperID certicate's name, e.g.: Developer ID Application: YOUR NAME (ABCDEF)
					'use the part that's before the brackets, e.g.:
					'
					'Dim sCODESIGN_IDENT As String = "Developer ID Application: YOUR NAME"
					Dim sCODESIGN_IDENT As String = ""
					
					'*********************
					'CodeSign Entitlements
					'*********************
					'edit entitlements.plist in scripts/resources (e.g. for XojoScript or AppleEvents/Automation)
					' - Automation requires true for: com.apple.security.automation.apple-events
					' - XojoScript requires true for: com.apple.security.cs.allow-jit, com.apple.security.cs.allow-unsigned-executable-memory
					' - sideloading .dylibs (e.g. via Plugins) might need: com.apple.security.cs.allow-dyld-environment-variables
					' - Xojo2DMG is force codesigning Xojo Plugin's .dylibs
					'   that's why this one is not needed. you might need it if you add additional .dylibs
					'   com.apple.security.cs.disable-library-validation
					'
					'Read more about the Hardened Runtime Entitlements here:
					'https://developer.apple.com/documentation/security/hardened_runtime_entitlements
					'
					'For your own app: I suggest to set them all to false first
					'And only set those to true that you really need
					
					Dim sCODESIGN_ENTITLEMENTS As String = sPROJECT_PATH + "/scripts/resources/entitlements.plist"
					
					
					'*********************
					'Notarization by Apple
					'*********************
					'This requires CodeSigning (with DeveloperID) to be enabled (see above)
					'To additionally set up Notarization, Xojo2DMG will need a specific item in Keychain
					'System requirement: macOS 10.13.6 (otherwise Notarization will be skipped)
					'
					'Apple's Documentation:
					'https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution
					'Xojo2DMG uses the customized workflow:
					'https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution/customizing_the_notarization_workflow?language=objc
					
					'**************************************************************
					'Keychain: Notarization
					'**************************************************************
					'1st: You need to create an application specific password for your AppleID:
					'     https://support.apple.com/en-us/HT204397
					'
					'2nd: The asc-provider flag for the notarization is needed if the AppleID is associated with multiple teams.
					'
					'You need to indicate the 'provider short name' for the appropriate team.
					'We do this anyway (even with no multiple teams).
					'
					'Starting in Xcode 11, you can use altool to get a table of providers, provider short names,
					'and team IDs associated with a given username and password using the list-providers flag:
					'
					'xcrun altool --list-providers -u "my-apple-id@icloud.com"
					'
					'Note: provide your AppleID and your application-specific-password for Notarization
					'      The password that it is asking for is the app specific password. The 19 character password. Not your Apple ID password.
					'
					'
					'Now that you have all information you need:
					'Add that AppleID, asc-provider and password to your keychain:
					'
					'security add-generic-password -s Xojo2DMGAppNotarization -a my-apple-id@icloud.com -j my-provider-shortname -w App-Specific-PaSSW0rd
					'
					
					'**************************************************************
					'Notarization does not work?
					'---------------------------
					'Most common 'error' is that you haven't accepted the latest
					'Contracts in Apple's Developer Portal and/or AppStore
					'https://developer.apple.com/
					'https://appstoreconnect.apple.com/
					'Always good to check is: Launch Xcode, and see if everything
					'is OK with your Account. Xcode -> Preferences -> Account
					'
					'Which Password for Notarization (for the Keychain item and 'xcrun altool' to figure out the 'provider short name')
					'-------------------------------
					'The password that it is asking for is the app specific password. The 19 character password. Not your Apple ID password.
					'
					'Error: xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
					'--------------------------------------------------
					'Hint from Duane Mitchell:
					'The solution was to run this line in Terminal:
					'sudo xcode-select --reset
					'
					'Apple Documentation: Resolving Common Notarization Issues
					'---------------------------------------------------------
					'https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution/resolving_common_notarization_issues
					'**************************************************************
					
					Dim sNOTARIZE As String = "no"
					
					'set this Boolean to true if you want to send the built .dmg to Apple for Notarization
					'you might want to notarize both Beta and Final Builds, but no
					'Alphas and Development Builds. If you're going to distribute Beta builds,
					'then it's recommended to Notarize them, too.
					'Note: Notarization will only be performed in release builds, and not in DebugBuilds
					'      so a DebugRun will never get Notarized
					'Note: macOS 10.14.5 and later will fail to validate a non-notarized .dmg
					'      that expected error will be ignored. It's highly recommended to
					'      notarize every build.
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sNOTARIZE = "no"
					Case "1" 'Alpha
					sNOTARIZE = "no"
					Case "2" 'Beta
					sNOTARIZE = "yes"
					Case "3" 'Final
					sNOTARIZE = "yes"
					End Select
					
					
					'*******************************************
					'Xojo2DMG - Let's go...
					'*******************************************
					'you shouldn't need to modify anything below
					'(but feel free to do so :-)
					'*******************************************
					If (Not TargetMacOS) Then
					Print "Xojo2DMG can only be run on macOS. You can't CodeSign and Notarize for macOS on other Platforms."
					Return
					End If
					
					'Check: Unsupported XojoVersion when building Universal (Intel 64Bit, ARM 64Bit)
					If ((CurrentBuildTarget = 24) And (Right(sBUILD_LOCATION, 18) = "/_macOS ARM 64 bit")) _
					Or _
					((CurrentBuildTarget = 16) And (Right(sBUILD_LOCATION, 14) = "/_macOS 64 bit")) Then
					Print "Xojo2DMG doesn't support building Universal (Intel 64Bit, ARM 64Bit) with Xojo " + Format(XojoVersion, "0000.00#") + _
					EndOfLine + EndOfLine + _
					"The reason is that the PostBuild Scripts get triggered multiple times, with no indication when the Universal Build has finished."
					Return
					End If
					
					If (sCODESIGN_IDENT = "") Then
					If (sBUILD_TYPE = "release") Then
					Print "Xojo2DMG: Add the required Variable 'sCODESIGN_IDENT' in the Post Build Step - Xojo2DMGScript in order to enable CodeSigning." + EndOfLine + EndOfLine + "The Script now continues to create a .dmg without CodeSigning (and without Notarization)."
					Elseif (sDEBUGBUILD_CODESIGN = "yes") Then
					Print "Xojo2DMG: Add the required Variable 'sCODESIGN_IDENT' in the Post Build Step - Xojo2DMGScript in order to enable CodeSigning." + EndOfLine + EndOfLine + "The Script now continues the DebugRun without CodeSigning."
					End If
					End If
					
					'Check Xojo's Build Target
					Select Case CurrentBuildTarget
					Case 7
					'macOS: Intel 32Bit
					If (Not DebugBuild) Then
					Print "Xojo2DMG: Putting a 32Bit application into a DMG is fine." + EndOfLine + EndOfLine + "If you intend to CodeSign and Notarize, you should build an Intel 64Bit or Universal (Intel 64Bit, ARM 64Bit) application."
					End If
					Case 16
					'macOS: Intel 64Bit
					Case 24
					'macOS: ARM 64Bit
					Case 9
					'macOS: Universal (Intel 64Bit, ARM 64Bit)
					Else
					Print "Supported macOS Build Targets for Xojo2DMG are: Intel (32Bit / 64Bit), ARM (64Bit) and Universal (Intel 64Bit, ARM 64Bit)." + EndOfLine + EndOfLine + "CurrentBuildTarget: " + Str(CurrentBuildTarget)
					Return
					End Select
					
					If (sPROJECT_PATH = "") Then
					Print "Xojo2DMG requires to get the Environment Variable $PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'The Contents of Array will later be passed to
					'the ShellScript 'xojo2dmg.sh', which does all the processing
					'
					'The order is important, so don't change anything here without
					'changing the ShellScript, too.
					Dim sShellArguments() As String
					
					'Parameters required to create the .DMG
					sShellArguments.Append(sPROJECT_PATH)
					sShellArguments.Append(sBUILD_LOCATION)
					sShellArguments.Append(sBUILD_APPNAME)
					
					sShellArguments.Append(sBUILD_TYPE)
					sShellArguments.Append(sDEBUGBUILD_CODESIGN)
					
					sShellArguments.Append(Trim(sDMG_VOLUME_FILENAME))
					sShellArguments.Append(Trim(sDMG_VOLUME_TITLE))
					sShellArguments.Append(sDMG_VOLUME_ICON)
					sShellArguments.Append(sDMG_BACKGROUND_IMG_1x)
					sShellArguments.Append(sDMG_BACKGROUND_IMG_2x)
					sShellArguments.Append(sDMG_ALIAS_CAPTION)
					sShellArguments.Append(sDMG_WINDOW_BOUNDS)
					sShellArguments.Append(sDMG_ICON_SIZE)
					sShellArguments.Append(sDMG_TEXT_SIZE)
					sShellArguments.Append(sDMG_ICON_POSITION_APP)
					sShellArguments.Append(sDMG_ICON_POSITION_ALIAS)
					sShellArguments.Append(sDMG_FILE_ICON)
					
					'Parameters for CodeSign and Notarization
					sShellArguments.Append(sCODESIGN_IDENT)
					sShellArguments.Append(sCODESIGN_ENTITLEMENTS)
					sShellArguments.Append(sNOTARIZE)
					
					'Make sure the ShellScript is executable:
					Call DoShellCommand("chmod 755 """ + sPROJECT_PATH + "/scripts/xojo2dmg.sh""", 0)
					
					If (Not DebugBuild) And bOpenInTerminal Then
					'Automate Terminal:
					'Pass ShellArguments to Script and execute it in Terminal.app
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sPROJECT_PATH + "/scripts/xojo2dmg.sh\"" \""" + Join(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
					'Let's call the ShellScript (and Pass ShellArguments to the Script)
					'This will be executed synchronously - the IDE will be 'busy'
					'and showing a Spinning Wheel if this is taking a long time
					Dim sShellResult As String
					Dim iShellResult As Integer
					sShellResult = DoShellCommand("""" + sPROJECT_PATH + "/scripts/xojo2dmg.sh"" """ + Join(sShellArguments, """ """) + """", 0, iShellResult)
					
					'Process and Parse the output of the ShellScript
					Dim sXojo2CodeSignErrors() As String
					Dim sShellResultLines() As String
					sShellResultLines = Split(ReplaceAll(sShellResult, EndOfLine, "*****"), "*****")
					For i As Integer = 0 To UBound(sShellResultLines)
					'get all lines with Xojo2DMG Errors (and not the full output)
					If (Left(sShellResultLines(i), 15) = "Xojo2DMG ERROR:") Then
					sXojo2CodeSignErrors.Append(sShellResultLines(i))
					End If
					Next
					
					Select Case iShellResult
					Case 2
					'DebugRun without Codesigning: xojo2dmg.sh will return with 'exit 2'
					'don't put Result in Clipboard, don't show errors - it's all OK
					Return
					Case 8
					'xojo2dmg.sh will 'exit 8' if variables aren't ok
					sXojo2CodeSignErrors.Append("Xojo2DMG: Check your input variables.")
					Case 9
					'xojo2dmg.sh will 'exit 9' if required variables are missing
					sXojo2CodeSignErrors.Append("Xojo2DMG: Missing some input variables.")
					Case 11
					'xojo2dmg.sh will 'exit 9' if CodeSigning (and it's validation) has failed
					sXojo2CodeSignErrors.Append("Xojo2DMG: There's something wrong with CodeSign.")
					Case 12
					'xojo2dmg.sh will 'exit 9' if Notarization (and it's validation) has failed
					sXojo2CodeSignErrors.Append("Xojo2DMG: There's something wrong with Notarization.")
					Case 0
					'Yeah... it's all OK!
					Else
					'Hmm... something went wrong...
					sXojo2CodeSignErrors.Append("xojo2dmg.sh quit with ShellResult: " + Str(iShellResult))
					End Select
					
					'If there are errors:
					If (UBound(sXojo2CodeSignErrors) >= 0) Then
					'print just the Errors, and have the full output in Clipboard
					Print Join(sXojo2CodeSignErrors, EndOfLine) + EndOfLine + "Note: Shell Output is in Clipboard"
					Clipboard = sShellResult
					End If
					
					Return
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
