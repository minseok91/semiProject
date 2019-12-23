package com.kh.lp.money.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MoneyDetail {
	private int auctionId;
	private String memberName;
	private String phone;
	private String address;
	private String brand;
	private String model;
	private int price;
	private double priceFee;
	

}
