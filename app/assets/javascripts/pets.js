// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(
	function(){
		$('.myclass').hide();
	
		$('.text').hover(function(){
			$(this).css('color','purple');
			$(this).css('cursor','pointer');
		});
		$('.text').click(function(){
			$('.myclass').toggle();
		});
	
		$('.myclass').hover(function(){
			$(this).css('background','green');
		});
	}
);

	
	