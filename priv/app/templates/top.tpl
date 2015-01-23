
  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top" cg-busy="busyMain" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" style="font-family: 'Tangerine', bold; font-size: 40px; color: black" href="#">Ania i Szymek</a>
      </div> <!--./navbar-header-->

      <div class="navbar-collapse collapse">
 
       <!-- LANG -->
        <ul class="navbar-form navbar-right">
          <select class="form-control" ng-options="l.name for l in langs" ng-model="selectedLang"></select>
        </ul>

        <ul class="nav navbar-nav navbar-right">
          <li ng-class="{ active: toggler.login }" ng-if="!user.isLogged">
            <a id="btn-signup" href ng-click="visible('login')">Log In</a>
          </li>

          <li ng-class="{ active: toggler.contact }">
            <a href ng-click="visible('contact')">Contact</a>
          </li>
          
          <li class="dropdown" ng-if="user.isLogged">
            <a ng-if="user.isLogged" href="#" class="dropdown-toggle" id="btn-account" data-toggle="dropdown">
	      {[ user.email ]}<b class="caret"></b>
	    </a>
            <ul class="dropdown-menu">
              <li ng-if="user.isLogged">
		 <a id="btn-personal" ui-sref="shell.guests">Guests</a>
              </li>
	      <li class="divider"></li>
	      <li ng-if="user.isLogged">
		<a href="#" ng-click="logout()">Log Out</a>
	      </li>
            </ul>
          </li>

        </ul>

      </div><!--/.nav-collapse -->
    </div>
  </div>

