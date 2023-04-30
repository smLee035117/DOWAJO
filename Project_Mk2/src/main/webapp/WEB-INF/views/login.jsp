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
<link rel="icon" href="resources/img/dowajo-favicon.ico">
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
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="resources/js/kakaoLogin.js"></script>
	<script type="text/javascript" src="resources/js/email_js.js"></script>
	
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
    
    <!--이메일 팝업  -->
      <div class="email-popup" id="email-popup">
		 <div class="form-group email-form">
			 <label for="email">이메일</label>
			 <div class="input-group">
			<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
			<select class="form-control" name="userEmail2" id="userEmail2" >
			<option>@naver.com</option>
			<option>@daum.net</option>
			<option>@gmail.com</option>
			<option>@kakao.com</option>
			</select>
			</div>   
		<div class="input-group-addon">
			<button type="button" class="btn btn-primary" id="mail-Check-Btn" onclick="emailBtnClick()">본인인증</button>
		</div>
			<div class="mail-check-box">
		<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
		</div>
			<span id="mail-check-warn"></span>
</div>
      </div>
  	<!--회원가입 팝업  -->
      <div class="layer-popup" id="layer-popup-reg">
         <div class="modal-dialog">
            <div class="modal-content">
            <h2 style="margin-bottom: 20px;color: #333;"> 회원가입 </h2>
            <form id="regFrm" name="regFrm">
     	       <input type="text" class="form-control form-control-user" id="memId" name="memId" style="width: 100%;margin-bottom: 10px;" placeholder="아이디 입력">   
          	   <input  type="password" class="form-control form-control-user" id="memPass" name="memPass" style="width: 100%;" placeholder="비밀번호 입력" ><br><br><br>       
               <button type="button" class="popBtn" onclick="writeRegister()" ><span id="btn-span">확인</span></button>              
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
			                                        <img src="resources/img/dowajoLogo.png" style="background-color: #D55353;"  width="15%" height="15%">
			                                        Dowajo
				                                 </a>
				                            </p>
		                           
		                            	
                                    </div>
                                    <form class="user" action="loginCheck" method="post">
                                        <div class="form-group">
                                        	<input type="text" name="id" class="form-control form-control-user" placeholder="ID">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pw" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
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
	}	  
    // 가입
   function writeRegister() {
	   
	   if(!$('#memId').val()){
		   $('#memId').focus();
		   alert("아이디를 입력해주세요")
		   return;
	   }else if(!$('#memPass').val()){
		   $('#memPass').focus();
		   alert("비밀번호를 입력해주세요")
		   return;
	   }	
	   
		   $.ajax({
		        url:"writeRegister",
		        type:"post",   
		        dataType : "json",
		        async:false,
		        data:$("#regFrm").serialize() ,
		        success:function(responseData){      
		           var j = JSON.parse(responseData)
		              if(j==1){             
		                 alert("회원가입이 완료되었습니다")
		                  location.reload();
		              }else if(j==2){                   
		                 alert("중복된 아이디입니다")
		              }else{		            	  
		                 alert("알 수없는 오류입니다")
		              }
		         },error : function () {
		            console.log('fail')
		         } 
		     });
	  
	}
   
    document.addEventListener('keydown', function(event) {
  	  if (event.keyCode === 13) {
  	    event.preventDefault();
  	  };
  	}, true);
    
    //이메일 인증번호 보내기
    function emailBtnClick() {
		const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	} // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
</script>
</html>
