package com.kh.lp.auction.model.vo;

import java.sql.Date;
import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BiddingHistory {
	private int biddingId;
	private int biddingAuctionId;
	private String biddingMemberId;
	private int biddingCount;
	private int biddingPrice;
	private Date biddingDate;
	private Time biddingTime;

}
