<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#white_area {
 background-color : #ffffff;
}
#white_area p {
	color : #008CD6;
	font-size : 20px;
	vertical-align: center;
}


#welcome {
	display : block;
	width: 200px;
	height: 50px;
}


#welcome p {
display : block;
	padding-left : 15px;
	color : #FFFFFF;
	font-size : 16px;
}

.navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled #welcome p{
	font-size : 10px;
}

#collapsePages,#collapseTwo {
	z-index : 5; /* 접힌 상태에서 맵 화면 위에 팝업이 뜨게 함*/
}

</style>
</head>
<body>
	
      <!-- Sidebar -->
      <ul
         class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
         id="accordionSidebar">
         <!-- Sidebar - Brand -->
         <div id="white_area"><a
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="${pageContext.request.contextPath }/" title="홈페이지">
            <div class="sidebar-brand-icon">
               <img src="resources/img/dowajo_logo_new.png" width="50%" height="50%">
            </div>
            <div class="sidebar-brand-text mx-3">
               <p>Dowajo</p>
            </div>
         </a>
         </div>

         <!-- Divider -->
         <hr class="sidebar-divider my-0">
<%-- 
         <!-- Nav Item - Dashboard -->
         <li class="nav-item"><a class="nav-link"
            href="${pageContext.request.contextPath }/"> <i
               class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

         <!-- Divider -->
         <hr class="sidebar-divider"> --%>

         <!-- Heading -->
         <!-- <div class="sidebar-heading">Interface</div>

         Nav Item - Pages Collapse Menu


         Nav Item - Utilities Collapse Menu
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
            </div></li>             -->
         <!-- Divider -->
         <hr class="sidebar-divider">
 			<!-- 카카오 로그인 -->
          <div id="welcome">
	         <%if(session.getAttribute("mem_key")==null){ %>
	       		  <p>guest</p>	
			  <%}else if(session.getAttribute("mem_key").equals("N")){ %>
	          	 <p>네이버 회원</p>
			  <%}else if(session.getAttribute("mem_key").equals("U")){ %>
	          	 	<p>${nickName } 님</p>
			  <%}else if(session.getAttribute("mem_key").equals("K")){ %>
	             	<p>${nickname } 님</p>        	
			  <%}else if(session.getAttribute("mem_key").equals("A")){ %>
			  		<p>관리자 계정</p>
			  <%} %>	 
		  </div>
         <!-- Heading -->
         <!-- <div class="sidebar-heading">Addons</div> -->
       
         <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item">
         	<a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> 
         	<i class="fas fa-fw fa-folder"></i> <span>Pages</span></a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <c:if test="${nickName ==null }">
                  	<a class="collapse-item" href="login">로그인</a>
                  </c:if>
                  <c:if test="${nickName !=null }">
                  	<a class="collapse-item" href="logout">로그아웃</a>
                  </c:if>
                  <a class="collapse-item active" id="ToiletInfo" href="${pageContext.request.contextPath }/"  style="color:black;font-weight: normal;">화장실 정보</a>
                  <a class="collapse-item active" id="ShelterInfo" href="${pageContext.request.contextPath }/shelter"  style="color:black;font-weight: normal;">대피소 정보</a>
                  <a class="collapse-item active" id="WIFIZoneInfo" href="${pageContext.request.contextPath }/wifi"  style="color:black;font-weight: normal;">WIFI존 정보</a>
               </div>
            </div></li>
         <!-- Nav Item - Tables -->
        <c:if test="${mem_key eq 'A' }">
               <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item">
         	<a class="nav-link " href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
            <i class="fas fa-fw fa-cog"></i><span>관리자 기능</span></a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <a class="collapse-item" id="ToiletList" href="tables" style="color: black;">데이터 확인</a>
                  <a class="collapse-item" id="SuggestionsList" href="sugTable" style="color: black;">요청사항 확인</a>
               </div>
            </div></li>            
      	</c:if>
      	
        <!--  Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

      </ul>
      <!-- End of Sidebar -->
</body>
</html>