package com.project.root.util;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.project.root.basicdata.dto.KakaoUserInfo;


public class KakaoOAuth2 {
	 public KakaoUserInfo getUserInfo(String authorizedCode) {
	        //System.out.println("getUserInfo 호출");
	        // 인가코드 -> 액세스 토큰
	        String accessToken = getAccessToken(authorizedCode);
	        // 액세스 토큰 -> 카카오 사용자 정보
	        KakaoUserInfo userInfo = getUserInfoByToken(accessToken);

	        return userInfo;
	    }

	    private String getAccessToken(String authorizedCode) {
	        //System.out.println("getAccessToken 호출");
	        // HttpHeader 오브젝트 생성
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        // HttpBody 오브젝트 생성
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	        params.add("grant_type", "authorization_code");
	        params.add("client_id", "b0ea9543ca90d2402d97302f52f52937");   
	        params.add("redirect_uri", "http://13.55.193.171:8080/root-1.0.0-BUILD-SNAPSHOT/kakaoLoginResult");
	        params.add("code", authorizedCode);

	        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
	        RestTemplate rt = new RestTemplate();
	        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
	                new HttpEntity<>(params, headers);

	        // Http 요청하기, Post방식으로, 그리고 response 변수의 응답 받음
	        ResponseEntity<String> response = rt.exchange(
	                "https://kauth.kakao.com/oauth/token",
	                HttpMethod.POST,
	                kakaoTokenRequest,
	                String.class
	        );

	        // JSON -> 액세스 토큰 파싱
	        String tokenJson = response.getBody();
	        JSONObject rjson = new JSONObject(tokenJson);
	        String accessToken = rjson.getString("access_token");   //우리가 필요한건 accessToken

	        return accessToken;
	    }

	    //토큰을 통해 사용자 정보 가져오기
	    private KakaoUserInfo getUserInfoByToken(String accessToken) {
	        // HttpHeader 오브젝트 생성
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "Bearer " + accessToken);
	        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
	        RestTemplate rt = new RestTemplate();
	        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers);

	        // Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
	        ResponseEntity<String> response = rt.exchange(
	                "https://kapi.kakao.com/v2/user/me",
	                HttpMethod.POST,
	                kakaoProfileRequest,
	                String.class
	        );

	        JSONObject body = new JSONObject(response.getBody());
	        Long id = body.getLong("id");
	        String eaddr = body.getJSONObject("kakao_account").getString("email");
	        String nickname = body.getJSONObject("properties").getString("nickname");
	        int idx = 0;
	        idx = eaddr.indexOf("@");
	        eaddr = eaddr.substring(0,idx);
	        
	        //System.out.println(eaddr+" 호출");
	        //System.out.println(nickname+" 호출");
	        
	        
	        //가져온 사용자 정보를 객체로 만들어서 반환
	        return new KakaoUserInfo(id,eaddr, nickname);
	    }
	    
	    
}
