package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

public class Appraisal implements java.io.Serializable {
	
	private int itemNo;
	private String seller;
	private String kind;
	private String brand;
	private String modelName;
	private Date purDate;
	private String warranty;
	private String detailDesc;
	private Date appDate;
	private int attachId;
	private String refundYn;
	
	public Appraisal() {}

	public Appraisal(int itemNo, String seller, String kind, String brand, String modelName, Date purDate,
			String warranty, String detailDesc, Date appDate, int attachId, String refundYn) {
		super();
		this.itemNo = itemNo;
		this.seller = seller;
		this.kind = kind;
		this.brand = brand;
		this.modelName = modelName;
		this.purDate = purDate;
		this.warranty = warranty;
		this.detailDesc = detailDesc;
		this.appDate = appDate;
		this.attachId = attachId;
		this.refundYn = refundYn;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public Date getPurDate() {
		return purDate;
	}

	public void setPurDate(Date purDate) {
		this.purDate = purDate;
	}

	public String getWarranty() {
		return warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	public String getDetailDesc() {
		return detailDesc;
	}

	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public int getAttachId() {
		return attachId;
	}

	public void setAttachId(int attachId) {
		this.attachId = attachId;
	}

	public String getRefundYn() {
		return refundYn;
	}

	public void setRefundYn(String refundYn) {
		this.refundYn = refundYn;
	}

	@Override
	public String toString() {
		return "Appraisal [itemNo=" + itemNo + ", seller=" + seller + ", kind=" + kind + ", brand=" + brand
				+ ", modelName=" + modelName + ", purDate=" + purDate + ", warranty=" + warranty + ", detailDesc="
				+ detailDesc + ", appDate=" + appDate + ", attachId=" + attachId + ", refundYn=" + refundYn + "]";
	}
	
	
	
}
