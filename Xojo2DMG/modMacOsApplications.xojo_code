#tag Module
Protected Module modMacOsApplications
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0
		Function ApplicationIsRunning(psBundleID As String) As Boolean
		  If (psBundleID = "") Then Return False
		  
		  #If TargetMacOS Then
		    // https://developer.apple.com/documentation/appkit/nsrunningapplication/1530798-runningapplicationswithbundleide?language=objc
		    
		    Declare Function NSClassFromString Lib "Foundation" (name As CFStringRef) As Ptr
		    Declare Function getCount Lib "Foundation" Selector "count" (obj As Ptr) As Integer
		    Declare Function runningApplicationsWithBundleIdentifier Lib "Foundation" Selector "runningApplicationsWithBundleIdentifier:" (cls As Ptr, bundleIdentifier As CFStringRef) As Ptr
		    
		    Var NSRunningApplication As Ptr = NSClassFromString("NSRunningApplication")
		    Var runningApps As Ptr = runningApplicationsWithBundleIdentifier(NSRunningApplication, psBundleID)
		    
		    Var c As Integer = getCount(runningApps)
		    
		    Return c > 0
		  #EndIf
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LaunchAppByBundleID(psBundleID As String) As Boolean
		  If (psBundleID = "") Then Return False
		  
		  #If TargetMacOS Then
		    // https://developer.apple.com/documentation/appkit/nsworkspace/1533335-launchappwithbundleidentifier
		    
		    Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		    Declare Function sharedWorkspace Lib "AppKit" Selector "sharedWorkspace" (ref As Ptr) As Ptr
		    Declare Function URLForApplicationWithBundleIdentifier Lib "AppKit" Selector "URLForApplicationWithBundleIdentifier:" (NSWorkspace As Ptr, bundleIdentifier As CFStringRef) As Ptr
		    Declare Function launchApp Lib "AppKit" Selector "launchAppWithBundleIdentifier:options:additionalEventParamDescriptor:launchIdentifier:" (NSWorkspaceRef As Ptr, bundleIdentifier As CFStringRef, options As Ptr, descriptor As Ptr, identifier As Integer) As Boolean
		    
		    Var URLRef As Ptr = URLForApplicationWithBundleIdentifier(sharedWorkspace(NSClassFromString("NSWorkspace")), psBundleID)
		    
		    If URLRef <> Nil Then
		      Call launchApp(sharedWorkspace(NSClassFromString("NSWorkspace")), psBundleID, Nil, Nil, 0)
		      Return True
		    End
		    
		  #EndIf
		  
		  Return False
		End Function
	#tag EndMethod


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
