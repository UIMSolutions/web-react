module uim.react.classes.component;

import uim.react;

class DReactComponent {
  this(string aName) {
    this.name(aName);
  }

  mixin(OProperty!("string", "name"));
  unittest {
    assert(ReactComponent("test").name == "test");
  }

  mixin(OProperty!("bool", "jsxMode"));
  unittest {
    assert(!ReactApp.jsxMode);
    assert(ReactApp.jsxMode(true).jsxMode);
  }

  bool opEquals(const string txt) {
    return (txt == toString);
  }

  mixin(OProperty!("string", "render"));
  O render(this O)(DH5Obj obj) {
    if (jsxMode) _render = obj.toJSX;
    else _render = obj.toReact;

    return cast(O)this;
  }

  override string toString() {
    return jsClass(_name, "React.Component", [
      jsMethod("render", _render)
    ]);
  }
}
auto ReactComponent(string aName) { return new DReactComponent(aName); }

unittest {
  writeln(ReactComponent("test"));
}