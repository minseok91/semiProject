package com.kh.lp.shipment.model.service;


import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.shipment.model.dao.ShipmentDao;
import com.kh.lp.shipment.model.vo.Shipment;
import com.kh.lp.shipment.model.vo.ShipmentHistory;

/**
 * @author apple
 *
 */
public class ShipmentService {

	/**
	 * @Author      : minseok
	 * @Description : shipment 총 갯수 가져오는 메소드
	 * @CreateDate  : Dec 19, 2019
	 * @ModifyDate  : Dec 19, 2019
	 */
	public int listCount() {
		Connection con = getConnection();
		
		int result = new ShipmentDao().listCount(con);
		
		close(con);
		
		return result;
	}
	
	/**
	 * @Author      : minseok
	 * @Description : shipment 페이징하는 메소드
	 * @CreateDate  : Dec 19, 2019
	 * @ModifyDate  : Dec 19, 2019
	 */
	public ArrayList<Shipment> smPaging(int currentPage, int limit) {
		
		
		Connection con = getConnection();
		
		ArrayList<Shipment> list = new ShipmentDao().smPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	

	/**
	 * @Author      : minseok
	 * @Description : 운송장 정보 입력하는 메소드
	 * @CreateDate  : Dec 19, 2019
	 * @ModifyDate  : Dec 19, 2019
	 */
	public int insertWaybill(int waybill, int memberShipmentId) {
		Connection con = getConnection();
		
		int result = new ShipmentDao().insertWaybill(con, waybill, memberShipmentId);
		
		if(result > 0) {
			
			int result1 = new ShipmentDao().insertShipmentHistory(con, waybill);
			if(result1 > 0) {
				commit(con);
			} else {
				rollBack(con);
			}
		} else {
			rollBack(con);
		}
		
		close(con);
		return result;
	}

	/**
	 * @Author      : minseok
	 * @Description : 배송정보 이력 개수 가져오는 메소드
	 * @CreateDate  : Dec 19, 2019
	 * @ModifyDate  : Dec 19, 2019
	 */
	public int listCountHistory() {
		Connection con = getConnection();
		
		int result = new ShipmentDao().listCountHistory(con);
		
		close(con);
		
		return result;
	}
	
	
	
	
	
	
	/**
	 * @Author      : minseok
	 * @Description : 배송정보 이력 페이징 리스트 가져오는 메소드
	 * @CreateDate  : Dec 19, 2019
	 * @ModifyDate  : Dec 19, 2019
	 */
	public ArrayList<ShipmentHistory> shPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<ShipmentHistory> list = new ShipmentDao().shPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
