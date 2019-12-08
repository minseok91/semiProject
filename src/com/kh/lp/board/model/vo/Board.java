package com.kh.lp.board.model.vo;

import java.sql.Date;

public class Board {
	private int bid;
	private int btype;
	private int bno;
	private int cid;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bCount;
	private int refBid;
	private int replyLevel;
	private Date bDate;
	private Date modifyDate;
	private String status;
	
	public Board () {}

	public Board(int bid, int btype, int bno, int cid, String bTitle, String bContent, String bWriter, int bCount,
			int refBid, int replyLevel, Date bDate, Date modifyDate, String status) {
		super();
		this.bid = bid;
		this.btype = btype;
		this.bno = bno;
		this.cid = cid;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.refBid = refBid;
		this.replyLevel = replyLevel;
		this.bDate = bDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public int getReplyLevel() {
		return replyLevel;
	}

	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", btype=" + btype + ", bno=" + bno + ", cid=" + cid + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bWriter=" + bWriter + ", bCount=" + bCount + ", refBid=" + refBid
				+ ", replyLevel=" + replyLevel + ", bDate=" + bDate + ", modifyDate=" + modifyDate + ", status="
				+ status + "]";
	}
	
	
}
