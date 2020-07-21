module uim.react.dom;

import uim.react;

auto rtRender(string target, DH5Obj obj) {
  return `ReactDOM.render(%s,document.getElementById("%s"))`.format(obj.toReact, target);
}

auto toReact(DH5Obj obj) {
  return "React.DOM.%s(%s,%s)".format(obj.tag, obj.attributes.toJS, obj.content);
}