module uim.react.dom;

import uim.react;

auto rtRender(string target, DH5Obj obj) {
  return `ReactDOM.render(%s,document.getElementById("%s"))`.format(obj.toReact, target);
}

auto toReact(DH5Obj obj) {
  return "React.DOM.%s(%s,%s)".format(obj.tag, obj.attributes.toJS, obj.content);
}

/*
string toReact(DH5Obj h5) {
	auto tag = h5.tag;
	auto single = h5.single;
	auto id = h5.id;
	auto classes = h5.classes;

	auto attributes = h5.attributes;
	if (h5.id) attributes["id"] = h5.id;	
	if (h5.classes) attributes["className"] = h5.classes.join(" ");	
	
	if (h5.single) {
		if (attributes) return "<%s %s/>".format(tag, attributes.toHTML);
		return "<%s/>".format(tag);  
	}
	string children = "";
	foreach(child; h5.html) children ~= child.toReact;

	if (attributes) return "<%s %s>%s</%s>".format(tag, attributes.toHTML, children, tag);
	return "<%s>%s</%s>".format(tag, children, tag);
}
*/