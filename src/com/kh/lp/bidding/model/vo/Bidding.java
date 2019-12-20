package com.kh.lp.bidding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bidding {
	private int biddingId;
	private int biddingAuctionId;
	private int biddingMemberNo;
	private int biddingCount;
	private int biddingPrice;
	private int biddingTime;
}
