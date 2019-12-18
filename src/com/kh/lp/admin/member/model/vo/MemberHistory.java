package com.kh.lp.admin.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberHistory {
	private String memberHistoryId;
	private int memberNo;
	private Date memberHistoryDate;
	private String memberHistoryType;
	private String memberHistoryDetail;
}
