package com.kh.lp.win.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Win {
	private int winAuctionId;
	private int winMemberNo;
	private int winPrice;
	private int winSecondMemberNo;
	private int winsecondPrice;
	private String winStatus; // WIN_STATUS_CODE 테이블과 조인
}
