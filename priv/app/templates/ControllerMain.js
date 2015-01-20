
var whaleControllers = angular.module('whale.Controllers.Main', []);

//---------------------- ControllerLanding ------------------------

whaleControllers.controller('ControllerMain', ['$scope','$state',function($scope,$state) { 

  $scope.guests = [];
  // Mutate the toggler object in accordance to user role 
  $scope.$watch(function() {return FactoryCategories},function() {
     $scope.guests = FactoryGuests.guests;
     $scope.promise = FactoryGuests.promise;
  })

  
}]);

