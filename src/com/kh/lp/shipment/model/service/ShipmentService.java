package com.kh.lp.shipment.model.service;


import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.shipment.model.dao.ShipmentDao;
import com.kh.lp.shipment.model.vo.Shipment;

public class ShipmentService {

	public int listCount() {
		Connection con = getConnection();
		
		int result = new ShipmentDao().listCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Shipment> smPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Shipment> list = new ShipmentDao().smPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
