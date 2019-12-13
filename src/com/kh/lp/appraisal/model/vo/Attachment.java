package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable{
	
	
	private int atid;
	private String atName;
	private String atRename;
	private String atPath;
	private Date uploadDate;
	private int fileLevel;
	private int refItem;
	private int refApp;
	private int refBoard;
	private String type;
	
	public Attachment() {}

	public Attachment(int atid, String atName, String atRename, String atPath, Date uploadDate, int fileLevel,
			int refItem, int refApp, int refBoard, String type) {
		super();
		this.atid = atid;
		this.atName = atName;
		this.atRename = atRename;
		this.atPath = atPath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.refItem = refItem;
		this.refApp = refApp;
		this.refBoard = refBoard;
		this.type = type;
	}

	public int getAtid() {
		return atid;
	}

	public void setAtid(int atid) {
		this.atid = atid;
	}

	public String getAtName() {
		return atName;
	}

	public void setAtName(String atName) {
		this.atName = atName;
	}

	public String getAtRename() {
		return atRename;
	}

	public void setAtRename(String atRename) {
		this.atRename = atRename;
	}

	public String getAtPath() {
		return atPath;
	}

	public void setAtPath(String atPath) {
		this.atPath = atPath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getRefItem() {
		return refItem;
	}

	public void setRefItem(int refItem) {
		this.refItem = refItem;
	}

	public int getRefApp() {
		return refApp;
	}

	public void setRefApp(int refApp) {
		this.refApp = refApp;
	}

	public int getRefBoard() {
		return refBoard;
	}

	public void setRefBoard(int refBoard) {
		this.refBoard = refBoard;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Attachment [atid=" + atid + ", atName=" + atName + ", atRename=" + atRename + ", atPath=" + atPath
				+ ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", refItem=" + refItem + ", refApp="
				+ refApp + ", refBoard=" + refBoard + ", type=" + type + "]";
	}

		
	
}
