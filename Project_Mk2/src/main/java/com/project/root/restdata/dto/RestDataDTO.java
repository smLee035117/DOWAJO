package com.project.root.restdata.dto;

public class RestDataDTO {
	private int restNo;
	private String basNo;
	private String restOpenTime;
	private String restLock;
	private int restTol;
	private int restUri;
	private int restDisTol;
	private int restDisUri;
	private String restClTime;
	private String restStatus;
	private String restKey;
	
	
	public int getRestNo() {
		return restNo;
	}
	public void setRestNo(int restNo) {
		this.restNo = restNo;
	}
	public String getBasNo() {
		return basNo;
	}
	public void setBasNo(String basNo) {
		this.basNo = basNo;
	}
	public String getRestOpenTime() {
		return restOpenTime;
	}
	public void setRestOpenTime(String restOpenTime) {
		this.restOpenTime = restOpenTime;
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
	public int getRestDisTol() {
		return restDisTol;
	}
	public void setRestDisTol(int restDisTol) {
		this.restDisTol = restDisTol;
	}
	public int getRestDisUri() {
		return restDisUri;
	}
	public void setRestDisUri(int restDisUri) {
		this.restDisUri = restDisUri;
	}
	public String getRestClTime() {
		return restClTime;
	}
	public void setRestClTime(String restClTime) {
		this.restClTime = restClTime;
	}
	public String getRestStatus() {
		return restStatus;
	}
	public void setRestStatus(String restStatus) {
		this.restStatus = restStatus;
	}
	public String getRestKey() {
		return restKey;
	}
	public void setRestKey(String restKey) {
		this.restKey = restKey;
	}
	@Override
	public String toString() {
		return "RestDataDTO [restNo=" + restNo + ", basNo=" + basNo + ", restOpenTime=" + restOpenTime + ", restLock="
				+ restLock + ", restTol=" + restTol + ", restUri=" + restUri + ", restDisTol=" + restDisTol
				+ ", restDisUri=" + restDisUri + ", restClTime=" + restClTime + ", restStatus=" + restStatus
				+ ", restKey=" + restKey + "]";
	}
	
	
}
