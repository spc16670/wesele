function initialize() {
 var churchMapOptions = {
   zoom: 16,
   center: new google.maps.LatLng(49.83547,21.609142),
   mapTypeId: google.maps.MapTypeId.HYBRID
 };
 var churchMap = new google.maps.Map(document.getElementById('church-map-div'),churchMapOptions);
 
 var marker = new google.maps.Marker({
   map: churchMap,
   draggable: false,
   position: new google.maps.LatLng(49.83547,21.609142)
 });
}

google.maps.event.addDomListener(window, 'resize', initialize);
google.maps.event.addDomListener(window, 'load', initialize)
