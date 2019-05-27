module uim.react.component;

class DReactComponent  {
    this() {}
    this(string aName) {this(); _name = aName; }
    this(string aName, string someRender) { this(aName); _render = someRender; }

    private string _name;
    @property O name(this O)(string newName) { _name = newName; return cast(O)this; }    
    @property string name() { return _name; }    

    private string _render;
    @property O render(this O)(string newRender) { _render = newRender; return cast(O)this; }    
    @property string render() { return _render; }    

    override string toString() {
        return "
class "~_name~" extends React.Component {
  render() {
    return ("~render~");
  }
}";
    }
}
auto ReactComponent() { return new DReactComponent; }
auto ReactComponent(string aName) { return new DReactComponent(aName); }
auto ReactComponent(string aName, string someRender) { return new DReactComponent(aName, someRender); }

unittest {

}