 
 //kakaoLogin.js




  function loginWithKakao() {
	 Kakao.API.request({
  url: '/v2/user/me',
  data: {
    property_keys: ['kakao_account.email'],
  },
})
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
    
	
	
   Kakao.Auth.authorize({
      //redirectUri: 'https://developers.kakao.com/tool/demo/oauth'
      redirectUri : "http://localhost:8080/root/kakaoLoginResult",
    });
    
    
 
    /*Kakao.Auth.login({
          success: function(authObj) {
            //alert(JSON.stringify(authObj))
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                    
                    var account = response.kakao_account;
                    //let id = "kakao_" + response.id;
                    let email = (response.kakao_account.email != undefined ? response.kakao_account.email : '');
                    sessionStorage.setItem("id",account);
					sessionStorage.setItem('mem_key', 'K');
					alert("성공");
					location.href="/";
                    
                },
                fail: function(error) {
                    console.log(error);
                }
            });
          },
          fail: function(err) {
            alert(JSON.stringify(err))
          },
        }) */
    
    
  }

 /* // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }

  }*/
