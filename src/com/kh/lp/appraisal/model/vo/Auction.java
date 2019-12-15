package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Auction {
	private int auctionId;
	private int auctionCount;
	private int auctionStartPrice;
	private int auctionMemberNo;
	private Date auctionStartTime;
	private int auctionPeriod;
	private int auctionAppId;
	private Date auctionAppDate;
}
