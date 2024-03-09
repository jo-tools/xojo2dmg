#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				End
				Begin IDEScriptBuildStep Xojo2DMG , AppliesTo = 0, Architecture = 0, Target = 0
					'**************************************************
					'Xojo2DMG - How to use with your Xojo-built .app?
					'**************************************************
					'1. Copy the folder 'scripts' to your project folder.
					'2. Create a PostBuild Script, place it after the
					'   'Build' step and copy-and-paste the contents of this one.
					'3. If you're using Xojo 2022r1 (or newer): make sure
					'   this PostBuild Script runs after the Step 'Sign'.
					'   Otherwise Xojo will overwrite the CodeSigning
					'   again with it's 'Sign' step.
					'4. Read the Comments in the PostBuild Script,
					'   modify it according to your needs (DMG Look&Feel,
					'   CodeSign Entitlements, Notarization).
					'**************************************************
					
					'**************************************************
					'Setup Xojo2DMG - Post Build Script
					'**************************************************
					'1. Read the comments in this PostBuild Script
					'2. Edit the values according to your needs
					'**************************************************
					'3. If it's working for you:
					'   Do you like it? Does it help you? Has it saved you time and money?
					'   You're welcome - it's free...
					'   If you want to say thanks I appreciate a message or a small donation.
					'   Contact: xojo@jo-tools.ch
					'   PayPal:  https://paypal.me/jotools
					'**************************************************
					
					
					'The following Variables are just for convenience:
					Var sApp_Version As String = PropertyValue("App.Version")
					If (sApp_Version = "") Then
					sApp_Version = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					End If
					Var sApp_StageCode As String = ""
					Select Case PropertyValue("App.StageCode")
					Case "0"
					sApp_StageCode = "Dev"
					Case "1"
					sApp_StageCode = "Alpha"
					Case "2"
					sApp_StageCode = "Beta"
					End Select
					
					'Detect if this Build is called in a GitHub Actions Workflow
					Var bIsGitHubActions As Boolean = EnvironmentVariable("GITHUB_WORKSPACE") <> "" And EnvironmentVariable("FOLDER_BUILDS") <> "" And EnvironmentVariable("FOLDER_BUILDS_MACOS_UNIVERSAL") <> "" And EnvironmentVariable("BUILD_MACOS_UNIVERSAL_POSTBUILD_SHELLSCRIPT") <> ""
					
					'If you want to use a folder other than '/scripts', then change this variable
					Var sFolderScripts As String = "/scripts"
					Var sFolderScriptsResources As String = sFolderScripts + "/resources"
					
					'If you want to see what's going on in Terminal.app, then set bOpenInTerminal to true.
					'This might be a more helpful output when something goes wrong.
					'Notarization might take a long while... so you don't want the IDE to seem
					'not be responding in the post build step (it will show a Spinning Wheel during
					'execution of a synchronous ShellScript, opening in Terminal will do this
					'asychronously outside of the Xojo IDE).
					Var bOpenInTerminal As Boolean = True
					
					
					'*********************************************************
					'DebugBuilds: do you want to CodeSign the DebugRun's, too?
					'*********************************************************
					'This is a good idea, since the application's behavior with
					'HardenedRuntime will be different...
					'Note: You will need to add your DeveloperID below to activate CodeSigning
					Var bDebugBuild_DoCodeSign As Boolean = True
					
					If bDebugBuild_DoCodeSign And DebugBuild Then
					'Just Codesigning (without DMG Creation and Notarization) is
					'fine in a 'hidden way', since it doesn't take too long
					bOpenInTerminal = False
					'This will be enforced below... you don't want the IDE to be launching
					'the app while it is still being codesigned (asynchronous in Terminal)
					End If
					
					'*******************************
					'Required: Xojo Project Settings
					'*******************************
					Var sPROJECT_PATH As String = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'No trailing /
					sPROJECT_PATH = sPROJECT_PATH.Middle(1, sPROJECT_PATH.Length-1)
					End If
					Var sBUILD_LOCATION As String = CurrentBuildLocation.ReplaceAll("\", "") 'don't escape Path
					Var sBUILD_APPNAME As String = CurrentBuildAppName 'Xojo 2022r1 adds .app
					If (sBUILD_APPNAME.Right(4) = ".app") Then sBUILD_APPNAME = sBUILD_APPNAME.Left(sBUILD_APPNAME.Length-4)
					Var sBUILD_TYPE As String = "release"
					If DebugBuild Then sBUILD_TYPE = "debug"
					Var sDEBUGBUILD_CODESIGN As String = "no"
					If bDebugBuild_DoCodeSign Then sDEBUGBUILD_CODESIGN = "yes"
					
					'************************************
					'Required: DMG settings/customization
					'************************************
					Var sDMG_VOLUME_FILENAME As String = sBUILD_APPNAME + " " + sApp_StageCode
					Var sDMG_VOLUME_TITLE As String = sBUILD_APPNAME + " " + sApp_Version
					Var sDMG_VOLUME_ICON As String = sPROJECT_PATH + sFolderScriptsResources + "/volumeicon.icns"
					'Please note: the Images have to be 72DPI!
					Var sDMG_BACKGROUND_IMG_1x As String = sPROJECT_PATH + sFolderScriptsResources + "/backgroundImage_1x.png" 'Non-Retina
					Var sDMG_BACKGROUND_IMG_2x As String = sPROJECT_PATH + sFolderScriptsResources + "/backgroundImage_2x.png" 'Retina
					Select Case PropertyValue("App.StageCode")
					Case "3" 'Final
					'Use the BackgroundImage set just above
					Else
					'Not a final build - you might want to use a different BackgroundImage that has a 'PreRelease label'
					'sDMG_BACKGROUND_IMG_1x = sPROJECT_PATH + sFolderScriptsResources + "/backgroundImage_1x.png" 'Non-Retina
					'sDMG_BACKGROUND_IMG_2x = sPROJECT_PATH + sFolderScriptsResources + "/backgroundImage_2x.png" 'Retina
					End Select
					Var sDMG_ALIAS_CAPTION As String = "copy 2 Applications" 'how to label the Alias to the Applications folder
					Var sDMG_WINDOW_BOUNDS As String = "200, 100, 845, 575" 'position the window, change according to your BackgroundPicture
					Var sDMG_ICON_SIZE As String = "128"
					Var sDMG_TEXT_SIZE As String = "16"
					Var sDMG_ICON_POSITION_APP As String = "160, 315" 'where to position the Icon of your App
					Var sDMG_ICON_POSITION_ALIAS As String = "500, 315"'where to position the Icon of the Alias to Applications
					Var sDMG_FILE_ICON As String = sPROJECT_PATH + sFolderScriptsResources + "/volumeicon.icns"
					
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
					'Open "Keychain Access" and look at your certificates.
					'Find your DeveloperID certicate's name, e.g.: Developer ID Application: YOUR NAME (ABCDEF).
					'Use the part that's before the brackets, e.g.:
					'
					'Var sCODESIGN_IDENT As String = "Developer ID Application: YOUR NAME"
					Var sCODESIGN_IDENT As String = ""
					
					If bIsGitHubActions Then
					'In GitHub Actions we're going to configure this outside in Workflows
					Var sEnvCodesignIdent As String = EnvironmentVariable("CODESIGN_IDENT")
					If (sEnvCodesignIdent <> "") Then sCODESIGN_IDENT = sEnvCodesignIdent
					End If
					
					'*********************
					'CodeSign Entitlements
					'*********************
					'Edit entitlements.plist in scripts/resources (e.g. for XojoScript or AppleEvents/Automation)
					' - Automation requires true for: com.apple.security.automation.apple-events
					' - XojoScript requires true for: com.apple.security.cs.allow-jit, com.apple.security.cs.allow-unsigned-executable-memory
					' - Side-Loading .dylibs (e.g. via Plugins) might need: com.apple.security.cs.allow-dyld-environment-variables
					' - Xojo2DMG will be force codesigning Xojo Plugin's .dylibs
					'   That's why this one is not needed. You might need it if you add additional .dylibs
					'   com.apple.security.cs.disable-library-validation
					'
					'Read more about the Hardened Runtime Entitlements here:
					'https://developer.apple.com/documentation/security/hardened_runtime_entitlements
					'
					'For your own app: I suggest to set them all to false first
					'And only set those to true that you really need
					
					Var sCODESIGN_ENTITLEMENTS As String = sPROJECT_PATH + sFolderScriptsResources + "/entitlements.plist"
					
					
					'*********************
					'Notarization by Apple
					'*********************
					'This requires CodeSigning (with DeveloperID) to be enabled (see above)
					'To additionally set up Notarization, Xojo2DMG will need a specific item in Keychain
					'Minimum System requirements: macOS 11.3, Xcode 13 (otherwise Notarization will be skipped)
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
					'2nd: You need to know the TeamID. This is especially important if the AppleID is associated with multiple teams.
					'     The TeamID is shown on https://developer.apple.com/ -> Account: MemberShip Details
					'
					'Now that you have all information you need:
					'Store these credentials (AppleID, TeamID, app-specific password) using Apple's notarytool to your keychain:
					'
					'xcrun notarytool store-credentials "Xojo2DMG-notarytool" --apple-id "my-appleid@icloud.com" --team-id "XXXXXXXXXX" --password "aaaa-bbbb-cccc-dddd"
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
					'Which Password for Notarization (for the Keychain item and notarytool)
					'-------------------------------
					'The password that it is asking for is the app-specific password. The 19 character password. Not your Apple ID password.
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
					
					Var sNOTARIZE As String = "no"
					
					'Set this Boolean to true if you want to send the built .dmg to Apple for Notarization
					'You might want to notarize both Beta and Final Builds, but no Alphas and Development Builds.
					'If you're going to distribute Beta builds, then it's highly recommended to Notarize them, too.
					'
					'Note: Notarization will only be performed in release builds, never in DebugBuilds.
					'      So a DebugRun will never get Notarized.
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
					
					'Sanity Check: Unsupported XojoVersion when building Universal (Intel 64Bit, ARM 64Bit)
					If ((CurrentBuildTarget = 24) And (sBUILD_LOCATION.Right(18) = "/_macOS ARM 64 bit")) _
					Or _
					((CurrentBuildTarget = 16) And (sBUILD_LOCATION.Right(14) = "/_macOS 64 bit")) Then
					Print "Xojo2DMG doesn't support building Universal (Intel 64Bit, ARM 64Bit) with Xojo " + Format(XojoVersion, "0000.00#") + _
					EndOfLine + EndOfLine + _
					"The reason is that the PostBuild Scripts get triggered multiple times, with no indication when the Universal Build has finished."
					Return
					End If
					
					If (sCODESIGN_IDENT = "") Then
					If (sBUILD_TYPE = "release") Then
					Print "Xojo2DMG: Add the required Variable 'sCODESIGN_IDENT' in the Post Build Step - Xojo2DMGScript in order to enable CodeSigning." + EndOfLine + EndOfLine + "The Script now continues to create a .dmg without CodeSigning (and without Notarization)."
					ElseIf (sDEBUGBUILD_CODESIGN = "yes") Then
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
					Var sShellArguments() As String
					
					'Parameters required to create the .DMG
					sShellArguments.Add(sPROJECT_PATH)
					sShellArguments.Add(sBUILD_LOCATION)
					sShellArguments.Add(sBUILD_APPNAME)
					
					sShellArguments.Add(sBUILD_TYPE)
					sShellArguments.Add(sDEBUGBUILD_CODESIGN)
					
					sShellArguments.Add(sDMG_VOLUME_FILENAME.Trim)
					sShellArguments.Add(sDMG_VOLUME_TITLE.Trim)
					sShellArguments.Add(sDMG_VOLUME_ICON)
					sShellArguments.Add(sDMG_BACKGROUND_IMG_1x)
					sShellArguments.Add(sDMG_BACKGROUND_IMG_2x)
					sShellArguments.Add(sDMG_ALIAS_CAPTION)
					sShellArguments.Add(sDMG_WINDOW_BOUNDS)
					sShellArguments.Add(sDMG_ICON_SIZE)
					sShellArguments.Add(sDMG_TEXT_SIZE)
					sShellArguments.Add(sDMG_ICON_POSITION_APP)
					sShellArguments.Add(sDMG_ICON_POSITION_ALIAS)
					sShellArguments.Add(sDMG_FILE_ICON)
					
					'Parameters for CodeSign and Notarization
					sShellArguments.Add(sCODESIGN_IDENT)
					sShellArguments.Add(sCODESIGN_ENTITLEMENTS)
					sShellArguments.Add(sNOTARIZE)
					
					'Make sure the ShellScript is executable:
					Call DoShellCommand("chmod 755 """ + sPROJECT_PATH + sFolderScripts + "/xojo2dmg.sh""", 0)
					
					
					If bIsGitHubActions Then
					' ******************
					' * GitHub Actions *
					' ******************
					'sDMG_VOLUME_FILENAME without Stage Code in Filename
					sDMG_VOLUME_FILENAME = sBUILD_APPNAME
					sShellArguments(5) = sDMG_VOLUME_FILENAME.Trim 
					
					'Write a Shell Script for Xojo2DMG, which will be executed later by a Workflow Job
					Var sGithubActionScript As String = EnvironmentVariable("GITHUB_WORKSPACE") + "/" + EnvironmentVariable("FOLDER_BUILDS")+ "/" + EnvironmentVariable("FOLDER_BUILDS_MACOS_UNIVERSAL") + "/" + EnvironmentVariable("BUILD_MACOS_UNIVERSAL_POSTBUILD_SHELLSCRIPT")
					sGithubActionScript = sGithubActionScript.ReplaceAll("\", "") 'don't escape Path
					
					Var sQuote As String = "\"""
					
					Call DoShellCommand("echo #!/bin/sh > """ + sGithubActionScript + """")
					Call DoShellCommand("echo # >> """ + sGithubActionScript + """")
					Call DoShellCommand("echo " + sQuote + sPROJECT_PATH + sFolderScripts + "/xojo2dmg.sh" + sQuote + " " + sQuote + String.FromArray(sShellArguments, sQuote + " " + sQuote) + sQuote + " >> """ + sGithubActionScript + """")
					
					Call DoShellCommand("chmod 755  """ + sGithubActionScript + """")
					
					' ***************************
					' * GitHub Actions end here *
					' ***************************
					' Shell Script will be called in a Workflow step
					Return
					End If
					
					If (Not DebugBuild) And bOpenInTerminal Then
					'Automate Terminal:
					'Pass ShellArguments to Script and execute it in Terminal.app
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sPROJECT_PATH + sFolderScripts + "/xojo2dmg.sh\"" \""" + String.FromArray(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
					'Let's call the ShellScript (and pass ShellArguments to the Script).
					'This will be executed synchronously - the IDE will be 'busy'
					'and showing a Spinning Wheel if this is taking a long time...
					Var iShellResult As Integer
					Var sShellResult As String = DoShellCommand("""" + sPROJECT_PATH + sFolderScripts + "/xojo2dmg.sh"" """ + String.FromArray(sShellArguments, """ """) + """", 0, iShellResult)
					
					'Process and Parse the Output of the ShellScript
					Var sXojo2CodeSignErrors() As String
					Var sShellResultLines() As String = sShellResult.ReplaceAll(EndOfLine, "*****").Split("*****")
					For i As Integer = 0 To sShellResultLines.LastIndex
					'get all lines with Xojo2DMG Errors (and not the full output)
					If (sShellResultLines(i).Left(15) = "Xojo2DMG ERROR:") Then
					sXojo2CodeSignErrors.Add(sShellResultLines(i))
					End If
					Next
					
					Select Case iShellResult
					Case 2
					'DebugRun without Codesigning: xojo2dmg.sh will return with 'exit 2'
					'Don't put Result in Clipboard, don't show errors - it's all OK
					Return
					Case 8
					'xojo2dmg.sh will 'exit 8' if variables aren't ok
					sXojo2CodeSignErrors.Add("Xojo2DMG: Check your input variables.")
					Case 9
					'xojo2dmg.sh will 'exit 9' if required variables are missing
					sXojo2CodeSignErrors.Add("Xojo2DMG: Missing some input variables.")
					Case 11
					'xojo2dmg.sh will 'exit 11' if CodeSigning (and it's validation) has failed
					sXojo2CodeSignErrors.Add("Xojo2DMG: There's something wrong with CodeSign.")
					Case 12
					'xojo2dmg.sh will 'exit 12' if Notarization (and it's validation) has failed
					sXojo2CodeSignErrors.Add("Xojo2DMG: There's something wrong with Notarization.")
					Case 0
					'Yeah... it's all OK!
					Else
					'Hmm... something went wrong...
					sXojo2CodeSignErrors.Add("xojo2dmg.sh quit with ShellResult: " + Str(iShellResult))
					End Select
					
					'If there are errors:
					If (sXojo2CodeSignErrors.LastIndex >= 0) Then
					'Print just the Errors, and have the full output in Clipboard
					Print String.FromArray(sXojo2CodeSignErrors, EndOfLine) + EndOfLine + _
					"Note: Shell Output is in Clipboard"
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
