module uim.react.component;

import uim.react;

/* /// A javascript Class (ECMAScript 2015)	
class DJSClass : DJSRoot {
	this() { super(); }
	this(string aClassName) { this().className(aClassName); }
	this(string aClassName, string aSuperName) { this(aClassName).superName(aSuperName); }
	this(string aClassName, string[] someContructorParameters, string aContructorBody) { this().className(aClassName).constructor(someContructorParameters, aContructorBody); }
	this(string aClassName, string aSuperName, string[] someContructorParameters, string aContructorBody) { this(aClassName).superName(aSuperName).constructor(someContructorParameters, aContructorBody); }


	/// className - Name of this JavaScript Class
	string _className;
	string className() { return _className; }
	O className(this O)(string aClassName) { _className = aClassName; return cast(O)this; }
	unittest {
		assert(JSClass("aClass") == `class aClass{}`);
		assert(JSClass.className("aClass") == `class aClass{}`);
	} 

	/// superName - Name of this JavaScript superClass
	string _superName;
	string superName() { return _superName; }
	O superName(this O)(string aClassName) { _superName = aClassName; return cast(O)this; }
	unittest {
		assert(JSClass("aClass", "aSuper") == `class aClass extends aSuper{}`);
		assert(JSClass("aClass").superName("aSuper") == `class aClass extends aSuper{}`);
	} 

	string constructor() { return "constructor(%s){%s}".format(constructorParameters.join(","), constructorBody); } 
	O constructor(this O)(string[] newParameters, string newBody) { return this.constructorParameters(newParameters).constructorBody(newBody); } 

	string[] _constructorParameters;
	@property O constructorParameters(this O)(string[] newParameters) { _constructorParameters = newParameters; return cast(O)this; } 
	@property auto constructorParameters() { return _constructorParameters; } 
	unittest {
		assert(JSClass("aClass", "aSuper", ["a", "b"], "this.a=a;this.b=b;") == `class aClass extends aSuper{constructor(a,b){this.a=a;this.b=b;}}`);
		assert(JSClass("aClass").superName("aSuper").constructor(["a", "b"], "this.a=a;this.b=b;") == `class aClass extends aSuper{constructor(a,b){this.a=a;this.b=b;}}`);
	} 

	string _constructorBody;
	@property auto constructorBody() { return _constructorBody; } 
	@property O constructorBody(this O)(string newBody) { _constructorBody = newBody; return cast(O)this; } 
	unittest {		
		/// TODO
	} 

	string[string] _getters;
	@property O getters(this O)(string[string] newValues) { _getters = newValues; } 
	@property auto getters() { return _getters; } 
	unittest {		
		/// TODO
	} 

	string[string] _setters;
	@property O setters(this O)(string[string] newValues) { _setters = newValues; } 
	@property auto setters() { return _setters; } 
	unittest {		
		/// TODO
	} 
	
/* 	bool opEquals(string value) { return toString() == value; }
	override string toString() { 
		string result = "class "~_className;
		if (_superName) result ~= " extends "~_superName;
		result ~= "{";
		i *
		/
} */