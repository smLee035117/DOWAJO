package com.project.root.restdata.dto;

public class BasicRestDataDTO {
	  private String basNo;
	   private int catNo;
	   private String basName;
	   private String basAddr;
	   private String basLat;
	   private String basLng;
	   private int restNo;
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
	      return "BasicRestDataDTO [basNo=" + basNo + ", catNo=" + catNo + ", basName=" + basName + ", basAddr=" + basAddr
	            + ", basLat=" + basLat + ", basLng=" + basLng + ", restNo=" + restNo + ", restOpenTime=" + restOpenTime
	            + ", restLock=" + restLock + ", restTol=" + restTol + ", restUri=" + restUri + ", restDisTol="
	            + restDisTol + ", restDisUri=" + restDisUri + ", restClTime=" + restClTime + ", restStatus="
	            + restStatus + ", restKey=" + restKey + "]";
	   }

	
}
