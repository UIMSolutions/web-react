module uim.react.functions.base;

import uim.react;

string rtCreateElement(string content) {
  return "React.createElement("~content~")";
}