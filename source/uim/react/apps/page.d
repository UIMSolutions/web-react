module uim.react.apps.page;

import uim.react;

class DReactPage : DH5AppPage {
	this() { super(); }
	this(DH5App anApp) { super().app(anApp); }
	this(string aName) { super().name(aName); }
	this(DH5App anApp, string aName) { super(anApp).name(aName); }

  DReactComponent[] _components;
  O components(this O)(DReactComponent[] addComponents...) { this.components(addComponents); return cast(O)this; }
  O components(this O)(DReactComponent[] addComponents) { _components ~= addComponents; return cast(O)this; }
  unittest {

  }

}
auto H5AppPage() { return new DH5AppPage(); }
auto H5AppPage(string aName) { return new DH5AppPage(aName); }
auto H5AppPage(DH5App anApp) { return new DH5AppPage(anApp); }
auto H5AppPage(DH5App anApp, string aName) { return new DH5AppPage(anApp, aName); }

unittest {
}
