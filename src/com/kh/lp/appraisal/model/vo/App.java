package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class App implements java.io.Serializable {
	private int appId;
	private int appItemId;
	private String appNote;
	private String appResult;
	private Date appDate;
}
