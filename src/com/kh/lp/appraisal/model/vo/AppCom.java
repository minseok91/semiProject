package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

public class AppCom implements java.io.Serializable {
	
	private int itemId;
	private String itemType;
	private int itemMemberNo;
	private String memberName;
	private Date itemAppDate;
	private String appResult;
	
	public AppCom() {}

	public AppCom(int itemId, String itemType, int itemMemberNo, String memberName, Date itemAppDate,
			String appResult) {
		super();
		this.itemId = itemId;
		this.itemType = itemType;
		this.itemMemberNo = itemMemberNo;
		this.memberName = memberName;
		this.itemAppDate = itemAppDate;
		this.appResult = appResult;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public int getItemMemberNo() {
		return itemMemberNo;
	}

	public void setItemMemberNo(int itemMemberNo) {
		this.itemMemberNo = itemMemberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getItemAppDate() {
		return itemAppDate;
	}

	public void setItemAppDate(Date itemAppDate) {
		this.itemAppDate = itemAppDate;
	}

	public String getAppResult() {
		return appResult;
	}

	public void setAppResult(String appResult) {
		this.appResult = appResult;
	}

	@Override
	public String toString() {
		return "AppCom [itemId=" + itemId + ", itemType=" + itemType + ", itemMemberNo=" + itemMemberNo
				+ ", memberName=" + memberName + ", itemAppDate=" + itemAppDate + ", appResult=" + appResult + "]";
	}

	
	
}
