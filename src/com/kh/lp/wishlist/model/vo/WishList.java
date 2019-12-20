package com.kh.lp.wishlist.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WishList {
	
	private int auctionId;
	private String attachmentRename;
	private String ar1Brand;
	private String ar2Model;
	private Date auctionStartDate;
	private int auctionPeriod;
	
	
}
