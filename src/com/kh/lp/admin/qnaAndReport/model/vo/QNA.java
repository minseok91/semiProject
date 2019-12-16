package com.kh.lp.admin.qnaAndReport.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QNA {
	private int qnaId;
	private int qnaMemberNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
}
