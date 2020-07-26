module uim.react.functions.dom;

import uim.react;

auto rtDOMRender(string target, string content) {
  return `ReactDOM.render(%s,document.getElementById("%s"))`.format(content, target);
}
unittest {
  assert(rtDOMRender("app", "something") == `ReactDOM.render(something,document.getElementById("app"))`);
}

auto rtDOMRender(string target, DH5Obj content) {
  return `ReactDOM.render(%s,document.getElementById("%s"))`.format(content.toReactDom, target);
}
unittest {
  writeln(rtDOMRender("app", H5Div));
  assert(rtDOMRender("app", H5Div) == `ReactDOM.render(%s,document.getElementById("app"))`.format(H5Div.toReactDom));
}

string toReactDom(DH5Obj obj) {
  string[] content;
  foreach (h; obj.html) content ~= toReactDom(h);
  return "React.DOM.%s(%s,%s)".format(obj.tag, obj.attributes.toJS, content.join(","));
}
unittest {

}

string toReactDom(string tag, string[string] attributes, string content) {  
  string c = (content.length > 0) ? content: "null";
  auto atts = attributes.dup;
  if ("class" in atts) { atts["className"] = atts["class"]; atts.remove("class"); }
  if ("for" in atts) { atts["htmlFor"] = atts["for"]; atts.remove("for"); }
  string a = (atts.length > 0) ? atts.toJS: "null";
  return "React.DOM.%s(%s,%s)".format(tag, a, c);
}
unittest {
/*   assert(toReactDom("h1", ["a":""], string content) {
  string c = (content.length > 0 ? content, "null");
  string a = (attributes.length > 0 ? attributes.toJS, "null");
  return "React.DOM.%s(%s,%s)".format(tag, a, c);
 */
}

string toReactDom(string tag, string[string] attributes, string[string] style, string content) {  
  string c = (content.length > 0 ? content: "null");
  auto atts = attributes.dup;
  if ("class" in atts) { atts["className"] = atts["class"]; atts.remove("class"); }
  if ("for" in atts) { atts["htmlFor"] = atts["for"]; atts.remove("for"); }
  if (style) atts["style"] = style.toJS;
  string a = (atts.length > 0) ? atts.toJS : "null";
  return "React.DOM.%s(%s,%s)".format(tag, a, c);
}
unittest {
  writeln(toReactDom("h1", ["a":"b"], ["color":"black"], "something"));
  assert(toReactDom("h1", ["a":"b"], ["color":"black"], "something") == "React.DOM.h1({a:'b',style:{color:'black'}},something)");
}
