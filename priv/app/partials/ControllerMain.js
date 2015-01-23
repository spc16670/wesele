
var whaleControllers = angular.module('whale.Controllers.Main', []);

//----------------------------- ControllerLanding -----------------------------

whaleControllers.controller('ControllerMain', ['$scope','$state','FactoryGuests','loadMaps'
  ,function($scope,$state,FactoryGuests,loadMaps) { 

  google.maps.event.addDomListener(window, 'resize', loadMaps.initialize());
  google.maps.event.addDomListener(window, 'load', loadMaps.initialize())

  $scope.guest = { main: "", partner: "", email: "", accomodation: false, comments: "" }; 

  $scope.guests = [];
  // Mutate the toggler object in accordance to user role 
  $scope.$watch(function() {return FactoryGuests},function() {
     $scope.guests = FactoryGuests.guests;
     $scope.promise = FactoryGuests.promise;
  })

  $scope.submit = function(guest) {
    console.log("submitted: ",guest);
    $scope.guest = angular.copy(guest);
    FactoryGuests.addGuest($scope.guest);
  };
}]);

