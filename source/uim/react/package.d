module uim.react;

public import uim.react.component;
public import uim.react.dom;

string rtCreateElement(string type, string[string] props = null, string[] childs = null) {
	auto result = "React.createElement("~type;

	if (!p.empty) result ~= ","~props.toJS;

	if (childs.length > 0) {
		switch(childs.length) {
			case 1: result ~= ","~childs[0]; break;
			default: result ~= ","~"["~childs.join(",")~"]";
		}
	} 
	return result~")";
}

unittest {
	assert(rtCreateElement("'h1'") == "React.createElement('h1')");
	assert(rtCreateElement("'h1'", ["style":"{color:'red'}"]) == "React.createElement('h1', {style:{color:'red'}})");
	assert(rtCreateElement("'h1'", ["style":"{color:'red'}", "'Welcome to UI Manufaktur'"]) == "React.createElement('h1',{style:{color:'red'}}, 'Welcome to UI Manufaktur')");
}
