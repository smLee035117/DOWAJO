function delete_info(basNo) {
	  $.ajax({
	         url:"delete_info",
	         type:"get",
	         async:false,
	         data:{
	        	 basNo : basNo
	         },
	         dataType: "json",
	            success:function(){
					location.reload();
	             },error : function () {
	                console.log('fail')
	             } 
	       });
}