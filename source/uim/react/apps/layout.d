module uim.react.apps.layout;

import uim.react;

/// Page layout
 class DReactLayout : DH5AppLayout {
	this() { super(); }
	this(DH5App anApp) { this().app(anApp); }

	override string toString() { return toString("", null); }
	override string toString(DH5AppPage page, string[string] parameters = null) {
		super.toString(page, parameters);
		if (auto rtPage = cast(DReactPage)page) {
			if (rtPage.components) {
				if ("components" in parameters) parameters["components"] = rtPage.components.toString~parameters["components"];
				else parameters["components"] = rtPage.components.toString;
			}
		}
		return toString(page.content, parameters);
	}

	override string toString(string content, string[string] parameters = null) {
		super.toString(content, parameters);
		if (auto rtApp = cast(DReactApp)this.app) {
			if (rtApp.components) {
				if ("components" in parameters) parameters["components"] = rtApp.components.toString~parameters["components"];
				else parameters["components"] = rtApp.components.toString;
			}
		}
		debug writeln(parameters);

		auto finalLang = parameters.get("lang", this.lang); // if lang !in parameters use this.lang
		auto finalTitle = parameters.get("title", this.title);  // if title !in parameters use this.title
		if (content.length == 0) content = `<div id="app"></div>`;

		// creating HTML page
		auto result = H5Html
		.attributes("lang", finalLang).attributes("dir", ("dir" in parameters ? parameters["dir"] : "ltr"))
		// Head part of HTML
		.head(_headClasses)
		.head(_headAttributes)
		.head(this.metas.asString~parameters.get("metas", ""))
		.head(finalTitle.length > 0 ? "<title>" ~ finalTitle ~ "</title>":"")
		.head(this.styles.asString~parameters.get("styles", ""))
		// Body part of HTML
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.toString(content, this.parameters) : content)
		.body_(parameters.get("libraries", ""))
		.body_(("components" in parameters) ? H5Script(parameters.get("components", "")).toString : "");


		return result.toString;
	}
	unittest {
		writeln(H5AppLayout);
		assert(H5AppLayout == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		assert(H5AppLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}
}
auto ReactLayout() { return new DReactLayout(); }

unittest {

}
