   var matchNum;
   var infowindowOpened = [];
   var userCheckWIFI = [];
   var wifi= [];
   var wifiDetail= [];   
   var geocoder = null;
   var mapContainer;
   var map;
   var reviewList = [];
function privateCreateMarker(){
		 var shelterMarkerImageSrc = 'resources/img/wifi_marker.png', // 마커이미지의 주소입니다    
         shelterMarkerImageSize = new kakao.maps.Size(35, 42), // 마커이미지의 크기입니다
         shelterMarkerImageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    	 var shelterMarkerImage = new kakao.maps.MarkerImage(shelterMarkerImageSrc, shelterMarkerImageSize, shelterMarkerImageOption);
	     for (var i = 0; i < userCheckWIFI.length; i ++) {
	                // 마커를 생성합니다
	                 var marker = new kakao.maps.Marker({
	                    map: map, // 마커를 표시할 지도
	                    position: userCheckWIFI[i].latlng, // 마커의 위치
	                    image: shelterMarkerImage
	                });
	                  // 제목 페이지 info
	                  infowindow = new kakao.maps.InfoWindow({
	                  content: userCheckWIFI[i].content // 인포윈도우에 표시할 내용
	                 });
	        
	                //상세 페이지 info     	                	
	                 for(var v = 0; v < wifiDetail.length; v++){											
	                    if(wifiDetail[v].number == userCheckWIFI[i].number){
	                      infowindowDetail = new kakao.maps.InfoWindow({
	                          content: wifiDetail[v].content, 
	                          removable: true
	                      });
	
	                    }
	                 } 
	                //마우스 오버 후 제목 내용 나오는 리스너
	                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	                //마우스 오버후 이동시 끄는 리스너
	                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	                //마우스 클릭시 디테일 내용 나오는 리스너
	                kakao.maps.event.addListener(marker,'click',makeClickListener(map, marker, infowindowDetail));              
	            }               
}
function WriteMarker(){
	         //마우스 클릭시 생성될 marker
                     var marker2 =new kakao.maps.Marker({
                               map: null, // 마커를 표시할 지도
                               position: null // 마커의 위치
                        });
                   //마우스 클릭시 주소를 보여주는 info
  					 var infowindow23 = new kakao.maps.InfoWindow({zindex:1});
                   
                  //마우스 클릭시 이전 마커 삭제후 새로운 마커 생성 리스너
                kakao.maps.event.addListener(map, 'click', function(mouseEvent) {  
                    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {     
                            if (status === kakao.maps.services.Status.OK && result[0].road_address != null) {
								$('#wifiName').val('');
								$('#wifiPw').val('');
								$('#basName').val('');                              
                                var detailAddr = !result[0].road_address ?  result[0].road_address.address_name  : ' ';
                                detailAddr += result[0].address.address_name ;                                      
                                var content = '<div class="bAddr" style="width:300px; padding:5px;text-align:center;" >' +
                                                '<span class="title" > 주소정보 : </span>' + 
                                                detailAddr + 
                                            '</div>';
                                // 마커를 클릭한 위치에 표시합니다 
                                marker2.setPosition(mouseEvent.latLng);
                                marker2.setMap(map);

                                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                infowindow23.setContent(content);
                                infowindow23.open(map, marker2);  
                                 $('#basAddr').val(detailAddr)  
                            $('#latlng').val(mouseEvent.latLng)
                               $('#layer-popup').addClass("show");   
                              
                            }else{
                               alert("해당지역은 건물이 아니라 등록이 불가능합니다. 다른 지역을 선택해주세요.")
                            }
                        });
                }); 
}

 function showReply(){
	  $.ajax({
         url:"reviewSelect",
         type:"get",
         async:false,
         dataType: "json",
            success:function(toiletInfo){
             var j = Object.values(toiletInfo)
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
   
   
   function searchDetailAddrFromCoords(coords, callback) {
       // 좌표로 법정동 상세 주소 정보를 요청합니다
       geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   }
   
   
   
  function replyShow(){
     $('#layer-popup').addClass("show");  
  }
 
  
  function popReply() {
	   var formData = $("#replyForm").serialize(); 
      $.ajax({
        url:"replyWritePost",
        type:"post",   
        dataType : "json",
        async:false,
        data:formData,
        success:function(responseData){      
           var j = JSON.parse(responseData)
              if(j==1){             
                 alert("등록이 완료되었습니다")
                  location.reload();
              }else{                   
                 alert("알수없는 오류입니다")
              }
         },error : function () {
            console.log('fail')
         } 
     });
}
  
   //장소 등록 
   function popData() {
    if(!$('#basName').val()){		
		$('#basName').focus();
		alert("장소명을 입력해주세요");		
		return;
	  }else if(!$('#wifiName').val()){
		$('#wifiName').focus();
		alert("와이파이 ID를 입력해주세요");		
		return;
	  }else if(!$('#wifiPw').val()){
		$('#wifiPw').focus();
		alert("비밀번호를 입력해주세요");		
		return;
	  }
       var la = $('#latlng').val()
       var newStr = la.replace('(', ' ');
       newStr = newStr.replace(')', ' ');
        $.ajax({
          url:"wifiPop",
          type:"post",   
          dataType : "json",
          async:false,
          data:{
             "basName" : $('#basName').val(),
             "wifiName" : $('#wifiName').val(),
             "wifiPw" : $('#wifiPw').val(),
             "latlng" : newStr,
             "basAddr" : $('#basAddr').val()          
          },
          success:function(responseData){      
             var j = JSON.parse(responseData)             
                if(j==1){             
                   alert("등록이 완료되었습니다")
                  location.reload();
                }else{                   
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
   
   // 12/06 
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