package com.kh.lp.admin.qnaAndReport.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QNA {
	private int rnum;
	private int qnaId;
	private int qnaMemberNo;
	private String memberId;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnastatus;
}
