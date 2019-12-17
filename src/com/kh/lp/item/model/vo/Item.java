package com.kh.lp.item.model.vo;

import java.sql.Date;
import com.kh.lp.item.model.vo.Item;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Item implements java.io.Serializable {
	private int itemId;
	private int itemMemberNo;
	private String itemType;
	private String itemBrandModel;
	private Date itemPurDate;
	private String itemWarrantyYn;
	private String itemDetail;
	private Date itemAppDate;
}
