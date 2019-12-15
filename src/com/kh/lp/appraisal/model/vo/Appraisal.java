package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Appraisal implements java.io.Serializable {
	
	private int itemNo;
	private String seller;
	private String kind;
	private String brand;
	private String modelName;
	private Date purDate;
	private String warranty;
	private String detailDesc;
	private Date appDate;
	private int attachId;
	private String refundYn;
	
	
}
