package com.kh.lp.appraisal.model.vo;

public class Bag implements java.io.Serializable {
	private int bagId;
	private String bagSize;
	private String bagStrap;
	private String gender;
	
	public Bag() {}

	public Bag(int bagId, String bagSize, String bagStrap, String gender) {
		super();
		this.bagId = bagId;
		this.bagSize = bagSize;
		this.bagStrap = bagStrap;
		this.gender = gender;
	}

	public int getBagId() {
		return bagId;
	}

	public void setBagId(int bagId) {
		this.bagId = bagId;
	}

	public String getBagSize() {
		return bagSize;
	}

	public void setBagSize(String bagSize) {
		this.bagSize = bagSize;
	}

	public String getBagStrap() {
		return bagStrap;
	}

	public void setBagStrap(String bagStrap) {
		this.bagStrap = bagStrap;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Bag [bagId=" + bagId + ", bagSize=" + bagSize + ", bagStrap=" + bagStrap + ", gender=" + gender + "]";
	}
	
	
}
