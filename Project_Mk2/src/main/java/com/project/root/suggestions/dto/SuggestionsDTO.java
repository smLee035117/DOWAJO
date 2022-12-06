package com.project.root.suggestions.dto;

import java.sql.Timestamp;

/*CREATE TABLE SUG_BOARD (
		SUG_NO	NUMBER(5)	NOT NULL,
		SUG_SUBJECT	VARCHAR2(100)	NOT NULL,
		SUG_CONTENT	NVARCHAR2(2000)	NOT NULL,
		SUG_REG_DATE	DATE DEFAULT SYSDATE,
	    SUG_READ_CK VARCHAR2(1)
	);*/

public class SuggestionsDTO {
	private int sugNo;
	private String sugSubject;
	private String sugContent;
	private Timestamp sugRegDate;
	private String sugReadCk;
	
	public int getSugNo() {
		return sugNo;
	}
	public void setSugNo(int sugNo) {
		this.sugNo = sugNo;
	}
	public String getSugSubject() {
		return sugSubject;
	}
	public void setSugSubject(String sugSubject) {
		this.sugSubject = sugSubject;
	}
	public String getSugContent() {
		return sugContent;
	}
	public void setSugContent(String sugContent) {
		this.sugContent = sugContent;
	}
	public Timestamp getSugRegDate() {
		return sugRegDate;
	}
	public void setSugRegDate(Timestamp sugRegDate) {
		this.sugRegDate = sugRegDate;
	}
	public String getSugReadCk() {
		return sugReadCk;
	}
	public void setSugReadCk(String sugReadCk) {
		this.sugReadCk = sugReadCk;
	}
	@Override
	public String toString() {
		return "SuggestionsDTO [sugNo=" + sugNo + ", sugSubject=" + sugSubject + ", sugContent=" + sugContent
				+ ", sugRegDate=" + sugRegDate + ", sugReadCk=" + sugReadCk + "]";
	}	
}
