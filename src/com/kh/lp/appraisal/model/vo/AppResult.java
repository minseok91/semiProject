package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AppResult {
	private int appResultNo;
	private int appId;
	private String genStatus;
	private int attachId;
	private String detailDesc;
	private Date resultDate;
}
