package com.kh.lp.appraisal.model.vo;

public class App implements java.io.Serializable {
	
	private int appId;
	private int appItemId;
	private String appNote;
	private String appResult;
	
	public App() {}

	public App(int appId, int appItemId, String appNote, String appResult) {
		super();
		this.appId = appId;
		this.appItemId = appItemId;
		this.appNote = appNote;
		this.appResult = appResult;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public int getAppItemId() {
		return appItemId;
	}

	public void setAppItemId(int appItemId) {
		this.appItemId = appItemId;
	}

	public String getAppNote() {
		return appNote;
	}

	public void setAppNote(String appNote) {
		this.appNote = appNote;
	}

	public String getAppResult() {
		return appResult;
	}

	public void setAppResult(String appResult) {
		this.appResult = appResult;
	}

	@Override
	public String toString() {
		return "App [appId=" + appId + ", appItemId=" + appItemId + ", appNote=" + appNote + ", appResult=" + appResult
				+ "]";
	}

	
	
	
	
	
}
