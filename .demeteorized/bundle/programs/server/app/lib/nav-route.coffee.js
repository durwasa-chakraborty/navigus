(function(){__coffeescriptShare = typeof __coffeescriptShare === 'object' ? __coffeescriptShare : {}; var share = __coffeescriptShare;
var DEFAULT_MAIN_LAYOUT, NavRoute, NavRouteList;

DEFAULT_MAIN_LAYOUT = 'mainLayout';

NavRoute = (function() {
  function NavRoute(name, icon, config) {
    var _ref;
    this.name = name;
    this.icon = icon;
    this.config = config;
    if (this.name == null) {
      throw new Error('Must provide a name for each NavRoute');
    }
    if (this.config == null) {
      this.config = {};
    }
    _ref = this.config, this.template = _ref.template, this.isMainNav = _ref.isMainNav, this.label = _ref.label, this.path = _ref.path, this.parentName = _ref.parentName, this.layoutTemplate = _ref.layoutTemplate, this.redirect = _ref.redirect;
    if (this.template == null) {
      this.template = this.name;
    }
    if (this.isMainNav == null) {
      this.isMainNav = true;
    }
    if (this.label == null) {
      if (this.redirect != null) {
        this.label = this.redirect.substr(0, 1).toUpperCase() + this.redirect.substr(1);
      } else {
        this.label = this.name.substr(0, 1).toUpperCase() + this.name.substr(1);
      }
    }
    if (this.path == null) {
      this.path = '/' + this.name;
    }
    if (this.icon == null) {
      this.icon = null;
    }
    if (this.layoutTemplate == null) {
      this.layoutTemplate = DEFAULT_MAIN_LAYOUT;
    }
  }

  return NavRoute;

})();

NavRouteList = (function() {
  function NavRouteList(navRoutes) {
    var route, _i, _len;
    this.routes = [];
    this.routeIndex = {};
    this.rootNavRoutes = [];
    this.redirects = [];
    for (_i = 0, _len = navRoutes.length; _i < _len; _i++) {
      route = navRoutes[_i];
      this.addRoute(route);
    }
    this.setRouter();
  }

  NavRouteList.prototype.addRoute = function(route) {
    var parentRoute;
    if (this.routeIndex.hasOwnProperty(route.name)) {
      throw new Error('Route names must be unique');
    }
    if ((route.parentName != null) && !route.isMainNav) {
      throw new Error('Children nav nodes must set isMainNav to true.');
    }
    if (route.children == null) {
      route.children = [];
    }
    if (route.parentName != null) {
      parentRoute = this.getRoute(route.parentName);
      if (!parentRoute.isMainNav) {
        throw new Error('Parent nav nodes must set isMainNav to true.');
      }
      route.path = parentRoute.path + route.path;
      parentRoute.children.push(route);
    } else {
      if (route.isMainNav) {
        this.rootNavRoutes.push(route);
      }
    }
    this.routes.push(route);
    return this.routeIndex[route.name] = route;
  };

  NavRouteList.prototype.getRoute = function(name) {
    return this.routeIndex[name];
  };

  NavRouteList.prototype.setRouter = function(layoutTemplate, redirectTemplate, notFoundTemplate) {
    var r, _i, _len, _ref;
    if (layoutTemplate == null) {
      layoutTemplate = DEFAULT_MAIN_LAYOUT;
    }
    if (redirectTemplate == null) {
      redirectTemplate = 'loading';
    }
    if (notFoundTemplate == null) {
      notFoundTemplate = '404';
    }
    Router.configure({
      layoutTemplate: layoutTemplate,
      notFoundTemplate: notFoundTemplate
    });
    _ref = this.routes;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      r = _ref[_i];
      if (r.redirect != null) {
        Router.route(r.path, function() {
          return this.redirect(r.redirect);
        });
      } else {
        Router.route(r.name, r);
      }
    }
    return Router.onAfterAction(function() {
      return Session.set('active', this.route.getName());
    });
  };

  return NavRouteList;

})();

this.NavRoute = NavRoute;

this.NavRouteList = NavRouteList;

})();

//# sourceMappingURL=nav-route.coffee.js.map
