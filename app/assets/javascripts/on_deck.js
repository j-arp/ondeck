jQuery(document).ready(function() {

	$('.item-complete').live("click", function(){
		//alert($(this).attr('id') + ' :: ' + $(this).is(":checked"));
		var id = $(this).attr('id');
		isChecked = $(this).is(":checked");
		
		if(isChecked){
			var url = '/checkoff/'+ id;
			}
		else{
			var url = '/uncheck/'+ id;
		}
		
		xhrLoader.post(url, checkIt);
		//alert(url);
		
		function checkIt(data){
			refresh();
		}
		
	})
	
	
	$("input.new-item-submit").click(function(){
		$("form").fadeTo(.5, 'slow');
	})
	
	
	$("#new_item").bind("ajax:success", refresh ).bind("ajax:error", function(){alert('error')});
	
	
	
	function refresh(){
			$('.new-item-input').val('');
			
			xhrLoader.load($('div.item-list-target#upcoming'), '/checklist/status/2');
			xhrLoader.load($('div.item-list-target#active'), '/checklist/status/3');
			xhrLoader.load($('div.item-list-target#complete'), '/checklist/status/4');
	}
	
	refresh();

	$(".toggle-detials, span.title-text").live("click", function(){
		var id = $(this).attr('id');
		var details = $(this).parent().next('.details');
		//console.log(details);
		details.slideToggle();
	});


});