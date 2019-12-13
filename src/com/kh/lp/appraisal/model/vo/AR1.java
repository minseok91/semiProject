package com.kh.lp.appraisal.model.vo;

public class AR1 implements java.io.Serializable {
	
	private int appId;
	private String brand;
	private String model;
	private int price;
	private int watchId;
	private int bagId;
	private String condition;
	
	public AR1 () {}

	public AR1(int appId, String brand, String model, int price, int watchId, int bagId, String condition) {
		super();
		this.appId = appId;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.watchId = watchId;
		this.bagId = bagId;
		this.condition = condition;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getWatchId() {
		return watchId;
	}

	public void setWatchId(int watchId) {
		this.watchId = watchId;
	}

	public int getBagId() {
		return bagId;
	}

	public void setBagId(int bagId) {
		this.bagId = bagId;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	@Override
	public String toString() {
		return "AR1 [appId=" + appId + ", brand=" + brand + ", model=" + model + ", price=" + price + ", watchId="
				+ watchId + ", bagId=" + bagId + ", condition=" + condition + "]";
	}
	
	
}
