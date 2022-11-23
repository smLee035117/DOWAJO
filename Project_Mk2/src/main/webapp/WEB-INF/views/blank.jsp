<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

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
<style type="text/css">
#map {
   width: 100%;
   height: 100%;
}
</style>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=838c15c312233703a768fa54b12c4495"></script>
<script type="text/javascript">
   // 외부영역 클릭 시 팝업 닫기
   $(document).mouseup(function (e){
     var LayerPopup = $(".layer-popup");
     if(LayerPopup.has(e.target).length === 0){
       LayerPopup.removeClass("show");
     }
   });
   var infowindowOpened = [];
$(function () {
     var toilet = [];
     var mapContainer;
     var map;
    
    //  공공데이터 api 정보가져오기 
   $.ajax({
       url:"http://openAPI.seoul.go.kr:8088/705365615a776f6e33334f5a42516e/json/SearchPublicToiletPOIService/1/1000",
       type:"get",   
       dataType : "json",
       contentType:"application/json",
       success:function(responseData){         
          var j = Object.values(responseData)
             for(var i = 0 ; i < j[0].row.length; i++){
                 toilet[i] = {
                               content: '<div>'+j[0].row[i].FNAME+'</div>', 
                               latlng: new kakao.maps.LatLng(j[0].row[i].Y_WGS84, j[0].row[i].X_WGS84)
                            }            
             }
         //자신의 위치 가져오는 geolocation api 
		 navigator.geolocation.getCurrentPosition(showYourLocation, showErrorMsg); 
          
          function showYourLocation(position) {  // 성공했을때 실행
  		  	var lat = position.coords.latitude, // 현재 위도
				lon = position.coords.longitude; // 현재 경도
  	 	 	console.log(lat,lon);
		  mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	       mapOption = {
	           center: new kakao.maps.LatLng(lat, lon), // 바꿔야 하는 위도 경도
	           level: 2 // 지도의 확대 레벨
	       };
	    map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	   
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
	            	 content: toilet[i].content,
	            	 removable: true
	             });
				
	             //마우스 오버 후 제목 내용 나오는 리스너
	             kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	             //마우스 오버후 이동시 끄는 리스너
	             kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	             //마우스 클릭시 디테일 내용 나오는 리스너
	             kakao.maps.event.addListener(marker,'click',makeClickListener(map, marker, infowindowDetail));   
	             //마우스 클릭시 이전 마커 삭제후 새로운 마커 생성 리스너
	             kakao.maps.event.addListener(map, 'click', function(mouseEvent) {   
	                   marker2.setMap(null);
	                   var latlng = mouseEvent.latLng; 
	                      
	                   // 마커가 표시될 위치입니다 
	                   var markerPosition  = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()) ; 

	                   // 마커가 지도 위에 표시되도록 설정합니다
	                    marker2.setPosition(latlng);
	                    marker2.setMap(map);
	                    $('#layer-popup').addClass("show");   
	 					$('#latlng').val(latlng)
	                 }); 
	             
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
        	            	 content: toilet[i].content,
        	            	 removable: true
        	             });
        	             
        	             //마우스 오버 후 제목 내용 나오는 리스너
        	             kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        	             //마우스 오버후 이동시 끄는 리스너
        	             kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        	             //마우스 클릭시 디테일 내용 나오는 리스너
        	             kakao.maps.event.addListener(marker,'click',makeClickListener(map, marker, infowindowDetail));   
        	             //마우스 클릭시 이전 마커 삭제후 새로운 마커 생성 리스너
         	             kakao.maps.event.addListener(map, 'click', function(mouseEvent) {   
         	                   marker2.setMap(null);
         	                      var latlng = mouseEvent.latLng; 
         	                   // 마커가 표시될 위치입니다 
         	                   var markerPosition  = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()) ; 

         	                   // 마커가 지도 위에 표시되도록 설정합니다
         	                    marker2.setPosition(latlng);
         	                    marker2.setMap(map);
         	                    $('#layer-popup').addClass("show");   
         	 					$('#latlng').val(latlng)
         	                 }); 
         	             
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
   
   //장소 등록 
   function popData() {
/*    var la = $('#latlng').val()
       var newStr = la.replace('(', ' ');
       newStr = newStr.replace(')', ' ');
	  
       $('#latlng').val(newStr.trim()) */
       var formData = $("#frmModal").serialize(); 
	   $.ajax({
	       url:"blank",
	       type:"post",   
	       dataType : "json",
	       data:formData,
	       contentType:"application/json",
	       success:function(responseData){        
	          var j = Object.values(responseData)  
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
            <!-- <button onclick="bb()">xxxx</button> -->
	            <form name="frmModal" id="frmModal" name="frmModal">
	            	<input type="text" id="basAddr" name="basAddr" style="border:none;border-bottom:1px solid black" placeholder="이름입력"><br>	   
	            	<div id = "content">
		            	<div id='small'>
		            		<span>소변기</span>&nbsp;<input type="text" id="restTol" name="restTol" size="2" maxlength="2" style="border:none" placeholder="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
		            	</div>	   
		            	<div id='big'>
		            		<span>좌변기</span>&nbsp;<input type="text" id="restUri" name="restUri" size="2" style="border:none" maxlength="2" placeholder="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
		            	</div>
	            	</div>	   	            	
	            	<!-- <label for="content">내용</label> <input type="text" id="content" name="content" placeholder="내용입력">              -->                             
	            	<div id="lock" style="width:100%; padding-top:15px;" >
	            	<label style="width:30%">잠금유무</label>	            	
	            	있음<input type="radio" id="choice1" name="choice" value="Y" style="width:15%" > &nbsp;
	            	없음<input type="radio" id="choice2" name="choice" value="N"  style="width:15%" checked="checked">
	            	</div>
	            	<br>	            	
					<button onclick="popData()"><span id="btn-span">확인</span></button>				
					<input type="hidden" id="latlng" name="latlng"><br>   
	            </form>
            </div>
         </div>
      </div>
   </div>
   <div id="GPS"><a onclick="location.reload()"><img id="gps-img" src="resources/img/gps_icon.png" width="60%" height="60%"></a></div>
   <!-- Page Wrapper -->
   <div id="clickLatlng"></div>
   <div id="wrapper">

      <!-- Sidebar -->
      <ul
         class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
         id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <a
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="${pageContext.request.contextPath }/">
            <div class="sidebar-brand-icon rotate-n-15">
               <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">
               SB Admin <sup>2</sup>
            </div>
         </a>

         <!-- Divider -->
         <hr class="sidebar-divider my-0">

         <!-- Nav Item - Dashboard -->
         <li class="nav-item"><a class="nav-link"
            href="${pageContext.request.contextPath }/"> <i
               class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

         <!-- Divider -->
         <hr class="sidebar-divider">

         <!-- Heading -->
         <div class="sidebar-heading">Interface</div>

         <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item"><a class="nav-link collapsed" href="#"
            data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo"> <i
               class="fas fa-fw fa-cog"></i> <span>Components</span>
         </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
               data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">Custom Components:</h6>
                  <a class="collapse-item" href="buttons">Buttons</a> <a
                     class="collapse-item" href="cards">Cards</a>
               </div>
            </div></li>

         <!-- Nav Item - Utilities Collapse Menu -->
         <li class="nav-item"><a class="nav-link collapsed" href="#"
            data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities"> <i
               class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
         </a>
            <div id="collapseUtilities" class="collapse"
               aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">Custom Utilities:</h6>
                  <a class="collapse-item" href="utilitiesColor">Colors</a> <a
                     class="collapse-item" href="utilitiesBorder">Borders</a> <a
                     class="collapse-item" href="utilitiesAnimation">Animations</a> <a
                     class="collapse-item" href="utilitiesOther">Other</a>
               </div>
            </div></li>

         <!-- Divider -->
         <hr class="sidebar-divider">

         <!-- Heading -->
         <div class="sidebar-heading">Addons</div>

         <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item active"><a class="nav-link" href="#"
            data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="true" aria-controls="collapsePages"> <i
               class="fas fa-fw fa-folder"></i> <span>Pages</span>
         </a>
            <div id="collapsePages" class="collapse show"
               aria-labelledby="headingPages" data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">Login Screens:</h6>
                  <a class="collapse-item" href="login">Login</a> <a
                     class="collapse-item" href="register">Register</a> <a
                     class="collapse-item" href="forgotPassword">Forgot Password</a>
                  <div class="collapse-divider"></div>
                  <h6 class="collapse-header">Other Pages:</h6>
                  <a class="collapse-item" href="404">404 Page</a> <a
                     class="collapse-item active" href="blank">Blank Page</a>
               </div>
            </div></li>

         <!-- Nav Item - Charts -->
         <li class="nav-item"><a class="nav-link" href="charts"> <i
               class="fas fa-fw fa-chart-area"></i> <span>Charts</span></a></li>

         <!-- Nav Item - Tables -->
         <li class="nav-item"><a class="nav-link" href="tables"> <i
               class="fas fa-fw fa-table"></i> <span>Tables</span></a></li>

         <!-- Divider -->
         <hr class="sidebar-divider d-none d-md-block">

         <!-- Sidebar Toggler (Sidebar) -->
         <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
         </div>

      </ul>
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