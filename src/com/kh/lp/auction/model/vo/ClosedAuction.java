package com.kh.lp.auction.model.vo;


import java.sql.Date;
import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 19
 * @ModifyDate    : 2019. 12. 19
 * @Description   :  유저페이지 경매마감상품관리용 vo
 * @param
 * @return
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClosedAuction {
	
	private int auctionId;
	private String attachmentRename;
	private String ar1Brand;
	private String ar1Model;
	private int winStatus;
	private int winPrice;
	private int winSecondPrice;
	private int currentPrice;
	private String auctionHistoryType;
	private int auctionCount;
	private String moneyStatus;
	
}






































