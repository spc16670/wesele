
var whaleApp = angular.module('WhaleApp', [
  'ngAnimate'
  ,'ui.bootstrap'
  ,'ui.router'
  ,'xeditable'
  ,'cgBusy'
  ,'pascalprecht.translate'
  ,'whale.Factories'
  ,'whale.Factories.Guests'
  ,'whale.Factories.Wesele'
  ,'whale.Controllers.Top'
  ,'whale.Controllers.Shell'
  ,'whale.Controllers.Main'
  ,'whale.Controllers.Login'
]);

whaleApp.config(function($interpolateProvider){
  $interpolateProvider.startSymbol('{[').endSymbol(']}');
});

// Needed for xeditable
whaleApp.run(function(editableOptions) {
  editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});


// configure our routes
whaleApp.config(function($stateProvider,$urlRouterProvider) {
  $urlRouterProvider.otherwise('/');

  $stateProvider

  .state('shell', {
    abstract : true
    ,template: '<ui-view/>' 
    ,data : { access: 1 }
    ,resolve: {
      authorize: ['FactoryAuth',
        function(FactoryAuth) {
          console.log('AUTHORISATION RUNS');
          return FactoryAuth.authenticate({operation: 'initialize'});
        }
      ]
    }
  })

  .state('shell.login', {
    url: '/login'
    ,controller: 'ControllerLogin'
    ,templateProvider: function (FactoryPartials,$stateParams) {
      console.log('login activated: ',$stateParams.id);
      FactoryPartials.fetch('login');
      return FactoryPartials.promise.then(function(response) {
        return response.data.partial;
      }); 
    }
  })
 
  .state('shell.admin', {
    url : '/admin'
    ,data : { access: 5 }
//    ,views : { 
//      "main" : {       
	,templateProvider: function (FactoryPartials,$stateParams) {
          console.log('admin activated: ',$stateParams.id);
          FactoryPartials.fetch('admin');
          return FactoryPartials.promise.then(function(response) {
            return response.data.partial;
          });    
//        }
//      }
    }
  })

  .state('shell.main', {
    url : '/'
    ,controller: 'ControllerMain'
    ,templateProvider: function (FactoryPartials,$stateParams) {
      console.log('welcome activated: ',$stateParams.id);
      FactoryPartials.fetch('welcome');
      return FactoryPartials.promise.then(function(response) {
        return response.data.partial;
      }); 
    }
  })

});


/*
 * Set up transaltions.
 */
whaleApp.config(['$translateProvider', function ($translateProvider) {
  $translateProvider.translations('en', {
    'TITLE': 'Hello',
    'FOO': 'This is a paragraph'
  });
 
  $translateProvider.translations('pl', {
    'TITLE': 'Czesc',
    'FOO': 'To jest paragraph'
  });

  $translateProvider.translations('de', {
    'TITLE': 'Hallo',
    'FOO': 'Dies ist ein Paragraph'
  });
 
  $translateProvider.preferredLanguage('en');
}]);



whaleApp.run(['$rootScope', '$state', 'FactoryAuth', function ($rootScope, $state, FactoryAuth) {
  $rootScope.$on("$stateChangeStart", function (event, toState, toParams, fromState, fromParams) {
    console.log('TO STATE',toState);
    if(!('data' in toState) || !('access' in toState.data)){
      $rootScope.error = "Access undefined for this state";
      console.log('ACCESS UNDEFINED FOR THIS STATE',toState);
      event.preventDefault();
    } else if (toState.data.access > FactoryAuth.user.access) {
      console.log('ACCESS DENIED',toState.access);
      $rootScope.error = "Seems like you tried accessing a route you don't have access to...";
      event.preventDefault();
      if(fromState.url === '^') {
        if(FactoryAuth.isLogged) {
          console.log('GOING TO SHOP');
          $state.go('public.shop');
        } else {
          $rootScope.error = null;
          console.log('GOING TO LOGIN');
          $state.go('public.login');
        }
      }
    } else {
      if (fromState.abstract) {
        console.log('SWITCHING FROM ABSTRACT STATE',fromState.name);
      }
      console.log('USER ACCESS',FactoryAuth.user.access);
      console.log('STATE ACCESS',toState.data.access);
    }
  });
}]);

/*
 * This is needed to ensure conditional ng-show works
 */
whaleApp.run(function ($state,$rootScope) {
    $rootScope.$state = $state;
});

whaleApp.run(
  function($rootScope) {
      $rootScope.$on('$stateChangeStart',function(event, toState, toParams, fromState, fromParams){
      console.log('$stateChangeStart to '+toState.to+'- fired when the transition begins. toState,toParams : \n',toState, toParams);
    });
    $rootScope.$on('$stateChangeError',function(event, toState, toParams, fromState, fromParams, error){
      console.log('$stateChangeError - fired when an error occurs during transition.');
      console.log(error);
    });
    $rootScope.$on('$stateChangeSuccess',function(event, toState, toParams, fromState, fromParams){
      console.log('$stateChangeSuccess to '+toState.name+'- fired once the state transition is complete.');
    });

    $rootScope.$on('$viewContentLoading',function(event, viewConfig){
     // runs on individual scopes, so putting it in "run" doesn't work.
      console.log('$viewContentLoading - view begins loading - dom not rendered',viewConfig);
    });
    $rootScope.$on('$viewContentLoaded',function(event){
      console.log('$viewContentLoaded - fired after dom rendered',event);
    });
    $rootScope.$on('$stateNotFound',function(event, unfoundState, fromState, fromParams){
      console.log('$stateNotFound '+unfoundState.to+'  - fired when a state cannot be found by its name.');
      console.log(unfoundState, fromState, fromParams);
    });
  }
);
