package com.project.root.review.dto;

import java.sql.Timestamp;

public class ReviewDTO {
	private int reNo;
	private String basNo;
	private int reSco;
	private String reContent;
	private Timestamp reRegDate;
	
	
	public Timestamp getReRegDate() {
		return reRegDate;
	}
	public void setReRegDate(Timestamp reRegDate) {
		this.reRegDate = reRegDate;
	}
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public String getBasNo() {
		return basNo;
	}
	public void setBasNo(String basNo) {
		this.basNo = basNo;
	}
	public int getReSco() {
		return reSco;
	}
	public void setReSco(int reSco) {
		this.reSco = reSco;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	@Override
	public String toString() {
		return "ReviewDTO [reNo=" + reNo + ", basNo=" + basNo + ", reSco=" + reSco + ", reContent=" + reContent
				+ ", reRegDate=" + reRegDate + "]";
	}

	
	
}
