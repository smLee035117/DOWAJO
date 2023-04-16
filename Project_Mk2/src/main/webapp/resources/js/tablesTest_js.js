function delete_info(BAS_NO) {
	  $.ajax({
	         url:"delete_info",
	         type:"get",
	         async:false,
	         data:{
	        	 basNo : BAS_NO
	         },
	         dataType: "json",
	            success:function(){
					location.reload();
	             },error : function () {
	                console.log('fail')
	             } 
	       });
}