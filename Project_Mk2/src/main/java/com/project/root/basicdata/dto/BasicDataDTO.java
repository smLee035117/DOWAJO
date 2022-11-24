package com.project.root.basicdata.dto;

public class BasicDataDTO {

	
	private String basNo;
	private String basName;
	private int catNo;
	private String basAddr;
	private String basLat;
	private String basLng;
	
	//임시데이터
	private String restLock;
	private int restTol;
	private int restUri;
	
	public String getBasName() {
		return basName;
	}
	public void setBasName(String basName) {
		this.basName = basName;
	}
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

	public String getBasNo() {

		return basNo;
	}
	public void setBasNo(String basNo) {
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
	public String getBasLng() {
		return basLng;
	}
	public void setBasLng(String basLng) {
		this.basLng = basLng;
	}
	@Override
	public String toString() {
		return "BasicDataDTO [basNo=" + basNo + ", catNo=" + catNo + ", basAddr=" + basAddr + ", basLat=" + basLat
				+ ", basLng=" + basLng + ", restLock=" + restLock + ", restTol=" + restTol + ", restUri=" + restUri
				+ "]";
	}
	

}
