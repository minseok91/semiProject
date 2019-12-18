package com.kh.lp.bidding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BiddingList {
	
	private int biddingId;
	private int biddingAuctionId;
	private int biddingMemberNo;
	private int biddingMemberPrice;
	private int biddingHighestPrice;
	private String brandModel;
	private String thumbnailRename;
	
}


