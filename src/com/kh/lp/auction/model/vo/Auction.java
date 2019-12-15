package com.kh.lp.auction.model.vo;

import java.sql.Date;

public class Auction implements java.io.Serializable {
	
	private int auctionId;
	private int count;
	private int auStartPrice;
	private int memberNo;
	private Date auStartTime;
	private int auPeriod;
	private int auAppId;
	
	public Auction() {}

	public Auction(int auctionId, int count, int auStartPrice, int memberNo, Date auStartTime, int auPeriod,
			int auAppId) {
		super();
		this.auctionId = auctionId;
		this.count = count;
		this.auStartPrice = auStartPrice;
		this.memberNo = memberNo;
		this.auStartTime = auStartTime;
		this.auPeriod = auPeriod;
		this.auAppId = auAppId;
	}

	public int getAuctionId() {
		return auctionId;
	}

	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getAuStartPrice() {
		return auStartPrice;
	}

	public void setAuStartPrice(int auStartPrice) {
		this.auStartPrice = auStartPrice;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getAuStartTime() {
		return auStartTime;
	}

	public void setAuStartTime(Date auStartTime) {
		this.auStartTime = auStartTime;
	}

	public int getAuPeriod() {
		return auPeriod;
	}

	public void setAuPeriod(int auPeriod) {
		this.auPeriod = auPeriod;
	}

	public int getAuAppId() {
		return auAppId;
	}

	public void setAuAppId(int auAppId) {
		this.auAppId = auAppId;
	}

	@Override
	public String toString() {
		return "Auction [auctionId=" + auctionId + ", count=" + count + ", auStartPrice=" + auStartPrice + ", memberNo="
				+ memberNo + ", auStartTime=" + auStartTime + ", auPeriod=" + auPeriod + ", auAppId=" + auAppId + "]";
	}
}
