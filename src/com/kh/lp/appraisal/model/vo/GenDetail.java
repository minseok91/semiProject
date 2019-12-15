package com.kh.lp.appraisal.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenDetail implements java.io.Serializable{
	private int genId;
	private int appResultNo;
	private String brand;
	private String modelName;
	private int appPrice;
}
