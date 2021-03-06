package com.kh.lp.shipment.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.shipment.model.vo.Shipment;
import com.kh.lp.shipment.model.vo.ShipmentHistory;

public class ShipmentDao {

	Properties prop = new Properties();
	
	public ShipmentDao() {
		
		String fileName = ShipmentDao.class.getResource("/sql/shipment/shipment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	}
	
	
	public int listCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return result;
	}


	public ArrayList<Shipment> smPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Shipment> list = null;
		
		String query = prop.getProperty("smPaging");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Shipment>();
			
			while(rset.next()) {
				Shipment sm = new Shipment();
				
				sm.setMemberNo(rset.getInt("MEMBER_NO"));
				sm.setMemberShipmentApp(rset.getInt("MEMBER_SHIPMENT_APP"));
				sm.setMemberShipmentAuction(rset.getInt("MEMBER_SHIPMENT_AUCTION"));
				sm.setMemberShipmentId(rset.getInt("MEMBER_SHIPMENT_ID"));
				sm.setMemberShipmentItem(rset.getInt("MEMBER_SHIPMENT_ITEM"));
				sm.setMemberShipmentReceiverAddress(rset.getString("MEMBER_SHIPMENT_ADDRESS"));
				sm.setMemberShipmentReceiverEmail(rset.getString("MEMBER_SHIPMENT_RECEIVER_EMAIL"));
				sm.setMemberShipmentReceiverName(rset.getString("MEMBER_SHIPMENT_RECEIVER_NAME"));
				sm.setMemberShipmentReceiverPhone(rset.getString("MENBER_SHIPMENT_RECEIVER_PHONE"));
				sm.setMemberShipmentType(rset.getString("MEMBER_SHIPMENT_TYPE"));
				sm.setShipmentWaybill(rset.getInt("SHIPMENT_WAYBILL"));
				
				list.add(sm);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}


	public int insertWaybill(Connection con, int waybill, int memberShipmentId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWaybill");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, waybill);
			pstmt.setInt(2, memberShipmentId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int insertShipmentHistory(Connection con, int waybill) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertShipmentHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, waybill);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int listCountHistory(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCountHistory");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return result;
		
	}


	public ArrayList<ShipmentHistory> shPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ShipmentHistory> list = null;
		
		String query = prop.getProperty("shPaging");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ShipmentHistory>();
			
			while(rset.next()) {
				ShipmentHistory sh = new ShipmentHistory();
				
				sh.setShipmentHistoryDate(rset.getDate("SHIPMENT_HISTORY_DATE"));
				sh.setShipmentHistoryId(rset.getInt("SHIPMENT_HISTORY_ID"));
				sh.setShipmentHistoryType(rset.getString("SHIPMENT_HISTORY_TYPE"));
				sh.setWaybill(rset.getInt("SHIPMENT_WAYBILL"));
				
				list.add(sh);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

}
