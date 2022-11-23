package com.project.root.basicdata.dto;

public class BasicDataDTO {
	//기본 데이터
	private int basNo;
	private int catNo;
	private String basAddr;
	private String basLat;
	private String basLon;
	
	//임시데이터
	private String restLock;
	private int restTol;
	private int restUri;
	
	public String getRestLock() {
		return restLock;
	}
	public void setRestLock(String restLock) {
		this.restLock = restLock;
	}
	public int getRestTol() {
		return restTol;
	}
	public void setRestTol(int restTol) {
		this.restTol = restTol;
	}
	public int getRestUri() {
		return restUri;
	}
	public void setRestUri(int restUri) {
		this.restUri = restUri;
	}
	public int getBasNo() {
		return basNo;
	}
	public void setBasNo(int basNo) {
		this.basNo = basNo;
	}
	public int getCatNo() {
		return catNo;
	}
	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}
	public String getBasAddr() {
		return basAddr;
	}
	public void setBasAddr(String basAddr) {
		this.basAddr = basAddr;
	}
	public String getBasLat() {
		return basLat;
	}
	public void setBasLat(String basLat) {
		this.basLat = basLat;
	}
	public String getBasLon() {
		return basLon;
	}
	public void setBasLon(String basLon) {
		this.basLon = basLon;
	}
	

}
