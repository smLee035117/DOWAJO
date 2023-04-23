package com.project.root.basicdata.dto;

public class KakaoUserInfo {
	private Long id;
	private String email;
	private String nickname;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public KakaoUserInfo(Long id, String email, String nickname) {
		super();
		this.id = id;
		this.email = email;
		this.nickname = nickname;
		
	}
	
	@Override
	public String toString() {
		return "KakaoUserInfo [id=" + id + ", email=" + email + ", nickname=" + nickname + "]";
	}
	
}
