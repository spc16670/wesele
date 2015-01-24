
<!-- LOGIN -->
<div class="row" ng-if="$parent.toggler.login" ng-controller="ControllerLogin">
  <div class="container top-buffer">
    <div class="col-md-4"></div>
      <div class="col-md-4">
	<form class="form-signin top-buffer" name="loginForm" role="form" ng-submit="submit()">
	  <input type="email" class="form-control" ng-model="login.email" placeholder="Email address" required autofocus>
	  <input type="password" class="form-control" ng-model="login.password" placeholder="Password" required>
	  <!--<label class="checkbox">
	    <input type="checkbox" value="remember-me"> Remember me
	  </label> -->
	  <button class="btn btn-lg btn-primary btn-block" ng-model="login" type="submit">Sign in</button>
	  <a href="">Forgot password?</a>
	  <div id="loginStatus" style="height:30px">
	    <div ng-repeat="alert in alerts" close="closeAlert($index)">
	      <div class="alert alert-{[ alert.type ]} alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		<strong></strong> {[ alert.msg ]}
	      </div>
	    </div>
	  </div>
	</form>
      </div>
    <div class="col-md-4"></div>
  </div>
</div>


<!-- CONTENT -->
    <div class="jumbotron alpha" ng-if="!$parent.toggler.login">
      <div class="container">
        <h1 class="promocyjna">{[ 'WELCOME_HEADER' | translate  ]}</h1>
        <h2 class="promocyjna">{[ 'WELCOME_INFO' | translate  ]}</h2>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div id="LetUsKnowRow" class="row">
        <div class="col-md-6">

	  <fieldset novalidate name="form" ng-disabled="added == 1" class="form-horizontal" role="form">
	    <div class="form-group">
	      <label class="control-label col-sm-4">{[ 'FORM_INPUT_NAME' | translate  ]}</label>
	      <div class="col-sm-8">          
		<input class="form-control" type="text" ng-model="guest.main" id="main" required="" placeholder="{[ 'FORM_INPUT_NAME_PLACEHOLDER' | translate  ]}">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-4">{[ 'FORM_INPUT_PARTNER' | translate  ]}</label>
	      <div class="col-sm-8">          
		<input class="form-control" type="text" ng-model="guest.partner" id="partnername" placeholder="{[ 'FORM_INPUT_PARTNER_PLACEHOLDER' | translate  ]}">
	      </div>
	    </div> 
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="email">{[ 'FORM_INPUT_EMAIL' | translate  ]}</label>
	      <div class="col-sm-8">
		<input type="email" class="form-control" ng-model="guest.email" id="email" required="" placeholder="{[ 'FORM_INPUT_EMAIL_PLACEHOLDER' | translate  ]}">
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-4" for="email">{[ 'FORM_INPUT_ACCOMODATION' | translate  ]}</label>
	      <div class="col-sm-8">
		<div class="checkbox">
		  <input type="checkbox" ng-model="guest.accomodation">
		</div>
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-4" for="email">{[ 'FORM_INPUT_COMMENTS' | translate  ]}</label>
	      <div class="col-sm-8">
	        <textarea class="form-control" rows="3" ng-model="guest.comments" placeholder="{[ 'FORM_INPUT_COMMENTS_PLACEHOLDER' | translate  ]}"></textarea>	
	      </div>
	    </div>

	    <div class="form-group">        
	      <div class="col-sm-offset-4 col-sm-8">
		<button type="submit" ng-click="submit(guest)" class="btn btn-default">{[ 'FORM_SUBMIT' | translate ]}</button>
	      </div>
	    </div>
	  </form>

       </div>

        <div class="col-md-6 alpha">
          <h2>{[ 'FORM_HEADER' | translate ]}</h2>
          <div ng-if="added == 0"><p>{[ 'FORM_INFO' | translate ]}</p></div>
          <div ng-if="added == 1"><h2 style="color:green"> {[ 'MSG_GUEST_ADDED' | translate ]}</h2></div>
          <div ng-if="added == 2"><h2 style="color:red"> {[ 'MSG_GUEST_NOT_ADDED' | translate ]}</h2></div>
        </div>

      </div> <!-- LetUsKNowRow -->




      <div id="ChurchInfoRow" class="row top-buffer">
        <div class="col-md-6">
	  <form class="form-horizontal" role="form">
	    <div  style="height:300px;" id="church-map-div"></div>
          <form>
        </div>
        <div class="col-md-6 alpha">
          <h2>{[ 'CHURCH_HEADER' | translate ]}</h2>
          <p>{[ 'CHURCH_HEADER' | translate ]}</p>
          <p><a class="btn btn-default" href="http://parafia.frysztak.pl" role="button">{[ 'CHURCH_WEBSITE' | translate ]} &raquo;</a></p>
        </div>
      </div> <!-- ChurchInfoRow -->




      <div id="ReceptionInfoRow" class="row top-buffer">
        <div class="col-md-6">
	  <form class="form-horizontal" role="form">
	    <div  style="height:300px;" id="reception-map-div"></div>
          <form>
        </div>
        <div class="col-md-6 alpha">
          <h2>{[ 'RECEPTION_HEADER' | translate ]}</h2>
          <p>{[ 'RECEPTION_INFO' | translate ]}</p>
          <p><a class="btn btn-default" href="http://dwormariaantonina.pl/" role="button">{[ 'RECEPTION_WEBSITE' | translate ]} &raquo;</a></p>
        </div>

      </div> <!-- ReceptionInfoRow -->




      <div id="ContactInfoRow" name="contact" class="row top-buffer">
        <div class="col-md-12 alpha">
          <h2>{[ 'CONTACT_HEADER' | translate ]}</h2>
          <hr>
          <div class="row">
            <div class="col-md-4">
              <p><strong><span class="glyphicon glyphicon-info-sign"></span> {[ 'CONTACT_INFO' | translate ]}</strong></p>
            </div>

            <div class="col-md-4">
              <h4>Ania</h4>
              <p><strong><span class="glyphicon glyphicon-envelope"></span> zulauf.anna@gmail.com</strong></p>
              <p><strong><span class="glyphicon glyphicon-phone"></span> +44 7583 633 457</strong></p>
            </div>
            <div class="col-md-4">
              <h4>Szymek</h4>
              <p><strong><span class="glyphicon glyphicon-envelope"></span> szymonpiotrczaja@gmail.com</strong></p>
              <p><strong><span class="glyphicon glyphicon-phone"></span> +44 7871 259 234</strong></p>
            </div>
          </div>
        </div>

      </div> <!-- ContactInfoRow -->
    
    </div> <!-- /container -->

