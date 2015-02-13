 $(document).on('click', '#setgoal', function(e) {
 		$('#fitgoal').empty();
   		var goal = $('#goal').val();
   		console.log(goal)
   		e.preventDefault();
   		console.log('clicked!');
   		$.post('/set-goal', {goal: $('#goal').val()})
   		$('#fitgoal').append($('#goal').val())
   })
