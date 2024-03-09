#tag Class
Protected Class XojoScriptEvaluator
Inherits XojoScript
	#tag Event
		Function CompilerError(location As XojoScriptLocation, error As XojoScript.Errors, errorInfo As Dictionary) As Boolean
		  #Pragma unused location
		  #Pragma unused errorInfo
		  
		  mResult = ErrorCodeToString(error)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub RuntimeError(error As RuntimeException)
		  mResult = error.Message
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ErrorCodeToString(code As XojoScript.Errors) As String
		  Static errors As New Dictionary( _
		  XojoScript.Errors.Syntax: "Syntax does not make sense.", _
		  XojoScript.Errors.TypeMismatch: "Type mismatch.", _
		  XojoScript.Errors.ParserStackOverflow: "The parser's internal stack has overflowed.", _
		  XojoScript.Errors.TooManyParameters: "Too many parameters for this function.", _
		  XojoScript.Errors.NotEnoughParameters: "Not enough parameters for this function call.", _
		  XojoScript.Errors.WrongNumberOfParameters: "Wrong number of parameters for this function call.", _
		  XojoScript.Errors.IncompatibleParameterList: "Parameters are incompatible with this function.", _
		  XojoScript.Errors.IncompatibleParameterAssignment: "Assignment of an incompatible data type.", _
		  XojoScript.Errors.UndefinedIdentifier: "Undefined identifier.", _
		  XojoScript.Errors.UndefinedOperator: "Undefined operator.", _
		  XojoScript.Errors.LogicOpsRequireBooleans: "Logic operations require Boolean operands.", _
		  XojoScript.Errors.NonIntArrayBounds: "Array bounds must be integers.", _
		  XojoScript.Errors.CallNonFunction: "Can't call a non-function.", _
		  XojoScript.Errors.SubscriptNonArray: "Can't get an element from something that isn't an array.", _
		  XojoScript.Errors.NotEnoughDimensions: "Not enough subscripts for this array's dimensions.", _
		  XojoScript.Errors.TooManyDimensions: "Too many subscripts for this array's dimensions.", _
		  XojoScript.Errors.ArrayMethod1DOnly: "Can't assign an entire array.", _
		  XojoScript.Errors.ArrayCast1DOnly: "Can't use an entire array in an expression.", _
		  XojoScript.Errors.ExpressionByRef: "Can't pass an expression as a ByRef parameter.", _
		  XojoScript.Errors.DuplicateIdentifier: "Duplicate identifier.", _
		  XojoScript.Errors.BackendFailed: "The backend code generator failed.", _
		  XojoScript.Errors.AmbiguousMethodCall: "Ambiguous call to overloaded method.", _
		  XojoScript.Errors.NoMultipleInheritance: "Multiple inheritance is not allowed.", _
		  XojoScript.Errors.CantInstantiateInterface: "Cannot create an instance of an interface.", _
		  XojoScript.Errors.ImplementNonInterface: "Cannot implement a class as though it were an interface.", _
		  XojoScript.Errors.InheritNonClass: "Cannot inherit from something that is not a class.", _
		  XojoScript.Errors.DoesNotFullyImplementInterface: "This class does not fully implement the specified interface.", _
		  XojoScript.Errors.ArrayNegativeSize: "Event handlers cannot live outside of a class.", _
		  XojoScript.Errors.CantIgnoreFunctionResult: "It is not legal to ignore the result of a function call.", _
		  XojoScript.Errors.CantUseSelfOutsideAClass: "Can't use ""Self"" keyword outside of a class.", _
		  XojoScript.Errors.CantUseMeOutsideAClass: "Can't use ""Me"" keyword outside of a class.", _
		  XojoScript.Errors.ReturnValueFromSub: "Can't return a value from a Sub.", _
		  XojoScript.Errors.NonExceptionType: "An exception object required here.", _
		  XojoScript.Errors.MismatchReturnInterfaceMethod: "The function declares a different return type than the interface function it is implementing.", _
		  XojoScript.Errors.MismatchReturnOverrideMethod: "The function declares a different return type than the function in its superclass that it's overriding.", _
		  XojoScript.Errors.OnlyObjectsHaveEvents: "The method uses the ""Handles"" clause to specify that it is an event handler, but the method cannot handle events. For example, the method may not be in a class or may be a shared method.", _
		  XojoScript.Errors.ImplementNonexistentEvent: "The method uses the ""Handles"" clause but specifies an event that does not exist.", _
		  XojoScript.Errors.NoDestructorParameters: "Destructors can't have parameters.", _
		  XojoScript.Errors.CantUseSuperOutsideAClass: "Can't use ""Super"" keyword outside of a class.", _
		  XojoScript.Errors.CantUseSuperWithoutASuper: "Can't use ""Super"" keyword in a class that has no parent.", _
		  XojoScript.Errors.UnbalancedCompileElse: "This #else does not have a matching #if preceding it.", _
		  XojoScript.Errors.UnbalancedCompileEndIf: "This #endif does not have a matching #if preceding it.", _
		  XojoScript.Errors.CompileIfConditionNotBoolean: "Only Boolean constants can be used with #if.", _
		  XojoScript.Errors.CompileIfConditionNotConstant: "Only Boolean constants can be used with #if.", _
		  XojoScript.Errors.ForLoopMultiplyIndexed: "The variable specified after the Next statement does not match the loop's counter variable. For example, if you declare the For loop as using ""i"" as its counter, the loop must end in ""Next"" or ""Next i"".", _
		  XojoScript.Errors.ArrayBoundsMustBeConstant: "The size of an array must be a constant or number.", _
		  XojoScript.Errors.ArrayTypeInExternalCode: "You can't pass an array to an external function.", _
		  XojoScript.Errors.ObjectTypeInExternalCode: "External functions cannot use objects as parameters.", _
		  XojoScript.Errors.StringTypeInExternalCode: "External functions cannot use ordinary strings as parameters. Use CString, PString, WString, or CFStringRef instead.", _
		  XojoScript.Errors.UnsortableDataType: "This kind of array can not be sorted.", _
		  XojoScript.Errors.AccessProtectedProperty: "This property is protected. It can only be used from within its class.", _
		  XojoScript.Errors.AccessProtectedMethod: "This method is protected. It can only be called from within its class.", _
		  XojoScript.Errors.NameDuplicatesDeclareFunction: "This local variable or constant has the same name as a Declare in this method. You must resolve this conflict.", _
		  XojoScript.Errors.NameDuplicatesFunction: "This global variable has the same name as a global function. You must resolve this conflict.", _
		  XojoScript.Errors.NameDuplicatesMethod: "This property has the same name as a method. You must resolve this conflict.", _
		  XojoScript.Errors.NameDuplicatesEvent: "This property has the same name as an event. You must resolve this conflict.", _
		  XojoScript.Errors.NameDuplicatesClass: "This global variable has the same name as a class. You must resolve this conflict.", _
		  XojoScript.Errors.NameDuplicatesModule: "This global variable has the same name as a module. You must change one of them.", _
		  XojoScript.Errors.NameDuplicatesConstant: "This local variable or parameter has the same name as a constant. You must resolve this conflict.", _
		  XojoScript.Errors.NameIsReservedKeyword: "This identifier is reserved and can't be used as a variable or property name.", _
		  XojoScript.Errors.NoClassByThatName: "There is no class with this name.", _
		  XojoScript.Errors.DeclareLibMustBeStringConstant: "The library name must be a string constant.", _
		  XojoScript.Errors.DeclareFunctionWithNoReturnType: "This Declare Function statement is missing its return type.", _
		  XojoScript.Errors.CantInstantiateAbstractClass: "You can't use the New operator with this class.", _
		  XojoScript.Errors.SubReturnsNoValue: "This method doesn't return a value.", _
		  XojoScript.Errors.MissingEndQuote: "End quote missing.", _
		  XojoScript.Errors.ClassDescendsFromSelf: "A class cannot be its own superclass.", _
		  XojoScript.Errors.AssignToReadOnlyProperty: "Cannot assign a value to this property.", _
		  XojoScript.Errors.ReadFromWriteOnlyProperty: "Cannot get this property's value.", _
		  XojoScript.Errors.IfMissingCondition: "The If statement is missing its condition.", _
		  XojoScript.Errors.MissingReturnTypeInFunction: "The current function must return a value, but this Return statement does not specify any value.", _
		  XojoScript.Errors.IncompatibleParameterOptions: "A method parameter has options that are mutually exclusive. For example, the ""ByRef"" and ""ByVal"" options cannot be used together.", _
		  XojoScript.Errors.DuplicateParamOption: "This parameter option has already been specified. For example, this occurs if you declare a parameter as ""ByRef ByRef i As Integer"".", _
		  XojoScript.Errors.ByRefWithDefaultValue: "A parameter passed by reference cannot have a default value.", _
		  XojoScript.Errors.ParamArrayWithDefaultValue: "A ParamArray cannot have a default value.", _
		  XojoScript.Errors.AssignsParamWithDefaultValue: "An Assigns parameter cannot have a default value.", _
		  XojoScript.Errors.ExtendsParamWithDefaultValue: "An Extends parameter cannot have a default value.", _
		  XojoScript.Errors.ExtendsParamMustBeFirst: "Only the first parameter may use the Extends option.", _
		  XojoScript.Errors.AssignsParamMustBeLast: "Only the last parameter may use the Assigns option.", _
		  XojoScript.Errors.ParamArrayMustBeLast: "An ordinary parameter cannot follow a ParamArray.", _
		  XojoScript.Errors.OnlyOneAssignsParamPerMethod: "Only one parameter may use the Assigns option.", _
		  XojoScript.Errors.OnlyOneParamArrayPerMethod: "Only one parameter may use the ParamArray option.", _
		  XojoScript.Errors.ParamArray1DOnly: "A ParamArray cannot have more than one dimension.", _
		  XojoScript.Errors.IfWithoutThen: "The keyword ""Then"" is expected after this If statement's condition.", _
		  XojoScript.Errors.ConstantWithVariableValue: "Constants must be defined with constant values.", _
		  XojoScript.Errors.IllegalUseOfCall: "Illegal use of the Call keyword.", _
		  XojoScript.Errors.CaseFollowingCaseElse: "No cases may follow the Else block.", _
		  XojoScript.Errors.UnknownPropertyAccessorType: "A computed property can only contain ""Get"" and ""Set"" blocks", _
		  XojoScript.Errors.MismatchedPropertyAccessorTypes: "A computed property getter or setter block ends with the wrong ""end"" line. For example, if you start the block with ""Get"", it must end with ""End Get"".", _
		  XojoScript.Errors.DuplicateMethodDeclaration: "Duplicate method definition.", _
		  XojoScript.Errors.EmptyDeclareLibString: "The library name for this declaration is blank.", _
		  XojoScript.Errors.IfMissingEndIf: "This If statement is missing an End If statement.", _
		  XojoScript.Errors.SelectMissingEndSelect: "This Select Case statement is missing an End Select statement.", _
		  XojoScript.Errors.ForMissingNext: "This For loop is missing its Next statement.", _
		  XojoScript.Errors.WhileMissingWend: "This While loop is missing its Wend statement.", _
		  XojoScript.Errors.TryMissingEndTry: "This Try statement is missing an End Try statement.", _
		  XojoScript.Errors.DoMissingLoop: "This Do loop is missing its Loop statement.", _
		  XojoScript.Errors.TooFewParentheses: "Too few parentheses.", _
		  XojoScript.Errors.TooManyParentheses: "Too many parentheses.", _
		  XojoScript.Errors.CantUseContinueOutsideOfALoop: "The Continue statement only works inside a loop.", _
		  XojoScript.Errors.CouldntFindMatchingLoop: "There is no (%1) block to (%2) here.", _
		  XojoScript.Errors.CantAccessInstancePropertyFromSharedMethod: "Shared methods cannot access instance properties.", _
		  XojoScript.Errors.CantAccessInstanceMethodFromSharedMethod: "Shared methods cannot access instance methods.", _
		  XojoScript.Errors.CantAccessInstancePropertyFromSharedPropertyAccessor: "Shared computed property accessors cannot access instance properties.", _
		  XojoScript.Errors.CantAccessInstanceMethodFromSharedPropertyAccessor: "Shared computed property accessors cannot access instance methods.", _
		  XojoScript.Errors.ConstructorIsProtected: "The Constructor of this class is protected, and can only be called from within this class.", _
		  XojoScript.Errors.StructureStringWithNoLength: "This String field needs to specify its length.", _
		  XojoScript.Errors.StructureCantContainRefType: "Structures cannot contain fields of this type.", _
		  XojoScript.Errors.StructureArrays1DOnly: "Structures cannot contain multidimensional arrays.", _
		  XojoScript.Errors.EnumsOnlyInt: "Enumerated types can only contain integers.", _
		  XojoScript.Errors.NoStackedEnums: "An enumerations cannot be defined in terms of another enumeration.", _
		  XojoScript.Errors.AssignToConstant: "This is a constant; its value can't be changed.", _
		  XojoScript.Errors.IllegalStructureStringLength: "A String field must be at least 1 byte long.", _
		  XojoScript.Errors.NonStringFieldWithLength: "The storage size specifier only applies to String fields.", _
		  XojoScript.Errors.StructureContainsSelf: "A Structure cannot contain itself.", _
		  XojoScript.Errors.InstantiateStructure: "A structure is not a class, and cannot be instantiated with New.", _
		  XojoScript.Errors.InstantiateEnum: "An enumeration is not a class, and cannot be instantiated with New.", _
		  XojoScript.Errors.AccessPrivateType: "This type is private, and can only be used within its module.", _
		  XojoScript.Errors.GlobalItemInClass: "Class members cannot be global.", _
		  XojoScript.Errors.ProtectedItemInModule: "Module members must be public or private; they cannot be protected.", _
		  XojoScript.Errors.GlobalItemInInnerModule: "Members of inner modules cannot be global.", _
		  XojoScript.Errors.DimMultipleUsingNewObjectShortcut: "A Dim statement creates only one new object at a time.", _
		  XojoScript.Errors.ConstValueExpected: "A constant was expected here, but this is some other kind of expression.", _
		  XojoScript.Errors.AccessPrivateModule: "This module is private, and can only be used within its containing module.", _
		  XojoScript.Errors.DuplicatePropertyDeclaration: "Duplicate property definition.", _
		  XojoScript.Errors.InvalidArrayElementType: "This datatype cannot be used as an array element.", _
		  XojoScript.Errors.DelegateOptionalParameter: "Delegate parameters cannot be optional.", _
		  XojoScript.Errors.DelegateParameterRole: "Delegates cannot use Extends, Assigns, or ParamArray.", _
		  XojoScript.Errors.RbScriptSandboxDeclare: "The Declare statement is illegal in RBScript.", _
		  XojoScript.Errors.RbScriptSandboxPtr: "It is not legal to dereference a Ptr value in an RBScript.", _
		  XojoScript.Errors.RbScriptSandboxDelegateFromPtr: "Delegate creation from Ptr values is not allowed in RBScript.", _
		  XojoScript.Errors.DuplicateConstantDeclaration: "Delegate constant definition.", _
		  XojoScript.Errors.AmbiguousInterfaceImplementation: "Ambiguous interface method implementation.", _
		  XojoScript.Errors.ClassDoesNotImplement: "Illegal explicit interface method implementation. The class does not claim to implement this interface.", _
		  XojoScript.Errors.InterfaceMethodDoesNotExist: "The interface does not declare this method.", _
		  XojoScript.Errors.UnbalancedCompileIf: "This method contains a #If without a closing #endif statement.", _
		  XojoScript.Errors.CyclicalInterfaceAggregate: "This interface contains a cyclical interface aggregation.", _
		  XojoScript.Errors.ExtendsOnClass: "The Extends modifier cannot be used on a class method.", _
		  XojoScript.Errors.IncompatibleAssignment: "You cannot assign a non-value type to a value.", _
		  XojoScript.Errors.DuplicateAttribute: "Duplicate attribute name.", _
		  XojoScript.Errors.DelegateReturnStructure: "Delegates cannot return structures.", _
		  XojoScript.Errors.IllegalDelegateDispatch: "You cannot use AddressOf on this method. Possible causes include using AddressOf on event declarations or soft declares.", _
		  XojoScript.Errors.IllegalConversionTo: "You cannot use an Operator_Convert method to perform a convert-to operation on an interface.", _
		  XojoScript.Errors.ElseIfMissingCondition: "The ElseIf statement is missing its condition.", _
		  XojoScript.Errors.IllegalConstType: "This type cannot be used as an explicit constant type.", _
		  XojoScript.Errors.RecursiveConstantDeclaration: "Recursive constant declaration error.", _
		  XojoScript.Errors.Custom: "Custom error created using ""Error"" pragma.", _
		  XojoScript.Errors.NotALocalVariable: "The second operand to the ""Unused"" pragma must be a local variable or parameter.", _
		  XojoScript.Errors.MaxUlpsMustBeConstant: "The maximum units in last position parameter must be a constant.", _
		  XojoScript.Errors.MaxUlpsOutOfRange: "The maximum units in last position parameter is out of range.", _
		  XojoScript.Errors.StructureFieldAlignment: "The StructureAlignment attribute's value must be of the following: 1, 2, 4, 8, 16, 32, 64, or 128.", _
		  XojoScript.Errors.RbScriptSandboxPairs: "Pair creation via the "":"" operator is not allowed in RBScript.", _
		  XojoScript.Errors.RbScriptSandboxGetTypeInfo: "Introspection via the GetTypeInfo operator is not allowed in RBScript.", _
		  XojoScript.Errors.ForNextMissingCondition: "The For statement is missing its condition.", _
		  XojoScript.Errors.WhileWendMissingCondition: "The While statement is missing its condition.", _
		  XojoScript.Errors.UnsignedExpressionInNegativeStep: "Unsigned integer used in negative step loops can cause an infinite loop.", _
		  XojoScript.Errors.MustUseObjectsWithIs: "Only objects can be used with the Is operator", _
		  XojoScript.Errors.MustUseObjectsWithAddRemoveHandler: "Only objects can be used with AddHandler and RemoveHandler.", _
		  XojoScript.Errors.EventDoesNotExist: "The object you are passing to AddHandler does not have the specified event", _
		  XojoScript.Errors.RbScriptSandboxDelegateToPtr: "Converting Delegates to Ptrs is not allowed in RbScript.", _
		  XojoScript.Errors.WeakAddressOfMustHaveInstanceMethod: "WeakAddressOf can only be used on instance methods.", _
		  XojoScript.Errors.RuntimeDeclaresNotAllowed: "Declares directly into the runtime via Lib """" are no longer allowed.", _
		  XojoScript.Errors.ObjCDeclaresMustHaveTarget: "Objective-C declares must have at least one parameter (the target of the message send).", _
		  XojoScript.Errors.ShadowedPropertyTypeMismatch: "The property being declared has a different type than the property it is shadowing.", _
		  XojoScript.Errors.JumpToMissingLabel: "A GoTo statement is trying to jump to a non-existent label.", _
		  XojoScript.Errors.PragmaWarningNeedsMessage: "'#pragma warning' requires a warning message.", _
		  XojoScript.Errors.PragmaErrorNeedsMessage: "'#pragma error' requires an error message.", _
		  XojoScript.Errors.DuplicateLabel: "Duplicate label." )
		  
		  Return errors.lookup( code, "" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Eval(expression As String) As String
		  // Creates a simple script that is used to evaluate the expression.
		  // Essentially, the expression is assigned to a Variant which has
		  // the effect of also evaluating it.
		  
		  // If the resulting expression is numeric then it is converted to a string
		  // so it can be returned.
		  
		  // After the script runs, the evaluated expression result is stored in mResult and
		  // this is returned to the caller.
		  
		  Dim source As String
		  
		  source = "Dim expr As Variant = " + expression + EndOfLine + _
		  "If expr.IsNumeric Then " + EndOfLine + _
		  "mResult = Str(expr.DoubleValue)" + EndOfLine + _
		  "Else " + EndOfLine + _
		  "mResult = expr" +EndOfLine +  _
		  "End If"
		  
		  Self.Source = source
		  Self.Context = Self // So we can refer to Evaluator.mResult property in XojoScript
		  Self.Run
		  
		  Self.Context = Nil
		  
		  Return mResult
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mResult As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="State"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="States"
			EditorType=""
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Source"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
