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
<title> Dowajo </title>
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/css/toilet_css.css" rel="stylesheet">
<script src="resources/vendor/jquery/jquery.min.js"></script>
<link rel="icon" href="resources/img/dowajo_favicon.ico">
</head>
   <script type="text/javascript"  src="https://momentjs.com/downloads/moment.min.js"></script>
<script type="text/javascript" src="resources/js/toilet_js.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=838c15c312233703a768fa54b12c4495&libraries=services"></script>
<script type="text/javascript">
$(function () {
	
	$('.collapse show').attr('class','collapse')
	$('#collapsePages').attr('class','collapse show')
	$('#ToiletInfo').css({"color":"#5353D5","font-weight": "bold"})
	
	//get url 매개변수 삭제
    history.replaceState({}, null, location.pathname); 
    
    //리플 보여주는 함수
    showReply();
    
    //화장실 상세데이터 보여주는 함수
    showToiletDetail();
    
    //  공공데이터 api 정보가져오기 
   $.ajax({
       url:"http://openAPI.seoul.go.kr:8088/705365615a776f6e33334f5a42516e/json/SearchPublicToiletPOIService/1/1000",
       type:"get",   
       dataType : "json",
       contentType:"application/json",
       success:function(responseData){         
          var j = Object.values(responseData)          
             for(var i = 0 ; i < j[0].row.length; i++){
            	 matchNum = 0 
                 toilet[i] = {
                         content: '<div style="width:300px; padding:5px;text-align:center;">'+j[0].row[i].FNAME+'</div>',
                         latlng: new kakao.maps.LatLng(j[0].row[i].Y_WGS84, j[0].row[i].X_WGS84), //위도 , 경도
                         number: j[0].row[i].POI_ID
                 }
                 var sum = 0;
            	 var avg = 0;
                 for(var a =0; a<reviewList.length;a++){
                      if(j[0].row[i].POI_ID == reviewList[a].number){                           
                    	  sum += reviewList[a].reSco 
                    	  //리뷰가 있는지 없는지 확인하는 변수
                           matchNum ++;
                      } 
                 }
                if(sum!=0){
                	avg = (sum/matchNum).toFixed(2);
                }else {
                	avg = 0.00;
                }
                 toiletDetail[i] ={
                       content: '<div id="ditailInfoWindow"><div id="detailInfo">'+
                       '<div id="basName">'+
	                       '<div id="bas_Name">'+j[0].row[i].FNAME+'</div>'+
		              		'<div id="avg"><span id="star">★</span><span>'+ avg +'</span></div>'+
	              		'</div>'+
                         '<div id="clear"></div><div><span style="font-size:0.8em">화장실구분&nbsp;</span>'+j[0].row[i].ANAME+'</div>'+
                         '<div><span style="font-size:0.8em">정보수정일자&nbsp;</span>'+j[0].row[i].UPDATEDATE+'</div>'+
                         '<div id="overFlow"style="overflow: auto;">',
                         latlng: new kakao.maps.LatLng(j[0].row[i].Y_WGS84, j[0].row[i].X_WGS84) //위도 , 경도      
                         
                 }
                 for(var a =0; a<reviewList.length;a++){                       
                	 if(j[0].row[i].POI_ID == reviewList[a].number){                             
                         toiletDetail[i].content += reviewList[a].overrayContent;
                     }
                 }
            	 if(matchNum==0){
                     toiletDetail[i].content += '<div id="review">리뷰가 없습니다. 리뷰를 작성해주세요</div>'                         
                 }
                 toiletDetail[i].content += 
	            	'</div><div id="reply-Form">'+
		               	'<form name="replyForm" id="replyForm">'+
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
						         '<input type="hidden" id="basNo" name="basNo" value="'+j[0].row[i].POI_ID +'">'+
				                 '<input type="text" id="reply" name="reContent" size="35" maxlength="15" onkeydown="chkChar(this)" placeholder="최대등록글자는 15자입니다.">&nbsp;'+
				                 '<a id="replySend" onclick="popReply()"><img id="send-icon" src="resources/img/send_icon.png" width="8%" height="8%"></a>'+
		                 	'</div>'+
		                 '</form>'+
	              '</div>'+
	              '</div>'
                 
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
		    
		       // 내 위치 마커 생성
		       var imageSrc = 'resources/img/marker_new.png', // 마커이미지의 주소입니다    
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
		           
		       map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		       geocoder = new kakao.maps.services.Geocoder();
		       
		       // 마커가 지도 위에 표시되도록 설정합니다
		       myMarker.setMap(map);  
		       
		  	   // 공공api 마커 생성
		       publicToiletCreateMarker();
		  	   
		       //마우스 클릭시 생성될 marker
		       WriteMarker();  
	             
	             <c:forEach var="toiletList" items="${toiletList}" varStatus="status">
	                userCheckToilet.push({
	                   content: '<div style="width:300px; padding:5px;text-align:center;">${toiletList.basName}</div>',
	                   latlng: new kakao.maps.LatLng(${toiletList.basLat},${toiletList.basLng}),
	                   number: '${toiletList.basNo}'
	                })
	            </c:forEach>
	          
	         	  // baic_data 정보 불러와서 뿌리는 마커
	     		  privateCreateMarker();	         	  
	          }// 성공했을때 실행 끝
	          
          //자신의 위치 가져오는 geolocation api이 실패했을때 실행
          function showErrorMsg(error) {
                 mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                   mapOption = {
                       center: new kakao.maps.LatLng(37.5657, 126.9807), // 기본지정  위도 경도
                       level: 3 // 지도의 확대 레벨
                   };
                 
                 map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                 geocoder = new kakao.maps.services.Geocoder();
                 
	                 // 공공api 마커 생성
	  		       publicToiletCreateMarker();
	                 
	  		     //마우스 클릭시 생성될 marker
	               WriteMarker();  
	  		     
                   <c:forEach var="toiletList" items="${toiletList}" varStatus="status">
                      userCheckToilet.push({
                         content: '<div>${toiletList.basName}</div>',
                         latlng: new kakao.maps.LatLng(${toiletList.basLat},${toiletList.basLng}),
                         number: '${toiletList.basNo}'
                   })
                  </c:forEach>
                      
                      // baic_data 정보 불러와서 뿌리는 마커
                       privateCreateMarker()
                      
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
          }//자신의 위치 가져오는 geolocation api이 실패했을때 실행 끝
       },error : function () {
           console.log('fail')
        } 
    });

   
 })
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
  

