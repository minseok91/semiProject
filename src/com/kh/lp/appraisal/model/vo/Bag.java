package com.kh.lp.appraisal.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bag implements java.io.Serializable {
	private int bagId;
	private String bagSize;
	private String bagStrap;
	private String gender;
}
