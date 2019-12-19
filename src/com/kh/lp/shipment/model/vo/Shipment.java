package com.kh.lp.shipment.model.vo;

import java.sql.Date;
import java.sql.Time;

import com.kh.lp.auction.model.vo.BiddingHistory;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Shipment {
	private int memberShipmentId;
	private int memberNo;
	private String memberShipmentReceiverName;
	private String memberShipmentReceiverPhone;
	private String memberShipmentReceiverEmail;
	private String memberShipmentReceiverAddress;
	private int memberShipmentItem;
	private int memberShipmentApp;
	private int memberShipmentAuction;
	private String memberShipmentType;
	private int ShipmentWaybill;

}
