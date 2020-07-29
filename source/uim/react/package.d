module uim.react;

public import std.stdio;
public import std.uuid;

public import vibe.vibe;

public import uim.core;
public import uim.oop;
public import uim.css;
public import uim.javascript;
public import uim.html;
public import uim.json;

// packages
public import uim.react.apps;
public import uim.react.classes;
public import uim.react.functions;

// modules
public import uim.react.component;
public import uim.react.dom;

string reactCreateElement(string tag, string[string] props = null, string[] childs = null) {
	auto result = "React.createElement("~tag;

	if (!props.empty) result ~= ","~props.toJS;

	if (childs.length > 0) {
		switch(childs.length) {
			case 1: result ~= ","~childs[0]; break;
			default: result ~= ","~"["~childs.join(",")~"]";
		}
	} 
	return result~")";
}
unittest {
	assert(reactCreateElement("'h1'") == "React.createElement('h1')");
	assert(reactCreateElement("'h1'", ["style":"{color:'red'}"]) == "React.createElement('h1',{style:{color:'red'}})");
	assert(reactCreateElement("'h1'", ["style":"{color:'red'}"], ["'Welcome to UI Manufaktur'"]) == "React.createElement('h1',{style:{color:'red'}},'Welcome to UI Manufaktur')");
}


string toString(DReactComponent[] components) {
	string result;
	foreach(c; components) result ~= c.toString;
	return result;
} 
