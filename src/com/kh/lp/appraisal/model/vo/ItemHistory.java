package com.kh.lp.appraisal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemHistory implements java.io.Serializable {
	private int itemHistoryId;
	private Date itemHistoryDate;
	private String itemHistoryStatus;
	private int itemId;
}
