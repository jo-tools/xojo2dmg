#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   480
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   924715007
   MenuBarVisible  =   True
   MinimumHeight   =   480
   MinimumWidth    =   600
   Resizeable      =   True
   Title           =   "Xojo2DMG"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin DesktopCanvas cnvAppIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      Enabled         =   True
      Height          =   64
      HelpTag         =   "https://www.jo-tools.ch/xojo/xojo2dmg/"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin DesktopLabel labAppName
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   "https://www.jo-tools.ch/xojo/xojo2dmg/"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Xojo2DMG"
      TextAlign       =   2
      TextColor       =   &c0072D800
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   200
   End
   Begin DesktopLabel labAppVersion
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AppVersion"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin DesktopSeparator Separator1
      AllowTabStop    =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   3
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin DesktopLabel labAppInfo
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   160
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This is just a dummy App.\n\nBuild the Xojo project on macOS. The Post Build Script will invoke a Shell Script in order to auto-magically create a DiskImage .dmg.\n\nIf you edit the Post Build Script and add your CodeSigning information, it will sign (Xcode required) both your .app and .dmg as well. To additionally set up Notarization, see comments in PostBuildScript."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   115
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopSeparator Separator2
      AllowTabStop    =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   3
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      Top             =   280
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin DesktopLabel labXojoScriptExpression
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "XojoScript Expression:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   155
   End
   Begin DesktopTextField edtXojoScriptExpression
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   184
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Left(""Xojo2DMG"", 4)"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   313
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin DesktopButton btnXojoScriptEval
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Eval"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   314
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel labTests
      AutoDeactivate  =   True
      Bold            =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Tests"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   290
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopLabel labXojoScriptNote
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   40
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Note: A DebugRun (without CodeSign) will work. A DebugRun (with CodeSigning, Hardened Runtime) will behave the same as a built app: If you don't specify the required Entitlements, the built app will crash."
      TextAlign       =   0
      TextColor       =   &c66666600
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   341
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopLabel labAppleScriptAutomation
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AppleScript - Automation:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   393
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   170
   End
   Begin DesktopButton btnAppleScriptAutomation
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Automate Terminal.app"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   400
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   393
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   180
   End
   Begin DesktopButton btnAppleScriptAutomationPermission
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Determine Permission"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   202
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   393
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   180
   End
   Begin DesktopLabel labXojoScriptNote1
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   40
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Note: A DebugRun (with CodeSigning, Hardened Runtime) will behave the same as a built app: If you don't specify the required Entitlements and provide the 'Info.plist', Automation might not work."
      TextAlign       =   0
      TextColor       =   &c66666600
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   420
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopLabel labThanks
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   371
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Would you like to say 'Thank you'?"
      TextAlign       =   3
      TextColor       =   &c66666600
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   209
   End
   Begin DesktopCanvas cnvPayPal
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      Enabled         =   True
      Height          =   30
      HelpTag         =   "https://paypal.me/jotools"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   474
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   54
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   106
   End
   Begin DesktopLabel labContact
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   "xojo@jo-tools.ch"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   394
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Contact"
      TextAlign       =   2
      TextColor       =   &c0072CE00
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   70
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub CheckTerminalAppRunning()
		  #If TargetMacOS Then
		    If (Not ApplicationIsRunning(constBundleIdentifier_Terminal)) Then
		      Var d As New MessageDialog
		      Var b As MessageDialogButton
		      d.IconType = MessageDialog.IconTypes.Question
		      d.ActionButton.Caption = "Launch Terminal.app"
		      d.CancelButton.Visible = True
		      d.Title = "Terminal.app"
		      d.Message = "Launch Terminal.app?"
		      d.Explanation = "Terminal.app needs to be running, or you'll get 'ProcessNotRunning' as a result."
		      
		      b = d.ShowModal(Self)
		      
		      Select Case b
		      Case d.ActionButton
		        Call LaunchAppByBundleID(constBundleIdentifier_Terminal)
		      End Select
		    End If
		  #EndIf
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = constBundleIdentifier_Terminal, Type = String, Dynamic = False, Default = \"com.apple.Terminal", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events cnvAppIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  g.DrawPicture(AppIcon_128, 0, 0, 64, 64, 0, 0, AppIcon_128.Width, AppIcon_128.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("https://www.jo-tools.ch/xojo/xojo2dmg/")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Opening()
		  Me.Text = "Xojo2DMG"
		  Me.FontSize = 18
		  Me.Bold = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("https://www.jo-tools.ch/xojo/xojo2dmg/")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Opening()
		  If (App.Version <> "") Then
		    Me.Text = App.Version
		    Return
		  End If
		  
		  Me.Text = Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnXojoScriptEval
	#tag Event
		Sub Pressed()
		  Dim oXojoScriptEvaluator As New XojoScriptEvaluator
		  Dim sResult As String = oXojoScriptEvaluator.Eval(edtXojoScriptExpression.Text)
		  
		  Dim d As New MessageDialog
		  d.Icon = MessageDialog.GraphicQuestion
		  d.ActionButton.Caption = "OK"
		  d.CancelButton.Visible = False
		  d.Title = "XojoScript Evaluator"
		  d.Message = "XojoScript Evaluator Result"
		  d.Explanation = sResult
		  Call d.ShowModal(Self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppleScriptAutomation
	#tag Event
		Sub Pressed()
		  #If TargetMacOS Then
		    Self.CheckTerminalAppRunning()
		    
		    Var d As MessageDialog
		    #If DebugBuild Then
		      d = New MessageDialog
		      Var b As MessageDialogButton
		      d.IconType = MessageDialog.IconTypes.Question
		      d.ActionButton.Caption = "OK"
		      d.CancelButton.Visible = True
		      d.Title = "Example"
		      d.Message = "Automate Terminal.app."
		      d.Explanation = "Note: This is a DebugRun. It seems that each DebugRun (especially if the Debug.app is not codesigned) is considered a 'new application' by macOS. Build the app to see how things behave across multiple launches of the app."
		      b = d.ShowModal(Self)
		      Select Case b
		      Case d.ActionButton
		        'ok, let's continue
		      Else
		        Return
		      End Select
		    #EndIf
		    
		    
		    '1st we need to make sure Terminal.app is running
		    'that's not automation yet - the security will kick in later when doing "tell application"
		    Var sh As New Shell
		    sh.Execute("osascript -e 'launch application ""Terminal""' -e 'delay 1'")
		    If (sh.ExitCode <> 0) Then Break
		    
		    'ok, now that Terminal.app should be running, let's determine if we can automate it.
		    Var sResult As String
		    Var sExplanation As String
		    
		    Select Case macOS_AEDeterminePermissionToAutomateTarget(constBundleIdentifier_Terminal)
		    Case CType(AEPermissionResult.procNotFound, Int32)
		      sResult = "Process not found"
		      sExplanation = "Terminal.app needs to be running in order to be automated..."
		    Case CType(AEPermissionResult.errAEEventWouldRequireUserConsent, Int32)
		      'dunno - the user will be asked
		    Case CType(AEPermissionResult.errAEEventNotPermitted, Int32)
		      sResult = sResult + "Not Permitted"
		      sExplanation = "You should probably offer the user to open System Preferences, where the Checkbox needs to be set..."
		    Case CType(AEPermissionResult.noErr, Int32)
		      'all ok
		    Else
		      'who knows what and why...
		    End Select
		    
		    If (sResult <> "") Then
		      'something is not working, and we know it
		      d = New MessageDialog
		      d.IconType = MessageDialog.IconTypes.Note
		      d.ActionButton.Caption = "OK"
		      d.CancelButton.Visible = False
		      d.Title = "Error"
		      d.Message = sResult
		      d.Explanation = sExplanation
		      Call d.ShowModal(Self)
		      Return
		    End If
		    
		    Var sTitle As String = ""
		    sResult = ""
		    sExplanation = ""
		    
		    '**********************************************************
		    'AppleScript - let's automate Terminal.app
		    '**********************************************************
		    'Note:
		    'If you're going to use AppleScript-Automation,
		    'then don't forget to add the Info.plist with 
		    'a NSAppleEventsUsageDescription to your Xojo project :-)
		    '**********************************************************
		    'Reset Permissions (of all your apps)
		    'In Terminal, execute: tccutil reset AppleEvents
		    '**********************************************************
		    
		    Var oNow As DateTime = DateTime.Now
		    sh.Execute("osascript -e 'tell application ""Terminal""' -e 'if not (exists window 1) then reopen' -e 'activate' -e 'do script ""echo \""Xojo AppleScript Example " + oNow.SQLDateTime + "\"""" in Window 1' -e 'activate' -e 'end tell'")
		    
		    If (sh.ExitCode = 0) Then
		      'all ok
		      sTitle = "Success"
		      sResult = "All done..."
		      sExplanation = "Terminal.app has been automated and you should see an output there."
		    Else
		      'it didn't work...
		      sTitle = "Error"
		      sResult = "Unknown Error"
		      sExplanation = "Something didn't work as expected. Terminal.app has not been automated."
		      
		      'could it be that the user hasn't allowed automation when having been asked just before?
		      Select Case macOS_AEDeterminePermissionToAutomateTarget(constBundleIdentifier_Terminal)
		      Case CType(AEPermissionResult.procNotFound, Int32)
		        'should no longer be the case
		      Case CType(AEPermissionResult.errAEEventWouldRequireUserConsent, Int32)
		        'should no longer be the case - the user would have been asked when trying to automate...
		      Case CType(AEPermissionResult.errAEEventNotPermitted, Int32)
		        sResult = "Not Permitted"
		        sExplanation = "You should probably offer the user to open System Preferences, where the Checkbox needs to be set. Then try again after having allowed Automation.."
		      Case CType(AEPermissionResult.noErr, Int32)
		        'all ok
		      Else
		        'who knows what and why...
		      End Select
		    End If
		    
		    'Notify with success/error
		    d = New MessageDialog
		    d.IconType = MessageDialog.IconTypes.Note
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Title = sTitle
		    d.Message = sResult
		    d.Explanation = sExplanation
		    Call d.ShowModal(Self)
		    
		  #Else
		    MsgBox "This example is for macOS only..."
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppleScriptAutomationPermission
	#tag Event
		Sub Pressed()
		  #If TargetMacOS Then
		    Self.CheckTerminalAppRunning()
		    
		    Var d As New MessageDialog
		    Var b As MessageDialogButton
		    d.IconType = MessageDialog.IconTypes.Question
		    d.ActionButton.Caption = "Determine Permission"
		    d.CancelButton.Visible = True
		    d.Title = "Example"
		    d.Message = "Determine Permission To Automate Terminal.app?"
		    d.Explanation = "This might trigger the macOS Security Dialog." + EndOfLine + _
		    "Terminal.app needs to be running, or you'll get 'ProcessNotRunning' as a result."
		    
		    #If DebugBuild Then
		      d.Explanation = d.Explanation + EndOfLine + EndOfLine + _
		      "Note: This is a DebugRun. It seems that each DebugRun (especially if the Debug.app is not codesigned) is considered a 'new application' by macOS. Build the app to see how things behave across multiple launches of the app."
		    #EndIf
		    
		    b = d.ShowModal(Self)
		    Select Case b
		    Case d.ActionButton
		      Var iRes As Int32 = macOS_AEDeterminePermissionToAutomateTarget(constBundleIdentifier_Terminal)
		      
		      Var sResult As String = "Result: "
		      Var sExplanation As String
		      
		      Select Case iRes
		      Case CType(AEPermissionResult.procNotFound, Int32)
		        sResult = sResult + "Process not found"
		        sExplanation = "Terminal.app needs to be running in order to determine if it can be automated..."
		      Case CType(AEPermissionResult.errAEEventWouldRequireUserConsent, Int32)
		        sResult = sResult + "Would require User consent"
		        sExplanation = "We don't know that yet... If you're going to automate Terminal.app, this will then trigger the macOS security dialog to ask the user."
		      Case CType(AEPermissionResult.errAEEventNotPermitted, Int32)
		        sResult = sResult + "Not Permitted"
		        sExplanation = "You should probably see that the Checkbox is not selected in System Preferences..."
		      Case CType(AEPermissionResult.noErr, Int32)
		        sResult = sResult + "noErr"
		        sExplanation = "So you should be able to automate Terminal.app"
		      Else
		        sResult = sResult +  "Unkown Result"
		        sExplanation = "AEDeterminePermissionToAutomateTarget returned: " + Str(iRes)
		      End Select
		      
		      
		      d = New MessageDialog
		      d.IconType = MessageDialog.IconTypes.Note
		      d.ActionButton.Caption = "OK"
		      d.CancelButton.Visible = False
		      d.Title = "AEDeterminePermissionToAutomateTarget"
		      d.Message = sResult
		      d.Explanation = sExplanation
		      Call d.ShowModal(Self)
		      
		    Else
		      Return
		    End Select
		    
		    
		  #Else
		    MsgBox "This example is for macOS only..."
		  #EndIf
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvPayPal
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  g.ForeColor = &cFFFFFF
		  #If (XojoVersion >= 2018.03) Then
		    If IsDarkMode Then g.ForeColor = &cD0D0D0
		  #EndIf
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = &c909090
		  g.DrawRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(PayPal, 3, 2, 100, 26, 0, 0, PayPal.Width, PayPal.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("https://paypal.me/jotools")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("mailto:xojo@jo-tools.ch")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
