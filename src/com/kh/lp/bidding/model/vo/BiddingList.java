package com.kh.lp.bidding.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 18
 * @ModifyDate    : 2019. 12. 18
 * @Description   :  유저페이지 입찰리스트용 vo
 * @param
 * @return
 */
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


