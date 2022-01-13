#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   480
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   924715007
   MenuBarVisible  =   True
   MinHeight       =   480
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "Xojo 2 DMG"
   Visible         =   True
   Width           =   600
   Begin Canvas cnvAppIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
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
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin Label labAppName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Xojo 2 DMG"
      TextAlign       =   1
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
   Begin Label labAppVersion
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AppVersion"
      TextAlign       =   1
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
   Begin Separator Separator1
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
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin Label labAppInfo
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This is just a dummy App.\n\nBuild the Xojo project with on macOS. The Post Build Script will invoke a Shell Script in order to auto-magically create a DiskImage .dmg.\n\nIf you edit the Post Build Script and add your CodeSigning information, it will sign (Xcode required) both your .app and .dmg (OS X 10.11.5 or later is required) as well. To additionally set up Notarization (macOS 10.13.6 or later is required), see comments in PosBuildScript."
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
   Begin Separator Separator2
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
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   280
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin Label labXojoScriptExpression
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
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
   Begin TextField edtXojoScriptExpression
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
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
   Begin PushButton btnXojoScriptEval
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
      Scope           =   0
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
   Begin Label labTests
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
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
   Begin Label labXojoScriptNote
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
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
   Begin Label labAppleScriptAutomation
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
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
   Begin PushButton btnAppleScriptAutomation
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
      Scope           =   0
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
   Begin PushButton btnAppleScriptAutomationPermission
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
      Scope           =   0
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
   Begin Label labXojoScriptNote1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
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
   Begin Label labThanks
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Would you like to say 'Thank you'?"
      TextAlign       =   2
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
   Begin Canvas cnvPayPal
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
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
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   54
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   106
   End
   Begin Label labContact
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Contact"
      TextAlign       =   1
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
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events cnvAppIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture(AppIcon_128, 0, 0, 64, 64, 0, 0, AppIcon_128.Width, AppIcon_128.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("https://www.jo-tools.ch/xojo/xojo2dmg/")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Open()
		  me.Text = "Xojo 2 DMG"
		  me.TextSize = 18
		  me.Bold = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("https://www.jo-tools.ch/xojo/xojo2dmg/")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Open()
		  if (App.ShortVersion <> "") then
		    me.Text = App.ShortVersion
		    return
		  end if
		  
		  me.Text = Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnXojoScriptEval
	#tag Event
		Sub Action()
		  Dim oXojoScriptEvaluator As New XojoScriptEvaluator
		  Dim sResult As String = oXojoScriptEvaluator.Eval(edtXojoScriptExpression.Text)
		  
		  Dim d As New MessageDialog
		  d.Icon = MessageDialog.GraphicQuestion
		  d.ActionButton.Caption = "OK"
		  d.CancelButton.Visible = false
		  d.Title = "XojoScript Evaluator"
		  d.Message = "XojoScript Evaluator Result"
		  d.Explanation = sResult
		  call d.ShowModalWithin(Self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppleScriptAutomation
	#tag Event
		Sub Action()
		  #If TargetMacOS Then
		    Dim d As MessageDialog
		    #If DebugBuild Then
		      d = New MessageDialog
		      Dim b As MessageDialogButton
		      d.Icon = MessageDialog.GraphicQuestion
		      d.ActionButton.Caption = "OK"
		      d.CancelButton.Visible = True
		      d.Title = "Example"
		      d.Message = "Automate Terminal.app."
		      d.Explanation = "Note: This is a DebugRun. It seems that each DebugRun (if the Debug.app is not codesigned) is considered a 'new application' by macOS. CodeSign the DebugBuild or Build the app to see how things behave across multiple launches of the app."
		      b = d.ShowModalWithin(Self)
		      Select Case b
		      Case d.ActionButton
		        'ok, let's continue
		      Else
		        Return
		      End Select
		    #EndIf
		    
		    Dim sTerminalBundleIdenfifier As String = "com.apple.Terminal"
		    
		    '1st we need to make sure Terminal.app is running
		    'that's not automation yet - the security will kick in later when doing "tell application"
		    Dim sh As New Shell
		    sh.Execute("osascript -e 'launch application ""Terminal""' -e 'delay 1'")
		    If (sh.ErrorCode <> 0) Then Break
		    
		    'ok, now that Terminal.app should be running, let's determine if we can automate it.
		    Dim sResult As String
		    Dim sExplanation As String
		    Dim bSuccess As Boolean = False
		    
		    Dim bShowSystemPreferences As Boolean = false
		    
		    Select Case macOS_AEDeterminePermissionToAutomateTarget("com.apple.Terminal")
		    Case CType(AEPermissionResult.procNotFound, Int32)
		      sResult = "Process not found"
		      sExplanation = "Terminal.app needs to be running in order to be automated..."
		    Case CType(AEPermissionResult.errAEEventWouldRequireUserConsent, Int32)
		      'dunno - the user will be asked
		    Case CType(AEPermissionResult.errAEEventNotPermitted, Int32)
		      sResult = sResult + "Not Permitted"
		      sExplanation = "You should probably offer the user to open System Preferences, where the Checkbox needs to be set..."
		      bShowSystemPreferences = true
		    Case CType(AEPermissionResult.noErr, Int32)
		      'all ok
		    Else
		      'who knows what and why...
		    End Select
		    
		    If (sResult <> "") Then
		      'something is not working, and we know it
		      d = New MessageDialog
		      d.Icon = MessageDialog.GraphicNote
		      d.Title = "Error"
		      d.Message = sResult
		      d.Explanation = sExplanation
		      If bShowSystemPreferences Then
		        d.ActionButton.Caption = "System Preferences"
		        d.CancelButton.Visible = True
		        If d.ShowModalWithin(Self) = d.ActionButton Then
		          Call macOS_SystemPreferences_PrivacyAutomation
		        End If
		      Else
		        d.ActionButton.Caption = "OK"
		        d.CancelButton.Visible = False
		        Call d.ShowModalWithin(Self)
		      End If
		      
		      
		      Return
		    End If
		    
		    Dim sTitle As String = ""
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
		    
		    Dim oNow As New Date
		    sh.Execute("osascript -e 'tell application ""Terminal""' -e 'if not (exists window 1) then reopen' -e 'activate' -e 'do script ""echo \""Xojo AppleScript Example " + oNow.SQLDateTime + "\"""" in Window 1' -e 'activate' -e 'end tell'")
		    
		    If (sh.ErrorCode = 0) Then
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
		      Select Case macOS_AEDeterminePermissionToAutomateTarget("com.apple.Terminal")
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
		    d.Icon = MessageDialog.GraphicNote
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Title = sTitle
		    d.Message = sResult
		    d.Explanation = sExplanation
		    Call d.ShowModalWithin(Self)
		    
		  #Else
		    MsgBox "This example is for macOS only..."
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppleScriptAutomationPermission
	#tag Event
		Sub Action()
		  #If TargetMacOS Then
		    Dim d As New MessageDialog
		    Dim b As MessageDialogButton
		    d.Icon = MessageDialog.GraphicQuestion
		    d.ActionButton.Caption = "Determine Permission"
		    d.CancelButton.Visible = True
		    d.Title = "Example"
		    d.Message = "Determine Permission To Automate Terminal.app?"
		    d.Explanation = "This might trigger the macOS Security Dialog." + EndOfLine + _
		    "Terminal.app needs to be running, or you'll get 'ProcessNotRunning' as a result."
		    
		    #if DebugBuild then
		      d.Explanation = d.Explanation + EndOfLine + EndOfLine + _
		      "Note: This is a DebugRun. It seems that each DebugRun (if the Debug.app is not codesigned) is considered a 'new application' by macOS. CodeSign the DebugBuild or Build the app to see how things behave across multiple launches of the app."
		    #endif
		    
		    b = d.ShowModalWithin(Self)
		    Select Case b
		    Case d.ActionButton
		      Dim iRes As Int32 = macOS_AEDeterminePermissionToAutomateTarget("com.apple.Terminal")
		      
		      Dim sResult As String = "Result: "
		      Dim sExplanation As String
		      
		      Dim bShowSystemPreferences As Boolean = false
		      
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
		        bShowSystemPreferences = true
		      Case CType(AEPermissionResult.noErr, Int32)
		        sResult = sResult + "noErr"
		        sExplanation = "So you should be able to automate Terminal.app"
		      Else
		        sResult = sResult +  "Unkown Result"
		        sExplanation = "AEDeterminePermissionToAutomateTarget returned: " + Str(iRes)
		      End Select
		      
		      
		      d = New MessageDialog
		      d.Icon = MessageDialog.GraphicNote
		      d.Title = "AEDeterminePermissionToAutomateTarget"
		      d.Message = sResult
		      d.Explanation = sExplanation
		      d.ActionButton.Caption = "OK"
		      d.CancelButton.Visible = False
		      
		      If bShowSystemPreferences Then
		        d.ActionButton.Caption = "System Preferences"
		        d.CancelButton.Visible = True
		        If d.ShowModalWithin(Self) = d.ActionButton Then
		          Call macOS_SystemPreferences_PrivacyAutomation
		        End If
		      Else
		        d.ActionButton.Caption = "OK"
		        d.CancelButton.Visible = False
		        Call d.ShowModalWithin(Self)
		      End If
		      
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
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = &cFFFFFF
		  #if (XojoVersion >= 2018.03) then
		    if IsDarkMode then g.ForeColor = &cD0D0D0
		  #endif
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = &c909090
		  g.DrawRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(PayPal, 3, 2, 100, 26, 0, 0, PayPal.Width, PayPal.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("https://paypal.me/jotools")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("mailto:xojo@jo-tools.ch")
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
#tag EndViewBehavior
