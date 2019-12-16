package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements java.io.Serializable{
	private int attachmentId;
	private String attachmentName;
	private String attachmentRename;
	private String attachmentPath;
	private Date attachmentUploadDate;
	private int attachmentFileLevel;
	private int attachmentRefItem;
	private int attachmentRefApp;
	private int attachmentRefBoard;
	private String attachmentType;
}





