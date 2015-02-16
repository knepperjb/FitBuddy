$(document).on('click', '#locbutton', function(e) {
   		$('#found').hide();
   		var coor = {}
   		$('#setlocal').hide();

   		
		navigator.geolocation.getCurrentPosition(function(x) {console.log(x.coords); coor.lat = x.coords.latitude; coor.lng = x.coords.longitude; $('#found').show(); $('#setting').hide(); $('#setlocal').show()});

		$('#setlocal').on('click', function() {
				$('#setting').show();
				$.ajax({
				type: 'POST',
				url: '/set-location-button',
				data: {
					lat: coor.lat,
					lng: coor.lng
				}
			}).success(function() {
				console.log('success')
			})

		})

   })

