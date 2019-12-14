package com.kh.lp.admin.board.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardNo;
	private int boardId;
	private int boardMemberNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardCount;
	private String boardType;
	private String boardStatus;
	private Date boardModifyDate;
	private String boardMemberName;
	
	
	
	
}
