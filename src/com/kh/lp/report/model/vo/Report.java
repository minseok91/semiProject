package com.kh.lp.report.model.vo;

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
	private String report_id;
	private String reporting_member_no;
	private String reported_member_no;
	private String reported_content;
	private Date report_date;
	private String report_subject;
	private String report_type;
	
	public Report() {}
}
