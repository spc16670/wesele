
var whaleControllers = angular.module('whale.Controllers.Guests', []);

//---------------------- ControllerLanding ------------------------

whaleControllers.controller('ControllerGuests', ['$scope',
  'FactoryGuests','$state',
  function($scope,FactoryGuests,$state) {

  $scope.guests = [];

  $scope.getGuests = function() {
    FactoryGuests.fetchGuests();
  }

  $scope.$watch(function() {return FactoryGuests},function(){
    $scope.guests = FactoryGuests.guests;
    console.log("Guests RECEIVED: ",$scope.guests);
  },true);


}]);


