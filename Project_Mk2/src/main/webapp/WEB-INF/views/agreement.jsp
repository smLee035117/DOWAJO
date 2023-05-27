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
<link rel="icon" href="resources/img/dowajo_favicon.ico">
    <title> Dowajo </title>

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="resources/css/agreement_css.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
   <script src="resources/vendor/jquery/jquery.min.js"></script>
   <script type="text/javascript" src="resources/js/tablesTest_js.js"></script>
</head>
<script type="text/javascript">
$(function () {
	$('.collapse show').attr('class','collapse')
	$('#collapseTwo').attr('class','collapse show')
	$('#ToiletList').css({"color":"#1170CE","font-weight": "bold"})	
})

// 동의항목체크 루틴
function nextBtn() {
    var selected = false;
    var chk1 = document.getElementById('chk1');
    var chk2 = document.getElementById('chk2');

    if (chk1.checked && chk2.checked)
        {
    	location.href="${pageContext.request.contextPath}/signUp";
        }
    else {
        alert('동의항목을 체크해주세요');
    }
}



// 동의체크 루틴

</script>
<body id="bg-gradient-primary">
	<div class="container">
       <!-- Main Content -->
       <div id="justify-content-center">
            <!--title -->
            <h1 class="h3 mb-2 text-gray-800">개인정보동의  </h1>
            <div></div>
            <div id="logo">
                <a id="comeBack" href="${pageContext.request.contextPath }/" >
					<img src="resources/img/dowajo_logo_new.png" style="min-width:70px; min-height:70px;"  width="15%"  height="15%">
				</a>
			</div>
            <!-- 이용약관 -->
			<h3>이용약관</h3>
			<div class="box">
				<h6> 제 1 장 총칭</h6>
				<br>
				<p> 제 1조 목적</p>
				<br>
				<p> 이 약관은 dowajo(이하"당사"라 칭함)가 제공하는></p> 
				<p>위치정보시스템("")(이하"서비스"라 칭함)</p>
				<p>을 이용함에 있어 이용자와 당사 간의 권리 의무 및 책임사항과 기타 필요한</p>
				<p>사항을 규정함을 목적으로 합니다.</p>
				<br>
				<p> 제 2조(약관의 효력 및 변경)</p>
				<br>
				<p> 1. 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 공지함으로써 이용자에게 공시하고, 이에 동의한 이용자가 서비스에 가입함으로써 효력이 발생합니다.</p> 
				<p> 2. 당사는 필요하다고 인정되는 경우 이 약관의 내용을 변경할 수 있으며, 약관을 변경할 경우에는 지체 없이 적용일자 및 주요 개정사유를 명시하여 서비스 초기화면에 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.</p>
				<p> 3. 회원은 변경된 약관에 거부할 권리가 있습니다. 회원은 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. 회원이 거부하는 경우 당사는 당해 회원과의 계약을 해지할 수 있습니다. 만약 회원이 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.</p>
				<p> 4. 이 약관에 명시되지 않은 사항에 대해서는 대한민국의 관계법령 또는 상관례에 따릅니다.</p>
				<br>
				<h6> 제 2 장 회원의 가입 및 탈퇴</h6>
				<br>
				<p> 제 3조(회원의 가입)</p>
				<br>
				<p>회원은 당사가 정한 가입양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 표시를 함으로서 회원가입이 이루어집니다.</p>
				<p> 제 4조(회원의 탈퇴및 자격정지)</p>	
				<br>
				<p>회원이 다음 각호에 해당하는 경우 당사는 별도의 통보절차 없이 회원의 자격을 정지하거나 박탈할 수 있습니다.</p>
				<p>1. 회원가입시의 등록내용에 허위, 기재누락, 오기가 있는 경우</p>
				<p>2. 이용자가 타인 명의를 사용하여 회원가입을 신청한 경우</p>
				<p>3. 기타 당사가 회원으로서 부적합하다고 판단한 경우</p>
				<br>
				<h6> 제 3 장 서비스 일반</h6>
				<p>제5조 (서비스 이용계약 성립)</p>
				<p>당사 회원에 가입하는 것은 본 약관에 대하여 동의하는 것으로 간주하며, 이로서 서비스 이용계약이 성립됩니다.</p>
				<br>
				<p>제6조 (개인정보의 취득 및 이용)</p>
				<p>제공된 개인정보는 회원의 동의 없이 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 당사에 있습니다.</p>
				<br>
				<h6> 제 4 장 책임 및 의무</h6>
				<br>
				<p>제7조 당사의 의무</p>
				<p>1. 당사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정되는 경우 이를 즉시 처리합니다.</p>
				<p>2. 당사는 계속적이고 안정적인 서비스 제공을 위해 최선을 다하겠습니다.</p>
				<p>3. 서비스 중단이 당사의 고의나 중대한 과실에 의하여 발생되지 않는 한, 당사는 회원 또는 제3자가 입은 손실에 대해서는 책임을 지지 않습니다.</p>
				<p>4. 당사는 개인정보의 보안을 위해 노력하며, 이를 위해 담당자를 선정하여 관리하여야 합니다.</p>
				<br>
				<p>제8조 회원의 의무</p>
				<p>1. 회원은 자신의 ID와 비밀번호를 타인에게 대여할 수 없으며 약관을 준수해야 합니다.</p>
				<br>
				<p>< 부칙 ></p>
				<p>본 약관은 2021년 1월 25일부터 시행하고 이전약관에 적용되던 모든 사항은 본약관으로 대체합니다.</p>
			</div>
	       	<label for="chk1" class="checkbox_radio">
	            <input type="checkbox" name="chk1" id = "chk1">
	            <span class="chk1Custom"></span>
	        	동의합니다.
            </label>
            <br>
            <br>
            <!-- 개인정보 수집 및 제 3자동의 -->
           	<div class="box">
	        	<p>개인정보 수집및 이용 동의(필수사항)</p>
	            <table>
	                <tr>수집.이용항목</tr>
	                <tr>수집.이용목적</tr>
	                <tr>보유기간</tr>
	                <td>이메일</td>
	                <td>본인식별절차,공지사항안내</td>
	            	<td>가입 후 1년</td>
	            </table>
	        	<p>귀하는 개인정보 제공 및 활용을 거부할 권리가 있습니다. 그러나 거부하실 경우 서비스 이용이 불가능함을 알려드립니다.</p>
            </div>
            <label for="chk2" class="checkbox_radio">
                <input type="checkbox" name="chk2" id = "chk2">
                <span class="chk2Custom"></span>
				동의합니다.
			</label>
            <div class="nextBtnDiv">   
            	<button id="nextBtn" title="다음" onclick="nextBtn()"><span id="btn-span">다음</span></button>
            </div>
        </div>
    	<!-- End of Main Content -->
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