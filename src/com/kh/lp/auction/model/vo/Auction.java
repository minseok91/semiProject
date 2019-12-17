package com.kh.lp.auction.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Auction implements java.io.Serializable {
	private int auctionId;
	private int auctionCount;
	private int auctionStartPrice;
	private int auctionMemberNo;
	private Date auctionStartTime;
	private int auctionPeriod;
	private Date auctionAppDate;
	private int auctionAr1Id;
}
