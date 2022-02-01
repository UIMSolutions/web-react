module uim.react.classes.component;

@safe:
import uim.react;

class DReactComponent {
  this(string aName) {
    this.name(aName);
  }

  mixin(OProperty!("string", "name"));
  unittest {
    assert(ReactComponent("test").name == "test");
  }

  bool opEquals(const string txt) {
    return (txt == toString);
  }

  mixin(OProperty!("string", "render"));

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