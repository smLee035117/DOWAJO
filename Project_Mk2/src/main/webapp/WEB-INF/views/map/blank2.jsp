<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Blank</title>
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/blank_css.css" rel="stylesheet">
<script src="resources/vendor/jquery/jquery.min.js"></script>
<link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
</head>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=838c15c312233703a768fa54b12c4495&libraries=services"></script>
<script type="text/javascript"  src="https://momentjs.com/downloads/moment.min.js"></script>
<script type="text/javascript">
   // 외부영역 클릭 시 팝업 닫기
   $(document).mouseup(function (e){
     var LayerPopup = $(".layer-popup");
     if(LayerPopup.has(e.target).length === 0){
       LayerPopup.removeClass("show");
     }
   });
   var infowindowOpened = [];
   var userCheckToilet = [];
   var detailList= [];   
   var geocoder = null;
   var toilet = [];
   var toiletDetail = [];
   var mapContainer;
   var map;
   var reviewList = [];

$(function () {
    history.replaceState({}, null, location.pathname); 

     
     //화장실 리뷰 데이터
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
                        overrayContent : '<div>'+ j[i].reContent+
                       '&nbsp;'+j[i].reSco+
                       '&nbsp;'+moment(j[i].reRegDate).format("YY-MM-DD")+'</div>'
                  }
           }
             
             },error : function () {
                console.log('fail')
             } 
       });
     
	//화장실 상세데이터
     $.ajax({
        url:"toiletDetail",
        type:"get",
        dataType: "json",
        async:false,
           success:function(toiletInfo){        	 
            var j = Object.values(toiletInfo)
            for(var i = 0; i < j.length; i++){
            	//matchNum -> 댓글수
            	//rePageNum ->  현재댓글 페이지
     	          /*      matchNum : 0,
                          rePageNum : 0, */
                 matchNum = 0 
                 detailList[i] = {
                       number : j[i].basNo,                       
                       overrayContent : '<div style="width:500px;"><div><label id="name">'+j[i].basName+'</label></div>'+
                             '<div><span>소변기</span><label>&nbsp;'+ j[i].restUri + '</label></div>'+
                             '<div><span>대변기</span><label>&nbsp;'+ j[i].restToi + '</label></div>'+
                             '<div><span>잠금유무</span><label>&nbsp;'+ j[i].restLock + '</label></div>'+
                             '<div><span>장애인대변기</span><label>&nbsp;'+j[i].restDisToi+'</label></div>'+
                             '<div id="pop" style="overflow: auto;height:150px;line-height:30px;">'
                          }
		                 for(var a =0; a<reviewList.length;a++){                       
		                     if(detailList[i].number == reviewList[a].number){		                    	
		                          detailList[i].overrayContent += reviewList[a].overrayContent;
		                          //리뷰가 있는지 없는지 확인하는 변수
		                    	  matchNum ++;
		                     }
		                 } 
		              	  if(matchNum==0){
			            	  detailList[i].overrayContent += '리뷰가 없습니다. 리뷰를 작성해주세요'	              		  
		              	  }
		              	  
		              	  
		              detailList[i].overrayContent +='<input type="text" name="reContent" id="reContent"></textarea>'+
		              '<select id="reSco" name="reSco"><option value="5">5</option><option value="4">4</option>'+
					  '<option value="3">3</option><option value="2">2</option><option value="1">1</option>'+
					  '</select><button onclick="popReply()">이미지</button>'+
		              '<input type="hidden" id="basNo" name="basNo" value="'+j[i].basNo+'"></div></div>'              
                 }                   
            },error : function () {
               console.log('fail')
            } 
      });
    //  공공데이터 api 정보가져오기 
   $.ajax({
       url:"http://openAPI.seoul.go.kr:8088/705365615a776f6e33334f5a42516e/json/SearchPublicToiletPOIService/1/10",
       type:"get",   
       dataType : "json",
       contentType:"application/json",
       success:function(responseData){         
          var j = Object.values(responseData)
             for(var i = 0 ; i < j[0].row.length; i++){
                 matchNum = 0 
                 toilet[i] = {
                         content: '<div>'+j[0].row[i].FNAME+'</div>',
                         latlng: new kakao.maps.LatLng(j[0].row[i].Y_WGS84, j[0].row[i].X_WGS84) //위도 , 경도
                         /* number: j[0].row[i].POI_ID */
                 }
                 
                 toiletDetail[i] ={
                       content: '<div style="width:500px;"><div>'+j[0].row[i].FNAME+'</div>'+
                         '<div><span style="font-size:0.8em">화장실구분&nbsp;</span>'+j[0].row[i].ANAME+'</div>'+
                         '<div><span style="font-size:0.8em">정보수정일자&nbsp;</span>'+j[0].row[i].UPDATEDATE+'</div>',
                         latlng: new kakao.maps.LatLng(j[0].row[i].Y_WGS84, j[0].row[i].X_WGS84) //위도 , 경도                      
                 }
                 
                 for(var a =0; a<reviewList.length;a++){                       
                     if(j[0].row[i].POI_ID == reviewList[a].number){		                    	
                    	 toiletDetail[i].content += reviewList[a].overrayContent;
                          //리뷰가 있는지 없는지 확인하는 변수
                    	  matchNum ++;
                     }
                 } 
                 
              	  if(matchNum==0){
              			toiletDetail[i].content += '리뷰가 없습니다. 리뷰를 작성해주세요'	              		  
              	  }
              	  
                  toiletDetail[i].content +='<input type="text" name="reContent" id="reContent"></textarea>'+
	              '<select id="reSco" name="reSco"><option value="5">5</option><option value="4">4</option>'+
				  '<option value="3">3</option><option value="2">2</option><option value="1">1</option>'+
				  '</select><button type="button" onclick="popReply()">이미지</button>'+
	              '<input type="hidden" id="basNo" name="basNo" value="'+j[0].row[i].POI_ID +'"></div></div>' 
              
             }
         //자신의 위치 가져오는 geolocation api 
       navigator.geolocation.getCurrentPosition(showYourLocation, showErrorMsg); 
          
          function showYourLocation(position) {  // 성공했을때 실행
             var lat = position.coords.latitude, // 현재 위도
            lon = position.coords.longitude; // 현재 경도
             
        mapContainer = document.getElementById('map'), // 지도를 표시할 div  
          mapOption = {
              center: new kakao.maps.LatLng(lat, lon), // 바꿔야 하는 위도 경도
              level: 2 // 지도의 확대 레벨
          };
       map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
       geocoder = new kakao.maps.services.Geocoder();
       // 내 위치 마커 생성
       var imageSrc = 'resources/img/myMaker.png', // 마커이미지의 주소입니다    
           imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
           imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
             
       // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
           markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다

       // 마커를 생성합니다
       var myMarker = new kakao.maps.Marker({
           position: markerPosition, 
           image: markerImage // 마커이미지 설정 
       });

       // 마커가 지도 위에 표시되도록 설정합니다
       myMarker.setMap(map);  
      
       // 공공api 마커 생성
            for (var i = 0; i < toilet.length; i ++) {
                // 마커를 생성합니다
                 var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: toilet[i].latlng // 마커의 위치
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
            //마우스 클릭시 생성될 marker
                var marker3 =new kakao.maps.Marker({
                             map: map, // 마커를 표시할 지도
                          position: null // 마커의 위치
                   });
              //마우스 클릭시 주소를 보여주는 info
            var infowindow23 = new kakao.maps.InfoWindow({zindex:1});

             //마우스 클릭시 이전 마커 삭제후 새로운 마커 생성 리스너
           kakao.maps.event.addListener(map, 'click', function(mouseEvent) {  
               searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {     
                       if (status === kakao.maps.services.Status.OK && result[0].road_address != null) {
                          
                           var detailAddr = !result[0].road_address ?  result[0].road_address.address_name  : ' ';
                           detailAddr += result[0].address.address_name ;         
                        
                           var content = '<div class="bAddr">' +
                                           '<span class="title"> 주소정보 : </span>' + 
                                           detailAddr + 
                                       '</div>';
                           // 마커를 클릭한 위치에 표시합니다 
                            marker3.setPosition(mouseEvent.latLng);
                           marker3.setMap(map);

                           // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                           infowindow23.setContent(content);
                           infowindow23.open(map, marker3); 
                            $('#basAddr').val(detailAddr)  
                       $('#latlng').val(mouseEvent.latLng)
                          $('#layer-popup').addClass("show");   
                         
                       }else{
                          alert("해당지역은 건물이 아니라 등록이 불가능합니다. 다른 지역을 선택해주세요.")
                       }
                   });
           }); 
             
             <c:forEach var="toiletList" items="${toiletList}" varStatus="status">
                userCheckToilet.push({
                   content: '<div>${toiletList.basName}</div>',
                   latlng: new kakao.maps.LatLng(${toiletList.basLat},${toiletList.basLng}),
                   number: '${toiletList.basNo}'
                })
            </c:forEach>
          
          // baic_data 정보 불러와서 뿌리는 마커
            for (var i = 0; i < userCheckToilet.length; i ++) {
                // 마커를 생성합니다
                 var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: userCheckToilet[i].latlng // 마커의 위치
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
          
          //자신의 위치 가져오는 geolocation api이 실패했을때 실행
          function showErrorMsg(error) {
                 mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                   mapOption = {
                       center: new kakao.maps.LatLng(37.5657, 126.9807), // 기본지정  위도 경도
                       level: 3 // 지도의 확대 레벨
                   };
                 
                map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
               geocoder = new kakao.maps.services.Geocoder();
                     for (var i = 0; i < toilet.length; i++) {
                            // 마커를 생성합니다
                             var marker = new kakao.maps.Marker({
                                map: map, // 마커를 표시할 지도
                                position: toilet[i].latlng // 마커의 위치
                            });
                     
                            // 제목 페이지 info
                             infowindow = new kakao.maps.InfoWindow({
                                content: toilet[i].content // 인포윈도우에 표시할 내용
                            });
                            
                            //상세 페이지 info
                         
                           infowindowDetail = new kakao.maps.InfoWindow({
                              content: toilet[i].content,
                              removable: true
                           });
                           
                           //마우스 오버 후 제목 내용 나오는 리스너
                           kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                           //마우스 오버후 이동시 끄는 리스너
                           kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                           //마우스 클릭시 디테일 내용 나오는 리스너
                           kakao.maps.event.addListener(marker,'click',makeClickListener(map, marker, infowindowDetail));   

                         
                     }
                     //basic_data 정보 가져오는 for문
                   <c:forEach var="toiletList" items="${toiletList}" varStatus="status">
                      	userCheckToilet.push({
	                         content: '<div>${toiletList.basName}</div>',
	                         latlng: new kakao.maps.LatLng(${toiletList.basLat},${toiletList.basLng}),
	                         number: '${toiletList.basNo}'
                   		})
               	   </c:forEach>
                      // baic_data 정보 불러와서 뿌리는 마커
                        for (var i = 0; i < userCheckToilet.length; i ++) {
                            // 마커를 생성합니다
                             var marker = new kakao.maps.Marker({
                                map: map, // 마커를 표시할 지도
                                position: userCheckToilet[i].latlng // 마커의 위치
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
              //geolocation 실패시 띄우는 메세지      
               switch(error.code) {
                  case error.PERMISSION_DENIED:
                        alert("GPS 위치 엑세스를 거부하였습니다 - 사용하시려면 위치 엑세스를 허용해 주세요")
                  break;       
                  case error.POSITION_UNAVAILABLE:
                     alert("사용자 정보를 사용할 수 없습니다")
                  break;          
                  case error.UNKNOWN_ERROR:
                     alert("알수 없는 오류가 발생햇습니다.")
                  break;
              }
               var infowindow23 = new kakao.maps.InfoWindow({zindex:1});
               
                   //마우스 클릭시 이전 마커 삭제후 새로운 마커 생성 리스너
              kakao.maps.event.addListener(map, 'click', function(mouseEvent) {   
                 
                  searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {     
                      if (status === kakao.maps.services.Status.OK  && result[0].road_address != null) {
                           
                           var detailAddr = !result[0].road_address ?  result[0].road_address.address_name  : ' ';
                              detailAddr += result[0].address.address_name ;         
                        
                              var content = '<div class="bAddr">' +
                                              '<span class="title"> 주소정보 : </span>' + 
                                              detailAddr + 
                                          '</div>';
                              // 마커를 클릭한 위치에 표시합니다 
                               marker3.setPosition(mouseEvent.latLng);
                              marker3.setMap(map);

                              // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                              infowindow23.setContent(content);
                              infowindow23.open(map, marker3); 
                               $('#basAddr').val(detailAddr)  
                          $('#latlng').val(mouseEvent.latLng)
                             $('#layer-popup').addClass("show");   
                         
                       }else{
                          alert("해당지역은 건물이 아니라 등록이 불가능합니다. 다른 지역을 선택해주세요.")
                       }
                    });
              });      
          }
       },error : function () {
           console.log('fail')
        } 
    });

     
   //객체생성
    var marker2 = new kakao.maps.Marker({ });
   
 })

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
       $.ajax({
         url:"replyWritePost",
         type:"post",   
         dataType : "json",
         data:{
            "reContent" : $('#reContent').val(),
            "basNo" : $('#basNo').val(),
            "reSco" : $('#reSco').val()
         },
         success:function(responseData){      
            var j = JSON.parse(responseData)
               if(j==1){             
                  alert("등록이 완료되었습니다");
/*                   		  location.reload();
                  $("#pop").load(location.href + $('#pop')); */
                  $("#pop").load(location.href + ' #pop');
/*                   location.href="${pageContext.request.contextPath}/blank"  */
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
       var la = $('#latlng').val()
       var newStr = la.replace('(', ' ');
       newStr = newStr.replace(')', ' ');
       
        $.ajax({
          url:"blank",
          type:"post",   
          dataType : "json",
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
                   location.href="${pageContext.request.contextPath}/blank" 
                }else{                   
                   alert("알수없는 오류입니다")
                }
           },error : function () {
              console.log('fail')
           } 
       });
}
function emailSend() {
	 $.ajax({
         url:"mailSend",
         type:"post",   
         dataType : "json",
         data:{
            "mailSubject" : $('#mailSubject').val(),
            "mailContent" : $('#mailContent').val()
         },
         success:function(responseData){      
            var j = JSON.parse(responseData)
               if(j==1){             
                  alert("메일 전송이 성공하였습니다.")
               }else{                   
                  alert("메일 전송이 실패하였습니다.")
               }
          },error : function () {
             console.log('fail')
          } 
      });
}
</script>
<body id="page-top">
   <div class="container">
      <div class="layer-popup" id="layer-popup">
         <div class="modal-dialog">
            <div class="modal-content">
            <!-- <button onclick="bb()">xxx</button> -->
               <form name="frmModal" id="frmModal">
                  <input type="text" id="basName" name="basName" style="border:none;border-bottom:1px solid black" placeholder="이름입력"><br>      
                  <div id = "content">
                     <div id='small'>
                        <span>소변기</span>&nbsp;<input type="text" id="restToi" name="restToi" size="2" maxlength="2" style="border:none" placeholder="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                     </div>      
                     <div id='big'>
                        <span>좌변기</span>&nbsp;<input type="text" id="restUri" name="restUri" size="2" style="border:none" maxlength="2" placeholder="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                     </div>
                  </div>                        
                  <!-- <label for="content">내용</label> <input type="text" id="content" name="content" placeholder="내용입력">              -->                             
                  <div id="lock" style="width:100%; padding-top:15px;" >
                  <label style="width:30%">잠금유무</label>                  
                  있음<input type="radio" id="choice1" name="restLock" value="Y" style="width:15%" > &nbsp;
                  없음<input type="radio" id="choice2" name="restLock" value="N"  style="width:15%" checked="checked">
                  </div>
                  <br>                  
               <input type="hidden" id="latlng" name="latlng"><br>   
               <input type="hidden" id="basAddr" name="basAddr"><br>                  
               <button class="popBtn" onclick="popData()"><span id="btn-span">확인</span></button>            
               </form>
            </div>
         </div>
      </div>
   </div>
   <div id="GPS"><a onclick="location.reload()"><img id="gps-img" src="resources/img/gps_icon.png" width="60%" height="60%"></a><br><br>
   <div id="MAIL"><a onclick="emailSend()"><img id="gps-img" src="resources/img/email_image.jpg" width="60%" height="60%"></a></div></div>
   <!-- Page Wrapper -->
   <div id="clickLatlng"></div>
   <div id="wrapper">

     <!-- Sidebar -->
     <c:import url="../default/navigator.jsp"/>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
         <!-- Main Content -->
         <div id="content">

            <!-- Begin Page Content -->
            <div id="map">
               <!-- 카카오맵이 나오는 div 태그 -->
            </div>
            <!-- /.container-fluid -->

         </div>
         <!-- End of Main Content -->

      <!-- End of Content Wrapper -->
   </div>
   </div>
   <!-- End of Page Wrapper -->

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>

   <!-- Logout Modal-->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">Ã</span>
               </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready
               to end your current session.</div>
            <div class="modal-footer">
               <button class="btn btn-secondary" type="button"
                  data-dismiss="modal">Cancel</button>
               <a class="btn btn-primary" href="login">Logout</a>
            </div>
         </div>
      </div>
   </div>

   <!-- Bootstrap core JavaScript-->



   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="resources/js/sb-admin-2.min.js"></script>

</body>

</html>