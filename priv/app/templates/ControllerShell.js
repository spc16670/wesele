
var whaleControllers = angular.module('whale.Controllers.Shell', []);

//---------------------- ControllerLanding ------------------------

whaleControllers.controller('ControllerShell', ['$scope',
  'FactoryBullet','FactoryAuth','$state','anchorSmoothScroll','$location','$translate',
  function($scope,FactoryBullet,FactoryAuth,$state,anchorSmoothScroll,$location,$translate) { 

  console.log('current STATE::::',$state.current); 
  $scope.busyMain = FactoryBullet.promise;

  // LANGUAGES
  $scope.langs = [{ name: 'Polski', lang : 'pl' },{ name: 'English', lang : 'en' }];
  $scope.selectedLang =  $scope.langs[0];
  $scope.$watch(function() {return $scope.selectedLang},function() {
    $translate.use($scope.selectedLang.lang);
  })


  // SCROLLING
  $scope.scrollTo = function(id) {
    $location.hash(id);
    anchorSmoothScroll.scrollTo(id);
  }


  // TOGGLING HIDDEN FORMS
  $scope.toggler = {
    login : false
    ,contact : false
  };
  $scope.visible = function(div) {
    for (var key in $scope.toggler) {
      if ($scope.toggler.hasOwnProperty(key)) {
        if (key === div) {
	  if (div === "contact") {
            $scope.scrollTo('ContactInfoRow');
          } 
          $scope.toggler[key] = !$scope.toggler[key];
          // invalidate other flags
	  for (var key in $scope.toggler) {
            if ($scope.toggler.hasOwnProperty(key)) {
              if (key !== div) {
                $scope.toggler[key] = false;
              }
            }
          }
        }
      }
    } 
  }


  // AUTHORISATION
  $scope.user = FactoryAuth.user;

  $scope.$watch(function() {return FactoryBullet},function(){
    $scope.busyMain = FactoryBullet.promise;
  },true);

  $scope.$watch(function() {return FactoryAuth},function(){
    $scope.user = FactoryAuth.user;
  },true);

  $scope.logout = function() {
    FactoryAuth.logout();
  };

}]);
