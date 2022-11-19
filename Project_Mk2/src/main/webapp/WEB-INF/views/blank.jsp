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
<script src="resources/vendor/jquery/jquery.min.js"></script>


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
 $(function () {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5657, 126.9807), // 바꿔야 하는 위도 경도
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다.
	
	var positions = [
	    {
	        content: '<div>화장실 이름</div>', 
	        latlng: new kakao.maps.LatLng(37.5652, 126.9815)
	    },
	    {
	        content: '<div style="color:red;">생태연못</div>', 
	        latlng: new kakao.maps.LatLng(37.5659, 126.9810)
	    },
	    {
	        content: '<div>텃밭</div>', 
	        latlng: new kakao.maps.LatLng(37.5657, 126.9808)
	    },
	    {
	        content: '<div>근린공원</div>',
	        latlng: new kakao.maps.LatLng(37.5654, 126.9800)
	    }
	];
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	     var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });

	   
	    
	    // 마커에 표시할 인포윈도우를 생성합니다 
	     infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	    
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
  	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));    
	    
	}
	
	//객체생성
	 var marker2 = new kakao.maps.Marker({ });
	
	//
	
	
	 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {   
		marker2.setMap(null);
		   var latlng = mouseEvent.latLng; 
		   
	
 	 	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	 	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	 		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()) ; 

		// 마커가 지도 위에 표시되도록 설정합니다
		 marker2.setPosition(latlng);
		 marker2.setMap(map);
		    
		   $(document).on("click", ".btn-open", function (e){
				  var target = $(this).attr("href");
				  $(target).addClass("show");
				});	
 	}); 
	
 })
 function allInfowindowClose() {
	    for(var i=0; i<infowindows.length; i++) {
	        var infowindow = infowindows[i];
	        infowindow.close();
	    }
	}

	
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
</script>
<style>
.layer-popup {
	display: none;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 100;
}

.layer-popup.show {
	display: block;
}

.modal-dialog {
	width: 300px;
	margin: 40px auto;
	background-color: #fff;
}

.modal-content {
	padding: 10px 15px;
	text-align: center;
	line-height: 100px;
}
</style>
<body id="page-top">
<!-- 	<a href="#layer-popup" class="btn-open">팝업 열기</a>
	<div class="container">
		<div class="layer-popup show" id="layer-popup">
			<div class="modal-dialog">
				<button>x</button>
				<div class="modal-content">팝업 내용입니다.</div>
			</div>
		</div>
	</div>
	Page Wrapper -->
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

			<!-- Footer -->
			<!--   <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer> -->
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

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