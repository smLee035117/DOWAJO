package com.project.root.basicdata.dto;

public class BasicDataDTO {

	
	private String basNo;
	private String basName;
	private int catNo;
	private String basAddr;
	private String basLat;
	private String basLng;
	

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
	public String getBasName() {
		return basName;
	}
	public void setBasName(String basicName) {
		this.basName = basicName;
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
				+ ", basLng=" + basLng + "]";
	}
}