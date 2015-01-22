
var whaleControllers = angular.module('whale.Controllers.Top', []);

//---------------------------- ControllerLanding ------------------------------

whaleControllers.controller('ControllerTop', ['$scope','$translate','$state',
  'anchorSmoothScroll','$location',function($scope,$translate,$state,anchorSmoothScroll,$location) { 

  $scope.langs = [{ name: 'English', lang : 'en' },{ name: 'Polski', lang : 'pl' }];
  $scope.selectedLang =  $scope.langs[0];
  $scope.$watch(function() {return $scope.selectedLang},function() {
    $translate.use($scope.selectedLang.lang);
  })


  $scope.scrollTo = function(id) {
    $location.hash(id);
    anchorSmoothScroll.scrollTo(id);
  }
}]);

