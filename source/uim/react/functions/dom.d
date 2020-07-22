module uim.react.functions.dom;

import uim.react;

auto rtRender(string target, string content) {
  return `ReactDOM.render(%s,document.getElementById("%s"))`.format(content, target);
}

auto rtRender(string target, DH5Obj content) {
  return `ReactDOM.render(%s,document.getElementById("%s"))`.format(content.toReact, target);
}
