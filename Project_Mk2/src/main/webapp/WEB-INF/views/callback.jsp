<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<html>
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
    var naver_id_login = new naver_id_login("kN9BHPF615UoOj8_Sup_", "http://localhost:8080/root/callback");
    // 접근 토큰 값 출력
    
    var naverToken = naver_id_login.oauthParams.access_token
    sessionStorage.setItem('loginToken', naverToken);
    sessionStorage.setItem('mem_key', 'N');	
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");

    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
    	sessionStorage.setItem('id', naver_id_login.getProfileData('email'));
    	$('#loginToken').val(naverToken)
    	$('#mem_key').val('N')
    	$('#id').val(naver_id_login.getProfileData('email'))
   		$('#frmNaver').submit()
    }
</script>
<form action="nvaerSession" method="post" id="frmNaver" name="frmNaver">
	<input type="hidden" name="mem_key" id="mem_key" >
	<input type="hidden" name="id" id="id" >
	<input type="hidden" name="loginToken" id="loginToken" >
</form>
</body>
</html>

