package com.kh.lp.bidding.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bid {
	private int bidId;
	private int bidAuctionId;
	private int bidPrice;
	private String bidAttachment; // 이미지이름(변경된 이름 기준)
	private String bidBrand;
	private String bidModel;
	private Date bidAuctionStartTime; // 경매시작시간
	private int bidAuctionPeriod; // 경매기간
	private String bidUserId;
}
