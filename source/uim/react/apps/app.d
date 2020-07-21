module uim.react.apps.app;

import uim.react;

class DReactApp : DH5App {
	this() { super(); }
	this(string aName) { super(aName); }
	this(string aName, string aRootPath) { super(aName, aRootPath); }
// 	this(string aName, string aRootPath, string[string] someParameters) { super(aName, aRootPath, parameters); }

  override void init() {
    this.libraries(
      ["src":"/lib/react/last/react.production.min.js"], 
      ["src":"/lib/react-dom/last/react-dom.production.min.js"]);
  }

  O render(this O)() {
    return cast(O)this;
  }
}
auto ReactApp() { return new DReactApp; }
auto ReactApp(string aName) { return new DReactApp(aName); }
auto ReactApp(string aName, string aRootPath) { return new DReactApp(aName, aRootPath); }
// auto ReactApp(string aName, string aRootPath, string[string] someParameters) { super(aName, aRootPath, parameters); }

unittest {
  writeln(ReactApp);
}