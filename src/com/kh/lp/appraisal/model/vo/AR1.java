package com.kh.lp.appraisal.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AR1 implements java.io.Serializable {
	
	private int ar1Id;
	private String ar1Brand;
	private String ar1Model;
	private int ar1Price;
	private int ar1WatchDetail;
	private int ar1BagDetail;
	private String ar1Condition;
}
