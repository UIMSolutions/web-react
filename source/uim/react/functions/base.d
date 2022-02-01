module uim.react.functions.base;

@safe:
import uim.react;

string rtCreateElement(string content) {
  return "React.createElement("~content~")";
}
unittest {

}

string rtCreateElement(DH5Obj h5) {
  string tag = h5.tag;
  string options = "null";
  if (h5.attributes.length > 0) options = h5.attributes.toJS;
  string[] contents;
  foreach(item; h5.html) contents ~= item.rtCreateElement;
  return "React.createElement('%s',%s,%s)".format(tag, options, contents.join(","));
}
unittest {
  
}

string rtCreateClass(string className, string content) {
  return className~"=React.createClass({"~content~"});";
}
unittest {
  assert(rtCreateClass("var aClass", "something") == "var aClass=React.createClass({something});");
}

string rtCreateFactory(string target, string content) {
  return target~"=React.createFactory("~content~");";
}
unittest {
  assert(rtCreateFactory("var aTest", "something") == "var aTest=React.createFactory(something);");
}

string rtPropTypes(string[string] values) {
  return "propTypes:"~values.toJS;
}
unittest {

}

string rtDefaultProps(string[string] values) {
  return "getDefaultProps:function(){return "~values.toJS~";}";
}
unittest {

}

string rtInitialState(string[string] values) {
  return "getInitialState:function(){return "~values.toJS~";}";
}
unittest {

}

string rtSetState(string[string] values) {
  return "this.setState("~values.toJS~")";
}
unittest {

}