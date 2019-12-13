package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

public class ItemHistory implements java.io.Serializable {
	
//	ITEM_HISTORY_ID
//	ITEM_HISTORY_DATE
//	ITEM_HISTORY_STATUS
//	ITEM_ID
	private int itemHistoryId;
	private Date itemHistoryDate;
	private String itemHistoryStatus;
	private int itemId;
	
	public ItemHistory () {}

	public ItemHistory(int itemHistoryId, Date itemHistoryDate, String itemHistoryStatus, int itemId) {
		super();
		this.itemHistoryId = itemHistoryId;
		this.itemHistoryDate = itemHistoryDate;
		this.itemHistoryStatus = itemHistoryStatus;
		this.itemId = itemId;
	}

	public int getItemHistoryId() {
		return itemHistoryId;
	}

	public void setItemHistoryId(int itemHistoryId) {
		this.itemHistoryId = itemHistoryId;
	}

	public Date getItemHistoryDate() {
		return itemHistoryDate;
	}

	public void setItemHistoryDate(Date itemHistoryDate) {
		this.itemHistoryDate = itemHistoryDate;
	}

	public String getItemHistoryStatus() {
		return itemHistoryStatus;
	}

	public void setItemHistoryStatus(String itemHistoryStatus) {
		this.itemHistoryStatus = itemHistoryStatus;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	@Override
	public String toString() {
		return "ItemHistory [itemHistoryId=" + itemHistoryId + ", itemHistoryDate=" + itemHistoryDate
				+ ", itemHistoryStatus=" + itemHistoryStatus + ", itemId=" + itemId + "]";
	}
	
	

}
