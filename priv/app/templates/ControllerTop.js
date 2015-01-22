
var whaleControllers = angular.module('whale.Controllers.Top', []);

//---------------------------- ControllerLanding ------------------------------

whaleControllers.controller('ControllerTop', ['$scope','$translate','$state',
  function($scope,$translate,$state) { 

  $scope.langs = [{ name: 'English', lang : 'en' },{ name: 'Polski', lang : 'pl' }];
  $scope.selectedLang =  $scope.langs[0];
  $scope.$watch(function() {return $scope.selectedLang},function() {
    $translate.use($scope.selectedLang.lang);
  })

}]);

