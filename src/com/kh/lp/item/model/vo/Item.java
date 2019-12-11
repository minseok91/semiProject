package com.kh.lp.item.model.vo;

import java.sql.Date;

public class Item implements java.io.Serializable {
	
	
	private int itemId;
	private String itemMemberNo;
	private String itemType;
	private String itemBrandModel;
	private Date itemPurDate;
	private String itemWarrantyYn;
	private String itemDetail;
	private Date itemAppDate;
	
	public Item () {}

	public Item(int itemId, String itemMemberNo, String itemType, String itemBrandModel, Date itemPurDate,
			String itemWarrantyYn, String itemDetail, Date itemAppDate) {
		super();
		this.itemId = itemId;
		this.itemMemberNo = itemMemberNo;
		this.itemType = itemType;
		this.itemBrandModel = itemBrandModel;
		this.itemPurDate = itemPurDate;
		this.itemWarrantyYn = itemWarrantyYn;
		this.itemDetail = itemDetail;
		this.itemAppDate = itemAppDate;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemMemberNo() {
		return itemMemberNo;
	}

	public void setItemMemberNo(String itemMemberNo) {
		this.itemMemberNo = itemMemberNo;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getItemBrandModel() {
		return itemBrandModel;
	}

	public void setItemBrandModel(String itemBrandModel) {
		this.itemBrandModel = itemBrandModel;
	}

	public Date getItemPurDate() {
		return itemPurDate;
	}

	public void setItemPurDate(Date itemPurDate) {
		this.itemPurDate = itemPurDate;
	}

	public String getItemWarrantyYn() {
		return itemWarrantyYn;
	}

	public void setItemWarrantyYn(String itemWarrantyYn) {
		this.itemWarrantyYn = itemWarrantyYn;
	}

	public String getItemDetail() {
		return itemDetail;
	}

	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}

	public Date getItemAppDate() {
		return itemAppDate;
	}

	public void setItemAppDate(Date itemAppDate) {
		this.itemAppDate = itemAppDate;
	}

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemMemberNo=" + itemMemberNo + ", itemType=" + itemType
				+ ", itemBrandModel=" + itemBrandModel + ", itemPurDate=" + itemPurDate + ", itemWarrantyYn="
				+ itemWarrantyYn + ", itemDetail=" + itemDetail + ", itemAppDate=" + itemAppDate + "]";
	}

	
	

}
