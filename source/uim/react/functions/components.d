module uim.react.functions.components;

import uim.react;

string rtComponent(string className, DH5Obj h5) {
	return "class %s extends React.Component{render(){return %s;}}".format(className, h5.toReactDom);
}
unittest {
	writeln(rtComponent("Test", H5H1("Message")));
}

string rtComponentWillUpdate(string jsBody) {
	return `componentWillUpdate:`~jsFunc(jsBody);
}
unittest {
	assert(rtComponentWillUpdate("something") == `componentWillUpdate:function(){something}`);
}

string rtComponentDidUpdate(string jsBody) {
	return `componentDidUpdate:`~jsFunc(jsBody);
}
unittest {
	assert(rtComponentDidUpdate("something") == `componentDidUpdate:function(){something}`);
}

string rtComponentWillMount(string jsBody) {
	return `componentWillMount:`~jsFunc(jsBody);
}
unittest {
	assert(rtComponentWillMount("something") == `componentWillMount:function(){something}`);
}

/*** componentDidMount() 
* A Lifecycle hook
* It is invoked immediately after a component is mounted. 
* Initialization that requires DOM nodes should go here. 
**/
string rtComponentDidMount(string jsBody) {
	return `componentDidMount:`~jsFunc(jsBody);
}
unittest {
	assert(rtComponentDidMount("something") == `componentDidMount:function(){something}`);
}

string rtComponentWillUnmount(string jsBody) {
	return `componentWillUnmount:`~jsFunc(jsBody);
}
unittest {
	assert(rtComponentWillUnmount("something") == `componentWillUnmount:function(){something}`);
}

// shouldComponentUpdate(nextProps, nextState)