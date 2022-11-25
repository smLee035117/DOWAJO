package com.project.root.restdata.dto;

public class RestDataDTO {
	private int restNo;
	private String basNo;
	private String restOpenTime;
	private String restLock;
	private int restToi;
	private int restUri;
	private int restDisToi;
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
	public int getRestToi() {
		return restToi;
	}
	public void setRestToi(int restToi) {
		this.restToi = restToi;
	}
	public int getRestUri() {
		return restUri;
	}
	public void setRestUri(int restUri) {
		this.restUri = restUri;
	}
	public int getRestDisToi() {
		return restDisToi;
	}
	public void setRestDisToi(int restDisToi) {
		this.restDisToi = restDisToi;
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
				+ restLock + ", restToi=" + restToi + ", restUri=" + restUri + ", restDisToi=" + restDisToi
				+ ", restDisUri=" + restDisUri + ", restClTime=" + restClTime + ", restStatus=" + restStatus
				+ ", restKey=" + restKey + "]";
	}
	
	
}
