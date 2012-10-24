var xhrLoader = {
	
	get: function(xhr, successCallback, failureCallback ){
	
		$.ajax({
 		 url: xhr,
 		 success: function(data) {
			successCallback(data);   		
		 },
 			error: function(error) {
			   
					if (error.status == '401'){
						alert('Your session has expired or you do not have access to the requested resource.');		
						window.location="index.cfm"
					}
					
					if (error.status == '0'){
						//alert('Wonkiness is a-happnin.');		
						//window.location="index.cfm"
					}
					
					else{
						alert('An unexpected error occured (' + error.status + ')');
						$(div).html('An unexpected error occured');
					}
					
			 		
 			 }
		});
	},


	post: function(xhr, callback){
		
		$.ajax({
 		 url: xhr,
 		 success: function(data) {
			//successCallback(data);   
			
		 if (callback) {
			 	callback(data);
			 }
					
		 	},
		error: function(error) {
	   
			if (error.status == '401'){
				alert('Your session has expired or you do not have access to the requested resource.');		
				window.location="index.cfm"
			}
			
					
					if (error.status == '0'){
						//alert('Wonkiness is a-happnin.');		
						//window.location="index.cfm"
					}
					
			else{
				alert('An unexpected error occured (' + error.status + ')');
				$(div).html('An unexpected error occured');
			}
			
		 }
		});
	},
	
		
	load: function(div, xhr, size, callback){
		
		if(size == undefined){
			var size = 'small';
		}
		
		this.clear(div);
		this.setProgress(div, size);
		this.fetch(xhr, div, callback );
	},
	
	fetch: function(xhr,div, callback){
		
		//debug.log('xhr is off and running!')
		
		$.ajax({
 		 url: xhr + "?ts/" + (new Date().getTime()).toString(),
 		 success: function(data) {

			 $(div).html("<div class='IE_Safety_wrapper'>" + data + "</div>");
			 
			 if (callback) {
			 	callback(data);
			 }
 			 },
 			error: function(error) {
   				
						
					if (error.status == '401'){
						alert('Your session has expired or you do not have access to the requested resource.');		
						window.location="index.cfm"
					}
					
							
					if (error.status == '0'){
						//alert('Wonkiness is a-happnin.');		
						//window.location="index.cfm"
					}
					
					else{
						alert('An unexpected error occured (' + error.status + ')');
						$(div).html('An unexpected error occured');
						//console.log(error);
					}
					
			 		
			
    		 		
 			 }
		});
		
	
	},
	
	clear: function(div){
		
	},
	
	setProgress: function(div, size){
		if (!size) {
			var size = 'small';
		}
		if(size == undefined){
			var size = 'small';
		}
		
		if( size == 'wide'){
			var img = 'loading...';
		}
		
		else if (size == 'medium'){
			var img = 'loading...';
		}
		
		else if (size == 'large'){
			var img = 'loading...';
		}
		
		else {
			var img = 'loading...';
		}
		$(div).html(img);
		
	},
	
	handleError: function(error){
		
		alert('this.handleerro')
	}
	
}
