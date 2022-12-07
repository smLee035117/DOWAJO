function sugClose() {
	$(".layer-popup").removeClass("show");
}
function sugDetailPop(detail) {
	  $.ajax({
	         url:"sugDetail",
	         type:"get",
	         async:false,
	         data:{
	        	 sugNo : detail
	         },
	         dataType: "json",
	            success:function(sugInfo){
	                var j = Object.values(sugInfo)  
 						$('#sugSubject').val(j[1])
					$('#sugContent').val(j[2])		  
	     	      $('#layer-popup-sug-Detail').addClass("show");  
	             },error : function () {
	                console.log('fail')
	             } 
	       });
}