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
    <link href="resources/css/signUp_css.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	
<style type="text/css">
.row { 
	height: 600px;
}
</style>
</head>
<body class="bg-gradient-primary">

    <div class="container">
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
			                                        <img src="resources/img/dowajo_logo_new.png" width="12%" height="16%">
			                                        Dowajo
				                                 </a>
				                            </p>
                                    </div>
                                    <form id="regFrm" name="regFrm" class="user" action="loginCheck" method="post">
                                        <div class="form-group">
                                        	<input type="text" id="memId" name="memId" class="form-control form-control-user" placeholder="E-mail 인증이필요합니다." readonly="readonly">
                                        	<button type="button" class="popBtn" onclick="emailPopup()" ><span id="btn-span-email">이메일 인증</span></button>
                                        </div>
                                         
                                        <div class="form-group">
                                        	<input type="text" id="nickName" name="nickName" class="form-control form-control-user" placeholder="nickName">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="memPass" name="memPass" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="pwChk" name="pwChk" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password check">
                                        </div>
                                        <hr>
                                        <button type="button" class="popBtn" onclick="writeRegister()" ><span id="btn-span">확인</span></button>              
               							<button type="button" class="popBtn" onclick="cancelRegister()" ><span id="btn-span">취소</span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        	<!-- 이메일인증 팝업 -->
	    <div class="layer-popup" id="layer-popup">
			<div class="modal-dialog">
				 <div class="modal-content">
	         		<h2 style="margin-bottom: 20px;color: #333;"> 이메일 확인 </h2>
					 <div class="input-group">
						<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
						<div>
							<input type="text" class="form-control" name="userEmail2" id="userEmail2" disabled value="이메일 입력">
							<select class="form-control" name="emailSelect" id="emailSelect" >
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
						<div class="input-group-addon" id="checkBtn">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn" onclick="emailBtnClick()">본인인증</button>
						</div>
					</div>
					<div class="mail-check-box">
						<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
					<span id="mail-check-warn"></span>
					<button type="button" class="popBtnChk" onclick="emailChk()" id="email-chkSucess" disabled="disabled"><span id="btn-span">확인</span></button>              
               		<button type="button" class="popBtnCancle" onclick="cancel()" id="cancleBtn"><span id="btn-span">취소</span></button>
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
	// 하나이상의 숫자, 문자, 특수문자가 포함된 8~16자 비밀번호
	
    
	// 가입
   function writeRegister() {
	    var pwVal = $('#memPass').val();
		var regExp1 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		console.log(pwVal);
	   if(!$('#memId').val()){
		   $('#memId').focus();
		   alert("이메일를 입력하세요")
		   return;
	   }else if(!$('#nickName').val()){
		   $('#nickName').focus();
		   alert("닉네임을 입력하세요")
		   return;
	   }else if(!$('#memPass').val()){
		   $('#memPass').focus();
		   alert("비밀번호를 입력하세요")
		   return;
	   }else if(!regExp1.test(pwVal)){
		   $('#memPass').focus();
		   alert("비밀번호는 8자리 이상 16자리이하, 특수문자 및 숫자, 문자를 반드시 하나를 포함하세요.")
		   return;
	   }else if($('#pwChk').val() != $('#memPass').val()){
		   $('pwChk').focus();
		   console.log($('#pwChk').val());
		   console.log($('#pw').val());
		   
		   alert("비밀번호가 일치하지 않습니다")
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
		                 alert("중복된 이메일입니다")
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
    
    // 회원가입 취소
    function cancelRegister(){
    	location.href="${pageContext.request.contextPath}/login";
    }
    //팝업 띄우기
    function emailPopup() {
 	      $('#layer-popup').addClass("show");   
 	}	   
    //팝업 닫기
     function cancel() {
    	$('#memId').value = null;
     	$('.layer-popup').removeClass("show");   
 	}	
     //이메일 인증번호 보내기
     function emailBtnClick() {
    	 
  		var email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
  		var re = new RegExp("^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$");
  		
  		// 유효성검
  		if (email == '' || !re.test(email)) {
  		alert("올바른 이메일 주소를 입력하세요")
  			return false;
  		}
  		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
    	if(confirm("이메일:"+ email +" 로 인증번호를 보내시겠습니까?")){
 		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
 		
 		$.ajax({
 			type : 'get',
 			url : '<c:url value ="/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
 			success : function (data) {
 				console.log("data : " +  data);
 				checkInput.attr('disabled',false);
 				code =data;
 				alert('인증번호가 전송되었습니다.')
 			}			
 		}); // end ajax
     } else {
    	 return;
     }
 	} // end send eamil
 	
 	// 인증번호 비교 
 	// blur -> focus가 벗어나는 경우 발생
 	$('.mail-check-input').blur(function () {
 		const inputCode = $(this).val();
 		const $resultMsg = $('#mail-check-warn');
 		
 		if(inputCode === code){
 			$resultMsg.html('인증번호가 일치합니다.');
 			$resultMsg.css('color','green');
 			$resultMsg.css('visibility','visible');
 			$('#mail-Check-Btn').attr('disabled',true);
 			$('#userEamil1').attr('readonly',true);
 			$('#userEamil2').attr('readonly',true);
 			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
 	        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
 	        $('#email-chkSucess').attr('disabled',false);
 	       	$('#email-chkSucess').addClass('enabled');
 		}else{
 			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
 			$resultMsg.css('color','red');
 			$resultMsg.css('visibility','visible');
 			$('#email-chkSucess').attr('disabled',true);
 			$('#email-chkSucess').removeClass('enabled');
 		}
 	});    
 	function emailChk(){
 		$('#memId').val($('#userEmail1').val() + $('#userEmail2').val());
 		$('.layer-popup').removeClass("show");
 		
 	}
</script>
</html>
