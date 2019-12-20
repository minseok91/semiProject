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
	private int rowNum;
	private int reportId;
	private int reportingMemberId;
	private int reportedMemberId;
	private String reportContent;
	private Date reportDate;
	private int reportBoard;
	private int reportReply;
	private String reportType;
	private String reportingName;
	private String reportedName;
	private String boardTitle;
	private String boardType;
	
	public Report() {}
}


