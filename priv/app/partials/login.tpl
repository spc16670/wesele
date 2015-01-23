<!-- LOGIN -->
<div class="container top-buffer">
<form class="form-signin" name="loginForm" role="form" ng-submit="submit()">
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