</script>
<body id="page-top">
   <div class="container">
   		<!-- 화장실 장소 등록 팝업 -->
      <div class="layer-popup" id="layer-popup">
         <div class="modal-dialog">
            <div class="modal-content">
               <form name="frmModal" id="frmModal">
                  <input type="text" id="basName" name="basName" style="border:none;border-bottom:1px solid black" onkeydown="chkChar(this)" placeholder="이름입력"><br>
                  <div id = "content">
                     <div id='small'>
                        <span>소변기</span>&nbsp;<input type="text" id="restToi" name="restToi" size="2" maxlength="2" style="border:none" placeholder="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                        <br>                  
                     </div>      
                     <div id='big'>
                        <span>좌변기</span>&nbsp;<input type="text" id="restUri" name="restUri" size="2" style="border:none" maxlength="2" placeholder="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                       <br> 
                     </div>
                  </div>                                                  
                  <div id="lock" style="width:100%; padding-top:15px;" >
                  <label style="width:30%">잠금유무</label>                  
                  있음<input type="radio" id="choice1" name="restLock" value="Y" style="width:15%" > &nbsp;
                  없음<input type="radio" id="choice2" name="restLock" value="N"  style="width:15%" checked="checked">
                  </div>
                  <br>                  
               <input type="hidden" id="latlng" name="latlng"><br>   
               <input type="hidden" id="basAddr" name="basAddr"><br>                  
               <button type="button" class="popBtn" onclick="popData()"><span id="btn-span">확인</span></button>            
               </form>
            </div>
         </div>
      </div>
      
      <!--건의사항 팝업  -->
      <div class="layer-popup" id="layer-popup-sug">
         <div class="modal-dialog">
            <div class="modal-content">            
            <form id="frmSug" name="frmSug">
     	          <input type="text" id="sugSubject" name="sugSubject" style="border:none;border-bottom:1px solid black;width: 100%;" onkeydown="chkChar(this)" placeholder="제목입력"><br>   
          	     <textarea id="sugContent" name="sugContent" style="width: 100%;height: 6.25em; border: none; resize: none;" placeholder="내용입력" ></textarea><br><br><br>       
               <button type="button" class="popBtn" onclick="sugWrite()"><span id="btn-span">확인</span></button>
            </form>
            </div>
         </div>
      </div>
      
   </div>
   <div id="GPS"><a onclick="location.reload()"><img id="gps-img" src="resources/img/gps_icon.png" width="60%" height="60%"></a></div>
  		<!--  로그인시 건의사항 보여줌 -->
	  <c:if test="${sessionScope.mem_key ne null }">
   		 <div id="MAIL"><a onclick="sugPop()"><img id="gps-img" src="resources/img/email_image.jpg" width="60%" height="60%"></a></div>    
	  </c:if>
   
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

   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="resources/js/sb-admin-2.min.js"></script>

</body>

</html>