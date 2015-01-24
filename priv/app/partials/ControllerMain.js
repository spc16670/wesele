
var whaleControllers = angular.module('whale.Controllers.Main', []);

//----------------------------- ControllerLanding -----------------------------

whaleControllers.controller('ControllerMain', ['$scope','$state'
  ,'FactoryGuests','loadMaps','$translate'
  ,function($scope,$state,FactoryGuests,loadMaps,$translate) { 

  $scope.added = 0;
  $scope.guest = { main: "", partner: "", email: "", accomodation: false, comments: "" }; 
  $scope.txtLetUsKnow = ""; 

  // Mutate the toggler object in accordance to user role 
  $scope.$watch(function() {return FactoryGuests},function() {
    $scope.promise = FactoryGuests.promise;
    console.log("MSG IS::::",FactoryGuests.message);
    if (FactoryGuests.result === "ok") {
      $scope.guest = { main: "", partner: "", email: "", accomodation: false, comments: "" };
      //$scope.txtLetUsKnow = $translate.instant('MSG_GUEST_ADDED'); 
      $scope.added = 1;
    } else if (FactoryGuests.result === "error") {
      //$scope.txtLetUsKnow = $translate.instant('MSG_GUEST_NOT_ADDED'); 
      $scope.added = 2;
    }
  },true)

  $scope.submit = function(guest) {
    $scope.guest = angular.copy(guest);
    FactoryGuests.addGuest($scope.guest);
  };

  google.maps.event.addDomListener(window, 'resize', loadMaps.initialize());
  google.maps.event.addDomListener(window, 'load', loadMaps.initialize())


}]);

