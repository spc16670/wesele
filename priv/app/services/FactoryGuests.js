'use strict';

var whaleFactories = angular.module('whale.Factories.Guests',[]);

whaleFactories.factory('FactoryGuests', ['FactoryRequest','FactoryBullet', 
  function(FactoryRequest,FactoryBullet) {  
  
  var Service = {
    state : 0
    ,guests : []
    ,message : ""
    ,promise : null
    ,result : ""
  };

  Service.fetchGuests = function() {
    Service.state = 1;
    var fetchReq = { 'type': "guest", 'action' : "fetch" };
    var request = FactoryRequest.makeRequest("guests",fetchReq,true);
    var promise = FactoryBullet.send(request);
    Service.promise = promise;
    promise.then(function(response) {
      if (response.operation === "guests") {
	if (response.data.result == "ok") {
	  Service.message = response.data.msg;
	  Service.guests = response.data.data;
          Service.result = "ok";
	} else if(response.data.result == "error") {
	  Service.message = response.data.msg;
          console.log('service msg: ',Service.message);
          Service.guests = [];
          Service.result = "error";
	} else {
	  Service.message = response.data.msg;
	  Service.categories = [];
          Service.result = "error";
        };
      } else {
        Service.message = "Invalid response";
	Service.guests = [];
        console.log('Invalid response: ',response);
      }
    });
  };

  Service.addGuest = function(newGuest) {
    var addReq = { 'type': "guest", 'action' : "add", 'data' : newGuest };
    var request = FactoryRequest.makeRequest("guests",addReq,true); 
    var promise = FactoryBullet.send(request);
    console.log("Submitting new Guest: ",addReq);
    Service.promise = promise;
    promise.then(function(response) {
      if (response.operation === "guests") {
        if (response.data.result == "ok") {
          console.log('New Guest added ',response.data);
          Service.message = response.data.msg;
          Service.result = "ok";
        } else {
          console.log('Could not add new guest ',response.data);
          Service.message = response.data.msg;
          Service.result = "error";
        }
      } else {
        console.log('Invalid response: ',response);
      }
    }); 
  };

  return Service; 
}]);
