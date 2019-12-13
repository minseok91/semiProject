package com.kh.lp.appraisal.model.vo;

public class Watch implements java.io.Serializable{
	
	private int watchId;
	private String watchGuaranteeYn;
	private String watchMaterial;
	private String watchMovement;
	private String watchChronograph;
	private String watchBoxYn;
	
	
	public Watch() {}


	public Watch(int watchId, String watchGuaranteeYn, String watchMaterial, String watchMovement,
			String watchChronograph, String watchBoxYn) {
		super();
		this.watchId = watchId;
		this.watchGuaranteeYn = watchGuaranteeYn;
		this.watchMaterial = watchMaterial;
		this.watchMovement = watchMovement;
		this.watchChronograph = watchChronograph;
		this.watchBoxYn = watchBoxYn;
	}


	public int getWatchId() {
		return watchId;
	}


	public void setWatchId(int watchId) {
		this.watchId = watchId;
	}


	public String getWatchGuaranteeYn() {
		return watchGuaranteeYn;
	}


	public void setWatchGuaranteeYn(String watchGuaranteeYn) {
		this.watchGuaranteeYn = watchGuaranteeYn;
	}


	public String getWatchMaterial() {
		return watchMaterial;
	}


	public void setWatchMaterial(String watchMaterial) {
		this.watchMaterial = watchMaterial;
	}


	public String getWatchMovement() {
		return watchMovement;
	}


	public void setWatchMovement(String watchMovement) {
		this.watchMovement = watchMovement;
	}


	public String getWatchChronograph() {
		return watchChronograph;
	}


	public void setWatchChronograph(String watchChronograph) {
		this.watchChronograph = watchChronograph;
	}


	public String getWatchBoxYn() {
		return watchBoxYn;
	}


	public void setWatchBoxYn(String watchBoxYn) {
		this.watchBoxYn = watchBoxYn;
	}


	@Override
	public String toString() {
		return "Watch [watchId=" + watchId + ", watchGuaranteeYn=" + watchGuaranteeYn + ", watchMaterial="
				+ watchMaterial + ", watchMovement=" + watchMovement + ", watchChronograph=" + watchChronograph
				+ ", watchBoxYn=" + watchBoxYn + "]";
	}
	
	
	
}
