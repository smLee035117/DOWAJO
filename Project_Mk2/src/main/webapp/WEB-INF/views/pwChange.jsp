<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			                                        <img src="resources/img/dowajo_logo_new.png" width="15%" height="15%">
			                                        Dowajo
				                                 </a>
				                            </p>
                                    </div>
                                    <form class="user" id="regFrm" action="pwChangeRes" method="post">
                                        <div class="form-group">
                                        	<input type="hidden" id="memId" name="memId" value="${email1}${email2}" class="form-control form-control-user" readOnly>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="memPass" name="memPass" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="새 비밀번호">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="pwChk" name="pwChk" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="비밀번호 확인">
                                        </div>
                                        <hr>
                                        <button type="button" class="popBtn" onclick="writeRegister()" ><span id="btn-span">확인</span></button>              
               							<button type="button" class="popBtn" onclick="cancel()" ><span id="btn-span">취소</span></button>
                                    </form>
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
	// 하나이상의 숫자, 문자, 특수문자가 포함된 8~16자 비밀번호
	
    
	// 가입
   function writeRegister() {
	    var pwVal = $('#memPass').val();
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		
	   if(!$('#memPass').val()){
		   $('#memPass').focus();
		   alert("비밀번호를 입력하세요")
		   return;
	   }else if(!regExp.test(pwVal)){
		   $('#memPass').focus();
		   alert("비밀번호는 8자리 이상 16자리이하, 특수문자 및 숫자, 문자를 반드시 하나를 포함하세요.")
		   return;
	   }else if($('#pwChk').val()!=$('#memPass').val()){
		   $('#pwChk').focus();
		   alert("비밀번호가 일치하지 않습니다")
		   return;
	   }	
	   
		   $.ajax({
		        url:"pwChangeRes",
		        type:"post",   
		        dataType : "json",
		        async:false,
		        data:$("#regFrm").serialize() ,
		        success:function(responseData){      
		           var j = JSON.parse(responseData)
		              if(j==1){             
		                 alert("비밀번호가 변경되었습니다")
		                  location.href='login';
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
    
</script>
</html>
