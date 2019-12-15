package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements java.io.Serializable{
	private int atid;
	private String atName;
	private String atRename;
	private String atPath;
	private Date uploadDate;
	private int fileLevel;
	private int refItem;
	private int refApp;
	private int refBoard;
	private String type;
}
