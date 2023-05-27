   var matchNum;
   var infowindowOpened = [];
   var detailList= [];   
   var shelter = [];
   var shelterDetail = [];
   var mapContainer;
   var map;
   var reviewList = [];
   var cnt;
 function publicShelterCreateMarker(){
	 // 공공 구호소 api 마커 생성
	 var shelterMarkerImageSrc = 'resources/img/shelter_marker2.png', // 마커이미지의 주소입니다    
         shelterMarkerImageSize = new kakao.maps.Size(35, 42), // 마커이미지의 크기입니다
         shelterMarkerImageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
     var shelterMarkerImage = new kakao.maps.MarkerImage(shelterMarkerImageSrc, shelterMarkerImageSize, shelterMarkerImageOption);
      
	            for (var i = 0; i < shelter.length; i ++) {
	                // 마커를 생성합니다
	                 var marker = new kakao.maps.Marker({
	                    map: map, // 마커를 표시할 지도
	                    position: shelter[i].latlng, // 마커의 위치
	                    image: shelterMarkerImage
	                });
	         
	                  // 제목 페이지 info
	                  infowindow = new kakao.maps.InfoWindow({
	                     content: shelter[i].content // 인포윈도우에 표시할 내용
	                 });
	                 
	                 //상세 페이지 info
	                infowindowDetail = new kakao.maps.InfoWindow({
	                   content: shelterDetail[i].content,
	                   removable: true
	                });
	            
	                //마우스 오버 후 제목 내용 나오는 리스너
	                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	                //마우스 오버후 이동시 끄는 리스너
	                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	                //마우스 클릭시 디테일 내용 나오는 리스너
	                kakao.maps.event.addListener(marker,'click',makeClickListener(map, marker, infowindowDetail));   	                
	            }
}

 function showReply(){
	  $.ajax({
         url:"reviewSelect",
         type:"get",
         async:false,
         dataType: "json",
            success:function(reviewInfo){
             var j = Object.values(reviewInfo)
             for(var i = 0; i < j.length; i++){	 	
                  reviewList[i] = {
                        number : j[i].basNo,                       
                        overrayContent : '<div id="review"><span id="contentView">'+ j[i].reContent+'</span>'+
                        '<span id="dateView">'+moment(j[i].reRegDate).format("YY-MM-DD")+'</span></div>'
                  }
           }
             
             },error : function () {
                console.log('fail')
             } 
       });
}
 
    // 외부영역 클릭 시 팝업 닫기
   $(document).mouseup(function (e){
     var LayerPopup = $(".layer-popup");
     if(LayerPopup.has(e.target).length === 0){
       LayerPopup.removeClass("show");
     }
   });
   
 //마우스 오버 후 제목 내용 나오는 리스너                
   function makeOverListener(map, marker, infowindow) {
       return function() {
           infowindow.open(map, marker);
           infowindowOpened[0] = infowindow;
       };
   }
   
   //마우스 클릭시 디테일 내용 나오는 리스너
   function makeClickListener(map, marker, infowindow) {        
         return function() {   
           //오버된 도중에 클릭시 오버 삭제
             if(infowindowOpened != null){
                for(var a = 0; a < infowindowOpened.length ; a++){
                   infowindowOpened[a].close()
                }
             }
            infowindow.open(map, marker);
              infowindowOpened[1] = infowindow;
              
         };      
   }
   
   //마우스 오버후 이동시 끄는 리스너
   function makeOutListener(infowindow) {
        return function() {
           infowindow.close(); 
       }; 
   }
   
  function replyShow(){
     $('#layer-popup').addClass("show");  
  }
 
  
  function popReply() {
	 if(!$('#reply').val()){		
		$('#reply').focus();
		alert("이름과 전화번호를 입력해주세요");		
		return;
	  }
	   var formData = $("#replyForm").serialize(); 	    
		   $.ajax({
		        url:"survivalWritePost",
		        type:"post",   
		        dataType : "json",
		        async:false,
		        data:formData,
		        success:function(responseData){      
		           var j = JSON.parse(responseData)
		              if(j==1){             
		                 alert("등록이 완료되었습니다")
		                  location.reload();
		              }else if(j==2){                   
		                 alert("최대 수용인원입니다. 더이상 작성하실 수 없습니다.")
		                 location.reload();
		              }else {                   
		                 alert("알수없는 오류입니다")
		              }
		         },error : function () {
		            console.log('fail')
		         } 
		     });
	 
	 
    
}
   
   function sugPop() {
	      $('#layer-popup-sug').addClass("show");   
	}
   
	function sugWrite() {
	    $.ajax({
	         url:"sugWrite",
	         type:"post",   
	         dataType : "json",
	         data: $('#frmSug').serialize(),
	         success:function(responseData){      
	            var j = JSON.parse(responseData)
	               if(j==1){             
	                  alert("건의사항 작성이 완료되었습니다.")
	                  location.reload();
	               }else{                   
	                  alert("건의사항 작성이 실패하였습니다.")
	                  location.reload();
	               }
	          },error : function () {
	             console.log('fail')
	          } 
	      });
	}
	
  //특수문자 입력제한 05/27 
  function chkChar(obj){
    var RegExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;	//정규식 구문
    if (RegExp.test(obj.value)) {
      // 특수문자 모두 제거    
      obj.value = obj.value.replace(RegExp , '');
    }
  }   