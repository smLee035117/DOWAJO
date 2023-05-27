   var matchNum;
   var infowindowOpened = [];
   var userCheckToilet = [];
   var detailList= [];   
   var geocoder = null;
   var toilet = [];
   var toiletDetail = [];
   var mapContainer;
   var map;
   var reviewList = [];
   var lock;
   var status;
 function  publicToiletCreateMarker(){
	 var toiletMarkerImageSrc = 'resources/img/toilet_marker.png', // 마커이미지의 주소입니다    
         toiletMarkerImageSize = new kakao.maps.Size(35, 42), // 마커이미지의 크기입니다
         toiletMarkerImageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
     var toiletMarkerImage = new kakao.maps.MarkerImage(toiletMarkerImageSrc, toiletMarkerImageSize, toiletMarkerImageOption);
   
	
    // 공공api 마커 생성
               for (var i = 0; i < toilet.length; i ++) {
                   // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                       map: map, // 마커를 표시할 지도
                       position: toilet[i].latlng, // 마커의 위치
                       image: toiletMarkerImage
                   });
            
                     // 제목 페이지 info
                     infowindow = new kakao.maps.InfoWindow({
                        content: toilet[i].content // 인포윈도우에 표시할 내용
                    });
                    
                    //상세 페이지 info
                   infowindowDetail = new kakao.maps.InfoWindow({
                      content: toiletDetail[i].content,
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
function privateCreateMarker(){
       	 var toiletMarkerImageSrc = 'resources/img/toilet_marker.png', // 마커이미지의 주소입니다    
         toiletMarkerImageSize = new kakao.maps.Size(35, 42), // 마커이미지의 크기입니다
         toiletMarkerImageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
   		 var toiletMarkerImage = new kakao.maps.MarkerImage(toiletMarkerImageSrc, toiletMarkerImageSize, toiletMarkerImageOption);
   
        for (var i = 0; i < userCheckToilet.length; i ++) {
                   // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                       map: map, // 마커를 표시할 지도
                       position: userCheckToilet[i].latlng, // 마커의 위치
                       image: toiletMarkerImage
                   });
                     // 제목 페이지 info
                     infowindow = new kakao.maps.InfoWindow({
                        content: userCheckToilet[i].content // 인포윈도우에 표시할 내용
                    });
           
                   //상세 페이지 info
                    for(var v = 0; v < detailList.length; v++){
                       if(detailList[v].number == userCheckToilet[i].number){
                         infowindowDetail = new kakao.maps.InfoWindow({
                             content: detailList[v].overrayContent, 
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
								$('#restToi').val('');                    
								$('#restUri').val('');    
								$('#basName').val('');                
                                var detailAddr = !result[0].road_address ?  result[0].road_address.address_name  : ' ';
                                detailAddr += result[0].address.address_name ;                                      
                                var content = '<div class="bAddr" style="width:300px; padding:5px;text-align:center;">' +
                                                '<span class="title"> 주소정보 : </span>' + 
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
               var score;
                
                switch(j[i].reSco){
                case 1:
                   score = '★';
                   break;
            case 2:
               score = '★★';
                   break;
            case 3:
               score = '★★★';
                  break;
            case 4:
               score = '★★★★';
                  break;
            case 5:
               score = '★★★★★';
                  break;
                
                } 
                  reviewList[i] = {
                  reSco : j[i].reSco,
                        number : j[i].basNo,                       
                        overrayContent : '<div id="review"><span id="contentView">'+ j[i].reContent+'</span>'+
                        '<span id="dateView">'+moment(j[i].reRegDate).format("YY-MM-DD")+'</span>'+
                        '<span id="scoreView">'+score+'</span></div>'
                  }
           }
             
             },error : function () {
                console.log('fail')
             } 
       });
}
 function showToiletDetail(){
        $.ajax({
        url:"toiletDetail",
        type:"get",
        dataType: "json",
        async:false,
           success:function(toiletInfo){
            var j = Object.values(toiletInfo)
            for(var i = 0; i < j.length; i++){
               matchNum=0;
                   var sum = 0;
                   var avg = 0;
                   for(var a =0; a<reviewList.length;a++){
                        if(j[i].basNo == reviewList[a].number){
                             sum += reviewList[a].reSco 
                             matchNum ++;
                        }
                    }
                    if(sum!=0){
                      avg = (sum/matchNum).toFixed(2);
                   }else {
                      avg = 0.00;
                   }
                   if( j[i].restLock == 'N'){
                   	lock = '열림'
                   }else {
                   	lock = '잠김'
                   }        
                   if( j[i].restStatus == 'Clean'){
                   	status = '깨끗함'
                   }else {
                   	status = '더러움'
                   }        
                 detailList[i] = {
                       number : j[i].basNo,                       
                       overrayContent : '<div id="ditailInfoWindow">'+
                             '<div id ="detailInfo">'+
                             '<div id="basName">'+
                                '<div id="bas_Name">'+j[i].basName+'</div>'+
                             '<div id="avg"><span id="star">★</span><span>'+ avg +'</span></div>'+
                             '</div>'+
                              '<div id="clear"></div><div><span id="basAddr">주소</span><label id="bas_addr">&nbsp;'+ j[i].basAddr + '</label></div>'+
                               '<div id="restContent">'+
                                  '<div class="restContent1"><span id="rest-Uri">소변기</span><label id="bas_content">&nbsp;'+ j[i].restUri + '</label></div>'+
                                  '<div class="restContent1"><span id="rest-Toi">대변기</span><label id="bas_content">&nbsp;'+ j[i].restToi + '</label></div>'+
                                  '<div class="restContent2"><span id="rest-Lock">잠금유무</span><label id="bas_content">&nbsp;'+ lock + '</label></div>'+
                                  '<div class="restContent2"><span id="rest-Status">청결상태</span><label id="bas_content">&nbsp;'+status + '</label></div>'+
                               '</div>'+
                             '</div>'+
                             '<div id="overFlow"style="overflow: auto;">'
                 }
                   matchNum = 0;
                    for(var a =0; a<reviewList.length;a++){                       
                        if(detailList[i].number == reviewList[a].number){
                             detailList[i].overrayContent += reviewList[a].overrayContent    
                             //리뷰가 있는지 없는지 확인하는 변수
                             matchNum ++;
                        }
                    }
                 if(matchNum==0){
                     detailList[i].overrayContent += '<div id="review">리뷰가 없습니다. 리뷰를 작성해주세요</div>'                         
                    } 
                 detailList[i].overrayContent += 
                  '</div><div id="reply-Form">'+
                     '<form name="      var formData = $("#join_form").serialize(); " id="replyForm">'+
                      '<div id="reviewSend">'+
                          '<span id="form_title">리뷰작성</span>'+
                         '<div id="selectStart">'+
                                '<fieldset>'+
                                  '<input type="radio" name="reSco" value="5" id="rate1" checked><label for="rate1">★</label>'+
                                 '<input type="radio" name="reSco" value="4" id="rate2"><label for="rate2">★</label>'+
                                  '<input type="radio" name="reSco" value="3" id="rate3"><label for="rate3">★</label>'+
                                  '<input type="radio" name="reSco" value="2" id="rate4"><label for="rate4">★</label>'+
                                  '<input type="radio" name="reSco" value="1" id="rate5"><label for="rate5">★</label>&nbsp;'+
                                  '<span class="selectText">별점을 선택해주세요</span>'+
                               '</fieldset>'+
                        '</div><br>'+
                          '<input type="text" id="reply" name="reContent" size="35" maxlength="15" placeholder="최대등록글자는 15자입니다.">&nbsp;'+
                          '<input type="hidden" id="basNo" name="basNo" value="'+j[i].basNo+'">'+
                          '<a id="replySend" onclick="popReply()"><img id="send-icon" src="resources/img/send_icon.png" width="8%" height="8%"></a>'+
                       '</div>'+
                    '</form>'+
                 '</div>'+
                 '</div>'
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
	
	 if(!$('#reply').val()){		
		$('#reply').focus();
		alert("리뷰를 입력해주세요");		
		return;
	  }
	  
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
		alert("이름을 입력해주세요");		
		return;
	  }else if(!$('#restToi').val()){
		$('#restToi').focus();
		alert("소변기를 입력해주세요");		
		return;
	  }else if(!$('#restUri').val()){
		$('#restUri').focus();
		alert("대변기를 입력해주세요");		
		return;
	  }
       var la = $('#latlng').val()
       var newStr = la.replace('(', ' ');
       newStr = newStr.replace(')', ' ');
        $.ajax({
          url:"toilet",
          type:"post",   
          dataType : "json",
          async:false,
          data:{
             "basName" : $('#basName').val(),
             "restToi" : $('#restToi').val(),
             "restUri" : $('#restUri').val(),
             "restLock" :   $('input[name="restLock"]:checked').val(),
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
	
	 if(!$('#sugSubject').val()){		
		$('#sugSubject').focus();
		alert("제목을 입력해주세요");		
		return;
	  }else if(!$('#sugContent').val()){
		$('#sugContent').focus();
		alert("내용을 입력해주세요");		
		return;
	 }
	  
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
   