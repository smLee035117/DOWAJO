<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> Dowajo </title>

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="resources/css/tablesTest_css.css" rel="stylesheet">
	<link rel="icon" href="resources/img/dowajo_favicon.ico">
    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
   <script src="resources/vendor/jquery/jquery.min.js"></script>
   <script type="text/javascript" src="resources/js/tablesTest_js.js"></script>
</head>
<script type="text/javascript">
$(function () {
	$('.collapse show').attr('class','collapse')
	$('#collapseTwo').attr('class','collapse show')
	$('#ToiletList').css({"color":"#5353d5","font-weight": "bold"})	
})
</script>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="default/navigator.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div class="container">
	            <div id="content">
	
	                <!-- Topbar -->
	                <%-- <c:import url="default/header.jsp"/> --%>
	                <!-- End of Topbar -->
	
	                <!-- Begin Page Content -->
	                <div class="container-fluid">
	
	                    <!-- Page Heading -->
	                    <h1 class="h3 mb-2 text-gray-800">데이터 확인</h1>
	                    <p class="mb-4">사용자들이 등록한 데이터들이 전부 표시됩니다.</p>
	                    <!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <!-- <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
	                        </div> -->
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>고유번호</th>
	                                            <th>이름</th>
	                                            <th>분류번호</th>
	                                            <th>주소</th>
	                                            <th>삭제</th>
	                                        </tr>
	                                    </thead>
	                                    <tfoot>
	                                        <tr>
	                                            <th>고유번호</th>
	                                            <th>이름</th>
	                                            <th>분류번호</th>
	                                            <th>주소</th>
	                                            <th>삭제</th>
	                                        </tr>
	                                    </tfoot>
	                                    <tbody>
	                                       <c:forEach var="allList" items="${allList}">
	                                       		<tr>
	                                       			<td>${allList.basNo }</td>
	                                       			<td><a onclick="showToiletDetail()">${allList.basName }</a></td>
	                                       			<td> ${allList.catNo }</td>
	                                       			<td> ${allList.basAddr }</td>
	                                       			<td> <button id="deleteBtn" class="delete_info" type="button" onclick="delete_info('${allList.basNo}')">
	                        								<span id="btn-span" aria-hidden="true">삭제</span>
	                    								</button>
	                    							</td>
	                                       		</tr>
	                                       </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- /.container-fluid -->
	
	            </div>
            	<!-- End of Main Content -->
			</div>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    
    <!-- 등록장소 내용보기 -->
      <div class="layer-popup" id="layer-popup-sug-Detail">
         <div class="modal-dialog">
            <div class="modal-content">
            <!-- <button onclick="bb()">xxx</button> -->
     	          <input type="text" id="sugSubject" name="sugSubject" readonly="readonly" style="border:none;border-bottom:1px solid black;width: 100%;" placeholder="제목입력"><br>   
          	     <textarea id="sugContent" name="sugContent" readonly="readonly" style="width: 100%;height: 6.25em; border: none; resize: none;" placeholder="내용입력" ></textarea><br><br><br>       
               <button class="popBtn" onclick="sugClose()"><span id="btn-span">닫기</span></button>
            </div>
         </div>
      </div>
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/datatables-demo.js"></script>

</body>
</html>