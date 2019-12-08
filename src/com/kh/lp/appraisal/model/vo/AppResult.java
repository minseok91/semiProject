package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

public class AppResult {
	
	private int appResultNo;
	private int appId;
	private String genStatus;
	private int attachId;
	private String detailDesc;
	private Date resultDate;
	
	public AppResult() {}

	public AppResult(int appResultNo, int appId, String genStatus, int attachId, String detailDesc, Date resultDate) {
		super();
		this.appResultNo = appResultNo;
		this.appId = appId;
		this.genStatus = genStatus;
		this.attachId = attachId;
		this.detailDesc = detailDesc;
		this.resultDate = resultDate;
	}

	public int getAppResultNo() {
		return appResultNo;
	}

	public void setAppResultNo(int appResultNo) {
		this.appResultNo = appResultNo;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getGenStatus() {
		return genStatus;
	}

	public void setGenStatus(String genStatus) {
		this.genStatus = genStatus;
	}

	public int getAttachId() {
		return attachId;
	}

	public void setAttachId(int attachId) {
		this.attachId = attachId;
	}

	public String getDetailDesc() {
		return detailDesc;
	}

	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}

	public Date getResultDate() {
		return resultDate;
	}

	public void setResultDate(Date resultDate) {
		this.resultDate = resultDate;
	}

	@Override
	public String toString() {
		return "AppResult [appResultNo=" + appResultNo + ", appId=" + appId + ", genStatus=" + genStatus + ", attachId="
				+ attachId + ", detailDesc=" + detailDesc + ", resultDate=" + resultDate + "]";
	}
	
	
}
