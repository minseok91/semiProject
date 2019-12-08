package com.kh.lp.appraisal.model.vo;

public class GenDetail implements java.io.Serializable{
	private int genId;
	private int appResultNo;
	private String brand;
	private String modelName;
	private int appPrice;
	
	public GenDetail () {}

	public GenDetail(int genId, int appResultNo, String brand, String modelName, int appPrice) {
		super();
		this.genId = genId;
		this.appResultNo = appResultNo;
		this.brand = brand;
		this.modelName = modelName;
		this.appPrice = appPrice;
	}

	public int getGenId() {
		return genId;
	}

	public void setGenId(int genId) {
		this.genId = genId;
	}

	public int getAppResultNo() {
		return appResultNo;
	}

	public void setAppResultNo(int appResultNo) {
		this.appResultNo = appResultNo;
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

	public int getAppPrice() {
		return appPrice;
	}

	public void setAppPrice(int appPrice) {
		this.appPrice = appPrice;
	}

	@Override
	public String toString() {
		return "GenDetail [genId=" + genId + ", appResultNo=" + appResultNo + ", brand=" + brand + ", modelName="
				+ modelName + ", appPrice=" + appPrice + "]";
	}
	
	
	

}
