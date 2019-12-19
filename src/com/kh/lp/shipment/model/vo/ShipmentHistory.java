package com.kh.lp.shipment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ShipmentHistory {
	private int shipmentHistoryId;
	private Date shipmentHistoryDate;
	private String shipmentHistoryType;
	private int waybill;

}
