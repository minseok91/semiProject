package com.kh.lp.bidding.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BiddingList implements Serializable {
	
	private int biddingMemberNo;
	private int biddingAuctionId;
	private int biddingMemberPrice;
	private String model;
	private String brand;
	private String thumbnailRename;
	private int biddingMaxPrice;
	
}


