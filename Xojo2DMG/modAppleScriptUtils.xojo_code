#tag Module
Protected Module modAppleScriptUtils
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function macOS_AEDeterminePermissionToAutomateTarget(psTargetBundleIdentifier As String) As Int32
		  #If TargetMacOS Then
		    'OSStatus status;
		    'NSAppleEventDescriptor *targetAppEventDescriptor;
		    'targetAppEventDescriptor = [NSAppleEventDescriptor descriptorWithBundleIdentifier:@"com.apple.iTunes"];
		    'status = AEDeterminePermissionToAutomateTarget(targetAppEventDescriptor.aeDesc, typeWildCard, typeWildCard, true);
		    'OSStatus AEDeterminePermissionToAutomateTarget(const AEAddressDesc *target, AEEventClass theAEEventClass, AEEventID theAEEventID, Boolean askUserIfNeeded);
		    
		    'Const noErr = 0
		    'Const errAEEventWouldRequireUserConsent = -1744
		    'Const errAEEventNotPermitted = -1743
		    'Const procNotFound = -600
		    
		    If (Not System.IsFunctionAvailable("AEDeterminePermissionToAutomateTarget", "Cocoa")) Then
		      'this requires macOS 10.14+
		      'on previous macOS versions, all apps can automate targets... so let's return this:
		      Return CType(AEPermissionResult.noErr, Int32) 'not available, no issue
		    End If
		    
		    Try
		      // https://developer.apple.com/documentation/coreservices/3025784-aedeterminepermissiontoautomatet?language=objc
		      
		      Declare Function NSClassFromString Lib "Cocoa" (className As CFStringRef) As Ptr
		      Soft Declare Function descriptorWithBundleIdentifier Lib "Foundation" Selector "descriptorWithBundleIdentifier:" (ptrNSAppleEventDescriptorClass As Ptr, bundleIdentifier As CFStringRef) As Ptr 'macOS 10.11+
		      Declare Function aeDesc Lib "Foundation" Selector "aeDesc" (ptrNSAppleEventDescriptor As Ptr) As Ptr
		      
		      Soft Declare Function AEDeterminePermissionToAutomateTarget Lib "Cocoa" (targetAEAddressDesc As Ptr, theAEEventClass As CFStringRef, theAEEventID As CFStringRef, askUserIfNeeded As Boolean) As Int32 'macOS 10.14+
		      
		      Var ptrNSAppleEventDescriptorClass As Ptr = NSClassFromString("NSAppleEventDescriptor")
		      Var ptrNSAppleEventDescriptor As Ptr = descriptorWithBundleIdentifier(ptrNSAppleEventDescriptorClass, psTargetBundleIdentifier)
		      Var ptrAeDesc As Ptr = aeDesc(ptrNSAppleEventDescriptor)
		      Return AEDeterminePermissionToAutomateTarget(ptrAeDesc, "****", "****", False)
		      
		    Catch err As RuntimeException
		      'ignore: return that process could not be found
		      Return CType(AEPermissionResult.procNotFound, Int32)
		    End Try
		    
		  #EndIf
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function macOS_SystemPreferences_PrivacyAutomation() As Boolean
		  #If TargetMacOS Then
		    //A list of possible links is here: https://macosxautomation.com/system-prefs-links.html
		    
		    Declare Function NSClassFromString Lib "Cocoa" (className As CFStringRef) As Ptr
		    Declare Function sharedWorkspace Lib "AppKit" Selector "sharedWorkspace" ( obj As Ptr ) As Ptr
		    Declare Function URLWithString Lib "Foundation" Selector "URLWithString:" (ptrNSURLClass As Ptr, url As CFStringRef) As Ptr
		    Declare Function openURL Lib "AppKit" Selector "openURL:" ( obj As Ptr, url As Ptr ) As Boolean
		    
		    Try
		      Var ptrNSURLClass As Ptr = NSClassFromString("NSURL")
		      Var ptrNSUrl As Ptr = URLWithString(ptrNSURLClass, "x-apple.systempreferences:com.apple.preference.security?Privacy_Automation")
		      
		      Var ptrNSWorkspaceClass As Ptr = NSClassFromString("NSWorkspace")
		      Var ptrNSWorkspaceSharedWorkspace As Ptr = sharedWorkspace(ptrNSWorkspaceClass)
		      
		      Return openURL(ptrNSWorkspaceSharedWorkspace, ptrNSUrl)
		      
		    Catch err As RuntimeException
		      'ignore
		      Return False
		    End Try
		    
		  #EndIf
		  
		  Return False
		End Function
	#tag EndMethod


	#tag Note, Name = Note
		If you're going to use AppleScript-Automation, then don't forget to add the Info.plist with a NSAppleEventsUsageDescription to your Xojo project.
		If you are CodeSigning (with hardened Runtime) and/or Notarizing your application: Make sure to have the Entitlement enabled: com.apple.security.automation.apple-events.
		
		
		Reset Permissions (of all your apps)
		************************************
		In Terminal, execute:
		tccutil reset AppleEvents
	#tag EndNote


	#tag Enum, Name = AEPermissionResult, Type = Int32, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		noErr=0
		  errAEEventWouldRequireUserConsent=-1744
		  errAEEventNotPermitted=-1743
		procNotFound=-600
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
