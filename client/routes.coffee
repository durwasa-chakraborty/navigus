navRoutes = [
  new NavRoute('dashboard', 'fa-dashboard')
  new NavRoute('charts', 'fa-bar-chart-o')
  new NavRoute('chart1', '', {parentName: 'charts'})
  new NavRoute('chart2', '', {parentName: 'charts'})
  new NavRoute('graph', '', {parentName: 'charts'})  
  new NavRoute('pages', 'fa-files-o', {label: "Sample Pages"})
  new NavRoute('sign-up-ref', '', {redirect: 'sign-up', parentName: 'pages', layoutTemplate: 'loginLayout', label: 'Sign Up'})
  new NavRoute('sign-up', '', {isMainNav: false, template: 'signUp', layoutTemplate: 'loginLayout'})
  new NavRoute('', '', {isMainNav: false, redirect: 'dashboard'})
  new NavRoute('index', '', {isMainNav: false, redirect: 'dashboard'})
]

navRouteList = new NavRouteList(navRoutes)

Session.set('navRoots', navRouteList.rootNavRoutes)