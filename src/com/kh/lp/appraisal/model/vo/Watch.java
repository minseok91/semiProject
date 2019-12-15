package com.kh.lp.appraisal.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Watch implements java.io.Serializable{
	private int watchId;
	private String watchGuaranteeYn;
	private String watchMaterial;
	private String watchMovement;
	private String watchChronograph;
	private String watchBoxYn;
}
