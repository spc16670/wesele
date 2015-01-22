'use strict';

var whaleFactories = angular.module('whale.Factories.Wesele',[]);

whaleFactories.service('loadMaps',function() {
  this.initialize = function() {

  var churchMapOptions = {
    zoom: 16,
    center: new google.maps.LatLng(49.83547,21.609142),
    mapTypeId: google.maps.MapTypeId.HYBRID
  };
  var churchMap = new google.maps.Map(document.getElementById('church-map-div'),churchMapOptions);

  var churchMarker = new google.maps.Marker({
    map: churchMap,
    draggable: false,
    position: new google.maps.LatLng(49.83547,21.609142)
  });

  var receptionMapOptions = {
    zoom: 16,
    center: new google.maps.LatLng(49.894735,21.806263),
    mapTypeId: google.maps.MapTypeId.HYBRID
  };
  var receptionMap = new google.maps.Map(document.getElementById('reception-map-div'),receptionMapOptions);

  var receptionMarker = new google.maps.Marker({
    map: receptionMap,
    draggable: false,
    position: new google.maps.LatLng(49.894735,21.806263)
  });
  }
});

whaleFactories.service('anchorSmoothScroll', function(){
    
    this.scrollTo = function(eID) {

        var startY = currentYPosition();
        var stopY = elmYPosition(eID);
        var distance = stopY > startY ? stopY - startY : startY - stopY;
        if (distance < 100) {
            scrollTo(0, stopY); return;
        }
        var speed = Math.round(distance / 100);
        if (speed >= 20) speed = 20;
        var step = Math.round(distance / 25);
        var leapY = stopY > startY ? startY + step : startY - step;
        var timer = 20;
        if (stopY > startY) {
            for ( var i=startY; i<stopY; i+=step ) {
                setTimeout("window.scrollTo(0, "+leapY+")", timer * speed);
                leapY += step; if (leapY > stopY) leapY = stopY; timer++;
            } return;
        }
        for ( var i=startY; i>stopY; i-=step ) {
            setTimeout("window.scrollTo(0, "+leapY+")", timer * speed);
            leapY -= step; if (leapY < stopY) leapY = stopY; timer++;
        }
        
        function currentYPosition() {
   
            if (self.pageYOffset) return self.pageYOffset;
      
            if (document.documentElement && document.documentElement.scrollTop)
                return document.documentElement.scrollTop;

            if (document.body.scrollTop) return document.body.scrollTop;
            return 0;
        }
        
        function elmYPosition(eID) {
            var elm = document.getElementById(eID);
            var y = elm.offsetTop;
            var node = elm;
            while (node.offsetParent && node.offsetParent != document.body) {
                node = node.offsetParent;
                y += node.offsetTop;
            } return y;
        }

    };
    
});
