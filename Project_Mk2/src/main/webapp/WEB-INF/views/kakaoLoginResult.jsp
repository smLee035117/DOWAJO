<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaoLogin</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
	  integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('b79dc1db7766029ef40b797b707b121b'); // 사용하려는 앱의 JavaScript 키 입력
	  //console.log(Kakao.isInitialized());
	</script>
	<script type="text/javascript" src="resources/js/kakaoLogin.js"></script>
<link rel="icon" href="resources/img/dowajo_favicon.ico">
<script type="text/javascript">
function kakaoResult(){
		sessionStorage.setItem("id",${code});
		sessionStorage.setItem("nickname",request.getParameter('nickname'));
		sessionStorage.setItem('mem_key', 'K');
		alert("성공");
		location.href="/";
}
</script>
</head>
<body onload="kakaoResult()">

</body>
</html>