package com.kh.lp.money.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Money {
	private String impId;
	private int memberNo;
	private String merId;
	private int amount;
}
