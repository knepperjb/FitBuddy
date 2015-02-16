$(document).ready(function () {	
	$('#set').hide();
	alert("To use FitFriend, allow access to your location.  Then, click 'set your location!' and get fit!")


	var cor = {};
	var locset = false;

	(function(){
	navigator.geolocation.getCurrentPosition(function(x) { cor.lat = x.coords.latitude; cor.lng = x.coords.longitude; $('#set').show(); $('#getloc').hide();});

	})();
	if (locset) {
		$('#set').show();
	}


	$(document).on('click', '#set', function (e) {
		console.log(cor)
			e.preventDefault()
			var lat = cor.lat
			var lng = cor.lng
			$.ajax({
				type: 'POST',
				url: '/set-location',
				data: {
					lat: lat,
					lng: lng
				}
			}).done(function () {
				window.location.href = '/'
				alert('location has been set!')
			})
		
	})
})

