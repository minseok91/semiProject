package com.kh.lp.bidding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BiddingList {
	
	private int biddingMemberNo;
	private int biddingAuctionId;
	private int biddingMemberPrice;
	private String model;
	private String brand;
	private String thumbnailRename;
	private int biddingMaxPrice;
	
}


