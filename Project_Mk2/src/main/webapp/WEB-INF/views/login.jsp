<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="icon" href="resources/img/dowajo_favicon.ico">
    <title>Dowajo - Login</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="resources/css/login_css.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
     <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
	  integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('b79dc1db7766029ef40b797b707b121b'); // 사용하려는 앱의 JavaScript 키 입력
	  //console.log(Kakao.isInitialized())>
	</script>
	<script type="text/javascript" src="resources/js/kakaoLogin.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="resources/js/email_js.js"></script>
	<script type="text/javascript">
		function onEnterLogin(){
	
			var keyCode = window.event.keyCode;
	
			
			if($("#LoginID").val() != ''){
				if (keyCode == 13) { //엔터키 누르면
					
					userLogin.submit();
		
				}
			}
		} //onEnterLogin()

	</script>
	<style type="text/css">
	.row { 
		height: 600px;
	}
	
	#naver_id_login  {
		position : relative;
		top : 10px;
		display: inline-block;
		height : 52.5px;
		overflow: hidden;
		background-image : url("resources/img/naver_login.png");
		background-size: 350px 52.5px;
		background-repeat : no-repeat;
	}
	#naver_id_login img{
		 opacity:0; 
	}
	</style>
</head>
<body class="bg-gradient-primary">

    <div class="container">  
  	<!-- 비밀번호 찾기 팝업  -->
      <div class="layer-popup" id="layer-popup-reg">
      	<div class="modal-dialog">
       		<div class="modal-content">
         		<h2 style="margin-bottom: 20px;color: #333;"> 이메일 확인 </h2>
         		<form id="regFrm" name="regFrm" action="pwChange" method="post">
					<div class="input-group">
						<input type="text" class="form-control-user" name="userEmail1" id="userEmail1" placeholder="이메일" >
						<div>
							<input type="text" class="form-control" name="userEmail2" id="userEmail2" disabled value="이메일 입력">
							<select class="form-control-user" name="emailSelect" id="emailSelect" >
								<option value="none" selected disabled> === 선택 === </option>
								<option value="@naver.com">@naver.com</option>
								<option value="@daum.net">@daum.net</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="@kakao.com">@kakao.com</option>
								<option value="@yahoo.co.kr">@yahoo.co.kr</option>
								<option value="@nate.com">@nate.com</option>
								<option value="1">직접입력</option>
							</select>
						</div>
						<input type="hidden" id="emailComple">
						<div class="input-group-addon" id="checkBtn">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn" onclick="emailBtnClick()">본인인증</button>
						</div>
					</div>   
					<div class="mail-check-box">
						<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
					<span id="mail-check-warn">.</span>       
	               	<button type="button" id="pwChkBtn" class="popBtnChk" onclick="emailCheck()" disabled="disabled"><span id="btn-span" class="btnCheck">확인</span></button>              
	               	<button type="button" class="popBtn" onclick="cancelRegister()" ><span id="btn-span">취소</span></button>              
          		</form>         
         	</div>
          </div>
     	</div>
        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center" style="padding-bottom: 20px;">
                                   		    <p id="comeBackP">
				                                <a id="comeBack" href="${pageContext.request.contextPath }/" >
			                                        <img src="resources/img/dowajo_logo_new.png" width="15%" height="15%">
			                                        Dowajo
				                                 </a>
				                            </p>
                                    </div>
                                    <form class="user" action="loginCheck" name="userLogin" method="post">
                                        <div class="form-group">
                                        	<input type="text" name="id" id="LoginID" class="form-control form-control-user" placeholder="ID">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pw" class="form-control form-control-user"
                                                id="exampleInputPassword" onkeydown="javascript:onEnterLogin();" placeholder="Password">
                                        </div>
                                       	<a href="#" onclick="popRegister()" style="float: right;padding: 0 10px 5px 0;">비밀번호 찾기</a>
                                       	<a href="${pageContext.request.contextPath}/agreement" onclick="" style="float: right;padding: 0 10px 5px 0;">회원가입</a>
                                        <input type="submit" class="btn btn-primary btn-user btn-block" value="Login">                                
                                    </form>
                                    <hr>
                                    <!-- <a href="index.html" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i> Login with Google
                                    </a>
                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                    </a> -->
                                    <a id="kakao-login-btn" href="javascript:loginWithKakao()">
  										<img src="resources/img/kakao_login_large_wide.png" width="350" alt="카카오 로그인 버튼" />
									</a>
									<div id="naver_id_login"></div>
									<!-- <p id="token-result"></p> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

</body>
<script type="text/javascript">
	// test 전용 id 로 로그인 설정.
	var naver_id_login = new naver_id_login("kN9BHPF615UoOj8_Sup_", "http://localhost:8080/root/callback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,76);
	naver_id_login.setDomain("http://localhost:8080/APIExamNaverLogin");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
	
    //팝업 띄우기
   function popRegister() {
	      $('#layer-popup-reg').addClass("show");   
	}	   
   //팝업 닫기
    function cancelRegister() {
    	$('.layer-popup').removeClass("show");
    	$('#mail-check-warn').html('');
    	$('#userEmail1').val('');
    	$('.mail-check-input').val('');
    	$('#mail-Check-Btn').attr('disabled',false);
    	$('.mail-check-input').attr('disabled',true);
		$('#userEmail1').attr('readonly',false);
		$('#userEmail2').attr('readonly',false);
	}
   
   function emailCheck(){
	   const userEmail = $('#userEmail1').val() + $('#userEmail2').val();
	   console.log(userEmail);
	   $('#emailComple').val(userEmail);
	   $('#regFrm').submit();
	   
   }
   
    document.addEventListener('keydown', function(event) {
  	  if (event.keyCode === 13) {
  	    event.preventDefault();
  	  };
  	}, true);
    
 // 이메일 선택
    $('#emailSelect').change(function(){
 	   $("#emailSelect option:selected").each(function () {
 			
 			if($(this).val()== '1'){ //직접입력일 경우
 				 $("#userEmail2").val('');                        //값 초기화
 				 $("#userEmail2").attr("disabled",false); //활성화
 				 $("#userEmail2").focus();
 			}else{ //직접입력이 아닐경우
 				 $("#userEmail2").val($(this).text());      //선택값 입력
 				 $("#userEmail2").attr("disabled",true); //비활성화
 			}
 	   });
 	});
    
    //이메일 인증번호 보내기
    function emailBtnClick() {
		var email;
		if(!$('#userEmail1').val()){
			$('#userEmail1').focus();
			alert('이메일을 입력하세요.');
			return;
		}
		email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 붙힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	} // end send email
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		const $button = $('pwChkBtn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	        $('#pwChkBtn').attr('disabled',false);
	        $('#pwChkBtn').addClass('enabled');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			$('#pwChkBtn').attr('disabled',true);
			$('#pwChkBtn').removeClass('enabled');
		}
	});
</script>
</html>
