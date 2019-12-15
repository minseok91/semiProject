package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item implements java.io.Serializable {
	private String itemId;
	private String itemMemberNo;
	private String itemType;
	private String itemBrandModel;
	private Date itemPurDate;
	private String itemWarrantyYn;
	private String itemDetail;
	private Date itemAppDate;
}
