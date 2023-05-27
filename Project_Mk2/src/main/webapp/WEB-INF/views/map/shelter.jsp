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
<link href="resources/css/shelter_css.css" rel="stylesheet">
<script src="resources/vendor/jquery/jquery.min.js"></script>
<link rel="icon" href="resources/img/dowajo_favicon.ico">
</head>
   <script type="text/javascript"  src="https://momentjs.com/downloads/moment.min.js"></script>
<script type="text/javascript" src="resources/js/shelter_js.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=838c15c312233703a768fa54b12c4495&libraries=services"></script>
<script type="text/javascript">
$(function () {
	$('.collapse show').attr('class','collapse')
	$('#collapsePages').attr('class','collapse show')
	$('#ShelterInfo').css({"color":"#5353D5","font-weight": "bold"})
	
	//get url 매개변수 삭제
    history.replaceState({}, null, location.pathname); 
    
    //리플 보여주는 함수
    showReply();
    
    //화장실 상세데이터 보여주는 함수
    //showToiletDetail();
          //  공공주차장 데이터 api 정보가져오기 
          $.ajax({
              url:"http://openapi.seoul.go.kr:8088/754c766f48666967313036634d746a6f/json/TlEtqkP/1/1000",
              type:"get",   
              dataType : "json",
              contentType:"application/json",
              success:function(responseData){         
                 var j = Object.values(responseData)
                    for(var i = 0 ; i < j[0].row.length; i++){
                   	 matchNum = 0 
                        shelter[i] = {
                                content: '<div style="width:300px; padding:5px;text-align:center;">'+j[0].row[i].EQUP_NM+'</div>',
                                latlng: new kakao.maps.LatLng(j[0].row[i].YCORD, j[0].row[i].XCORD), //위도 , 경도
                                number: 'SLT'+(j[0].row[i].R_SEQ_NO).padStart(7,'0')
                        }
                        
                        for(var a =0; a<reviewList.length;a++){
                             if(shelter[i].number == reviewList[a].number){
                            	 //리뷰가 있는지 없는지 확인하는 변수
                                  matchNum ++;
                             } 
                        }
                   	 var maxCount = Math.floor((j[0].row[i].SECT_EQUP)/4);
                       shelterDetail[i] ={
                              content: '<div id="ditailInfoWindow"><div id="detailInfo">'+
                              '<div id="shelterName">'+
       	                       '<div id="shelter_Name">'+j[0].row[i].EQUP_NM+'</div>'+
       		              		'<div id="people"><span id="emoji"><img src="resources/img/emoji.png" width="30px" height="35px"/></span><span id="peopleCount">'+ matchNum +'</span></div>'+
       	              		'</div>'+
                                '<div id="clear"></div><div><span id="infoContent">주소&nbsp;</span><label id="info_content">'+j[0].row[i].LOC_SFPR_A+'</label></div>'+
                                '<div><span id="infoContent">수용인원&nbsp;</span><label id="info_content">'+maxCount+'</label>명</div>'+
                                '<details id="replyDetail"><summary> 생존신고 </summary><div id="overFlow"style="overflow: auto;">',
                                latlng: new kakao.maps.LatLng(j[0].row[i].YCORD, j[0].row[i].XCORD) //위도 , 경도      
                                
                        }
                        for(var a =0; a<reviewList.length;a++){                       
                       	 if(shelter[i].number == reviewList[a].number){                             
                       		shelterDetail[i].content += reviewList[a].overrayContent;
                            }
                        }
                   	 if(matchNum==0){
                   		shelterDetail[i].content += '<div id="review">등록된 인원이 없습니다.</div>'                         
                        }
                   var a ='SLT'+(j[0].row[i].R_SEQ_NO).padStart(7,'0')
                   		shelterDetail[i].content += 
       	            	'</div><div id="reply-Form">'+
       		               	'<form name="replyForm" id="replyForm">'+
       			                '<div id="reviewSend">'+
       				                 '<span id="form_title">생존신고</span>'+
       					             '<div id="selectStart">'+
       						         '</div><br>'+
       						         '<input type="hidden" id="maxCount" name="maxCount" value="'+maxCount+'">'+
       						         '<input type="hidden" id="basNo" name="basNo" value="'+a+'">'+
       						         '<input type="hidden" id="count" name="count" value="'+a+'">'+
       						      	 '<input type="hidden" id="reSco" name="reSco" value="0">'+
       				                 '<input type="text" id="reply" name="reContent" size="35" maxlength="20" onkeydown="chkChar(this)" placeholder="이름과 전화번호를 적어주세요">&nbsp;'+
       				                 '<a id="replySend" onclick="popReply()"><img id="send-icon" src="resources/img/send_icon.png" width="8%" height="8%"></a>'+
       		                 	'</div>'+
       		                 '</form>'+
       	              '</div></details>'+
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
		       
		       // 마커가 지도 위에 표시되도록 설정합니다
		       myMarker.setMap(map);  
		       
		  	   // 공공주차장api 마커 생성
		  	   publicShelterCreateMarker();

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
                 
	                 // 공공 주차장 api 마커 생성
	  		       publicShelterCreateMarker();
	                 
	  		
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
      <!--건의사항 팝업  -->
      <div class="layer-popup" id="layer-popup-sug">
         <div class="modal-dialog">
            <div class="modal-content">
            <p> 건의사항 </p>
            <form id="frmSug" name="frmSug">
     	          <input type="text" id="sugSubject" name="sugSubject" style="border:none;border-bottom:1px solid black;width: 100%;" onkeydown="chkChar(this)" placeholder="제목입력"><br>   
          	     <textarea id="sugContent" name="sugContent" style="width: 100%;height: 6.25em; border: none; resize: none;" placeholder="내용입력" ></textarea><br><br><br>       
               <button  type="button" class="popBtn" onclick="sugWrite()"><span id="btn-span">확인</span></button>
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

   <!-- Bootstrap core JavaScript-->



   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="resources/js/sb-admin-2.min.js"></script>

</body>

</html>