 $(document).on('click', '#setgoal', function(e) {
 		$('#fitgoal').empty();
   		var goal = $('#goal').val();
   		console.log(goal)
   		e.preventDefault();
   		console.log('clicked!');
   		$.post('/set-goal', {goal: $('#goal').val()})
   		$('#fitgoal').append($('#goal').val())
   });

$(document).on('click', '#setexp', function(e) {
 		$('#level').empty();
   		var exp = $('#experience').val();
   		console.log(goal)
   		e.preventDefault();
   		console.log('clicked!');
   		$.post('/set-experience', {exp: exp})
   		$('#level').append($('#experience').val())
   });
