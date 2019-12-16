package com.kh.lp.auction.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuctionList {
	private int auctionId;
	private String auctionType;
	private int auctionCount;

}
