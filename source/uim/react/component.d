module uim.react.component;

/* React components as ES6 classes */
class DReactComponent  {
    this() {}
    this(string aName) {this(); _name = aName; }
    this(string aName, string someRender) { this(aName); _render = someRender; }

    private string _name;
    @property O name(this O)(string newName) { _name = newName; return cast(O)this; }    
    @property string name() { return _name; }    

    private string[string] _state;
    @property O state(this O)(string[string] newState) { _state = newState; return cast(O)this; }    
    @property string[string] state() { return _state; }    
    O state(this O)(string key, string value) { _state[key] = value; return cast(O)this; }    

    private string _render;
    @property O render(this O)(string newRender) { _render = newRender; return cast(O)this; }    
    @property string render() { return _render; }    

	  bool opEquals(string txt) { return toString == txt; }

    override string toString() {
      string inner;

      string constructor = "super();";
      if (!_state.empty) constructor ~= "this.state="~_state.toJS;
      if (constructor) inner ~= "constructor(){"~constructor~"}";
      return "class "~_name~" extends React.Component{render(){"~inner~";return("~render~")}}";
    }
}
auto ReactComponent() { return new DReactComponent; }
auto ReactComponent(string aName) { return new DReactComponent(aName); }
auto ReactComponent(string aName, string someRender) { return new DReactComponent(aName, someRender); }

/* Alternative way to create React Components using functions */
auto reactComponent(string name, string render) {  
  return "function "~name~"() { return "~render~"; }";  
}


unittest {
  assert(ReactComponent("test") == "class test extends React.Component{render(){return()}}");
  assert(ReactComponent("test", "content") == "class test extends React.Component{render(content){return()}}");
}