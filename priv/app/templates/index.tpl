<!doctype html>
<html lang="en" ng-app="WhaleApp">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="whale website">
  <meta name="author" content="whale">
  <title>Lamazone</title>
  <link rel="shortcut icon" href="/static/images/favicon.ico">
  <link rel="stylesheet" href="/static/css/bootstrap/bootstrap-3.1.1.min.css">
  <link rel="stylesheet" href="/static/css/animate/animate-3.1.1.css">
  <link rel="stylesheet" href="/app/css/wesele.css">
  <link rel="stylesheet" href="/static/css/angular-busy/angular-busy-4.0.0.min.css">
  <link rel="stylesheet" href="/static/css/angular-xeditable/xeditable-0.1.8.css">

  <link href='http://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>

  <script src="/static/js/jquery/jquery-1.11.1.min.js"></script>
  <!-- <script src="/static/js/bootstrap-3.1.1/bootstrap.min.js"></script> -->
  <script src="/static/js/bullet/bullet-0.4.1.js"></script>
  <script src="/static/js/angular/angular-1.2.9.min.js"></script>
  <script src="/static/js/angular/angular-route-1.2.9.js"></script>
  <script src="/static/js/angular/angular-animate-1.2.9.min.js"></script>
  <script src="/static/js/angular-ui/ui-bootstrap-tpls-0.11.0.min.js"></script>
  <script src="/static/js/angular-busy/angular-busy-4.0.0.min.js"></script>
  <script src="/static/js/angular-xeditable/xeditable-0.1.8.min.js"></script>
  <script src="/static/js/angular-ui-router/angular-ui-router-0.2.11.js"></script>
<!--  <script src="/static/js/whale/admin/categories/whale.admin.categories.Controllers.js"></script>
  <script src="/static/js/whale/admin/categories/whale.admin.categories.Factories.js"></script>
  <script src="/static/js/whale/admin/items/whale.admin.items.Controllers.js"></script>
  <script src="/static/js/whale/admin/items/whale.admin.items.Factories.js"></script>
  <script src="/static/js/whale/admin/whale.admin.Controllers.js"></script>
  <script src="/static/js/whale/whale.Directives.js"></script>
  <script src="/static/js/whale/whale.Controllers.js"></script>
-->
  
  <script src="/app/services/Factory.js"></script>
  <script src="/app/services/FactoryGuests.js"></script>
  <script src="/app/partials/ControllerShell.js"></script>
  <script src="/app/templates/ControllerMain.js"></script>
  <script src="/app/partials/ControllerLogin.js"></script>
  <script src="/app/app.js"></script>
  <!-- <script src="/static/js/angular-ui-0.11.0/ui-bootstrap.min.js"></script> -->
</head>
<body ng-controller="ControllerShell">
    
    <!-- Top Panel -->
    <div id="topPanel" cg-busy="busyMain">
      {% include "topPanel.tpl" %}
    </div>
    
    <!-- Main Container -->  
    <div id="main">
      <div ui-view></div> 

      {% include "main.tpl" %}
    </div>
  
  <div style="color:sienna">{{ sid }}</div>
  <div id="session_id" style="display:none">{{ sid }}</div>
  <div id="hostname" style="display:none">{{ hostname }}</div>
  <div id="http_port" style="display:none">{{ http_port }}</div>
  <div id="client_timeout" style="display:none">{{ client_timeout }}</div>
</body>
</html>