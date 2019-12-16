package com.kh.lp.admin.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class Report {
	private int rnum;
	private int reportId;
	private int reporting;
	private int reported;
	private String reportcontent;
	private Date reportDate;
	private int reportBoard;
	private int reportReply;
	private String reportType;
	
	public Report() {}
}
