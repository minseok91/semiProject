package com.kh.lp.win.model.vo;

import java.sql.Date;

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
	private String attRename; // 테스트
	private Date winDate; // 테스트
	private String winBrand;
	private String winModel;
	private String winnerName;
	private String winner2ndName;
}
