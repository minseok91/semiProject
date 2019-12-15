package com.kh.lp.appraisal.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AR1 implements java.io.Serializable {
	
	private int appId;
	private String brand;
	private String model;
	private int price;
	private int watchId;
	private int bagId;
	private String condition;
	
	
	
}
