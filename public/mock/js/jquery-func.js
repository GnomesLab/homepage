$(document).ready(function() {
	$('#navigation li').hover(
		function(){
			var sub = $(this).find('.dd:eq(0)');
			if( sub.length == 0 ) return false;
			
			
			if($(this).parent().parent().hasClass('dd-test')) {
				
			}
			
			sub.show();
			var t = (parseInt(sub.css('top').replace('px', '')) - 5);
			sub.hide();
			var new_t = t + 5;
			
			sub
				.css({ 'top' : t+'px' })
				.animate({ 'top' : new_t + 'px', opacity : 'show' }, 200, function(){
					$(this).css({ 'top' : new_t + 'px' });
				 });
				
				
			$(this).find('a:eq(0)').addClass('hover');
		},
		function(){
			var sub = $(this).find('.dd:eq(0)');
			
			sub.hide();
			$(this).find('a:eq(0)').removeClass('hover');
		}
	);
	
	
	$("#slider-holder ul").jcarousel({
		scroll: 1,
		auto: 5,
		wrap: 'both',
		initCallback: _init_slider,
		itemFirstInCallback: _set_slide,
		buttonNextHTML: null,
		buttonPrevHTML: null
	});
	
	$(".project-slider ul").jcarousel({
		scroll: 1,
		wrap: 'both',
		initCallback: _init_project_slider,
		buttonNextHTML: null,
		buttonPrevHTML: null
	});

	
	$('.archives .toggle').click(function(){
		var ul = $(this).parent().find('ul:eq(0)');
		
		if( ul.length == 0 ) 
			return false;
			
		if( ul.css('display') == 'none' ) {
			ul.fadeIn();
			$(this).html('[ - ]');
		}else {
			ul.hide();
			$(this).html('[ + ]');
		}
		
		return false;
	});
	
	$('.archives .active .toggle').html('[ - ]');
	
	$('.field')
		.focus( function(){ $(this).addClass('field-focus'); })
		.blur( function(){ $(this).removeClass('field-focus'); })
	
	
	/** Validation **/
	
	$('.validate-form').submit(function(){
		var form = $(this);
		form.find('.required').removeClass('field-error');
		
		var field, v, id, msg;
		var error = false;
		
		form.find('.required').each(function(){
			field = $(this);
			v = $(this).val();
			id = $(this).attr('id');
			
			if( $(this).hasClass('valid-email') ){
				if( /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(v) == false ) {
					error = true;
					return false;
				}
			}else {
				if( v == '' ){
					error = true;
					return false;
				}
			}
		});
		
		form.find('.field').removeClass('field-focus');
		
		if( error ) {
			field.focus();
			field.addClass('field-error');
			msg = $("label[for='"+id+"']").attr('title');
			show_error(msg);
			
		}else {
			hide_error();
			var data = {}
			
			form.find('.field').each(function(){
				data[ $(this).attr('name') ] = $(this).val();
			});
			
			form.find('.field').attr({ 'value': '' });
			$('#message-field').attr({ 'valie' : 'loading...' });
			
			$.post('send.php', data, function(){
				form.find('.msg-thanks').fadeIn(function(){
					
					$('#message-field').attr({ 'valie' : '' });
					window.setTimeout(function(){
						form.find('.msg-thanks').fadeOut();
					}, 7000);
					
				});
			});
		}
		
		return false;
	});
		
});


function _init_slider(carousel) {
	$('#slider .slider-controls a').bind('click', function() {
		var index = $(this).parent().find('a').index(this) + 1;
		carousel.scroll( index );
		return false;
	});
	
	$('#slider .slider-nav .next').bind('click', function() {
		carousel.next();
		return false;
	});
	
	$('#slider .slider-nav .prev').bind('click', function() {
		carousel.prev();
		return false;
	});
};

function _set_slide(carousel, item, idx, state) {
	var index = idx - 1;
	
	$('#slider .slider-controls a').removeClass('active');
	$('#slider .slider-controls a').eq(index).addClass('active');
};

function _init_project_slider(carousel) {
	$('.project-slider .slider-nav .next').bind('click', function() {
		carousel.next();
		return false;
	});
	
	$('.project-slider .slider-nav .prev').bind('click', function() {
		carousel.prev();
		return false;
	});
};

function trace( s ) {
	$('#test').html( $('#test').html() + ' ' + s.toString() );
}

function show_error( message ) {
	$('.msg-error span').html( message );
	$('.msg-error').fadeIn();
}
function hide_error() {
	$('.msg-error').hide();
}