package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AppCom implements java.io.Serializable {
	private int itemId;
	private String itemType;
	private int itemMemberNo;
	private String memberName;
	private Date itemAppDate;
	private String appResult;
}
