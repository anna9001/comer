/*
function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "https://code.jquery.com/jquery-3.2.1.min.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}*/

var service=(function(){
	
	function getList(param,callback,error){

		var pageNum=param.pageNum||1;
		var category=param.category||null;
		var address1=param.address1||null;
		var url="/comer/restaurant/page/"+pageNum+"/category/"
		+category+"/address1/"+address1;

		$.getJSON(url,function(data){		
					if(callback) callback(data);			
				}).fail(function(xhr,status,error){
					if(error)alert(error);
			});	
		
	}
	
	function add(resform,callback,error){
		
		$.ajax({
			type:'POST',
			url:'writeRestaurant_ok',
			data:resform,
			headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
			contentType : false,
	        processData : false,
			success:function(result,status,xhr){
				if(callback) callback(result);
			},
			error:function(xhr,status,er){
				if(error) error(er);
			}
		});	
	}
	function remove(no,callback,error){
		$.ajax({
			type:'delete',
			url:'/comer/restaurant/no/'+no,
			headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
			success:function(result,status,xhr){
				if(callback) callback(result);
			},
			error:function(xhr,status,er){
				if(error) error(er);
			}
		});
	}
	
	return{
		getList:getList,
		add:add,
		remove:remove
	};
	
})();