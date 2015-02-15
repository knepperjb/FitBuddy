var mapOptions = {
                center: { lat: 34, lng: 45},
                zoom: 10
              };
              console.log(mapOptions);

              // var setMap = function() {
              // 	google.maps.event.trigger(map, "resize");
              // }
         
      // function initialize() {
        $(document).on('click', '#mapbutton', function(e) {
          e.preventDefault()
          $.get('/find-friends', function(data){
            console.log(data)
            mapOptions.center.lat = data[0].lat;
            mapOptions.center.lng = data[0].lng;

          setTimeout(function () {
            var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
            data.forEach(function(x) {
              // console.log(x);
              var marker = new google.maps.Marker({
                position: { lat: x.lat, lng: x.lng},
                map: map,
                title: x.username
              })

              var info = new google.maps.InfoWindow({
              content: '<img src='+ x.image +'></img>' + '<br>' + '<b>' + x.username + '</b>' + '<br>' + x.goal,
              maxWidth: 100
              });
               google.maps.event.addListener(marker, 'mouseover', function(){
               info.open(map, marker)
               });
               google.maps.event.addListener(marker, 'mouseout', function() {
               info.close();
               })
               google.maps.event.addListener(marker, 'click', function() {
                window.location.href = '/' + x.username
               })
      });
        }, 1000);
   //      	$('#mapModal').on('shown', function() {
			// google.maps.event.trigger(map, 'resize');
			// })
          })
})