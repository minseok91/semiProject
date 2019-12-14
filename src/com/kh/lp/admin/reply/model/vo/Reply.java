package com.kh.lp.admin.reply.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int replyId;
	private int replyBoardId;
	private int replyMemberNo;
	private Date replyDate;
	private String replyStatus;
	private String replyContent;
}
