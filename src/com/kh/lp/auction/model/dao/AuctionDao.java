package com.kh.lp.auction.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.auction.model.vo.AuctionList;
import com.kh.lp.common.Attachment;

public class AuctionDao {
	
	Properties prop = new Properties();
	
	public AuctionDao() {
		
		String fileName = Auction.class.getResource("/sql/auction/auction-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 16. 오후 9:03:53
	 * @ModifyDate    : 2019. 12. 16. 오후 9:03:53
	 * @Description   : 
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<AuctionList> AuPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AuctionList> list = null;
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		String query = prop.getProperty("AuPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				AuctionList al = new AuctionList();
				al.setAuctionCount(rset.getInt("AUCTION_COUNT"));
				al.setAuctionId(rset.getInt("AUCTION_ID"));
				al.setAuctionType(rset.getString("AUCTION_TYPE"));
				
//				au.setAuAppId(rset.getInt("AUCTION_APP_ID"));
//				au.setAuctionId(rset.getInt("AUCTION_ID"));
//				au.setAuPeriod(rset.getInt("AUCTION_PERIOD"));
//				au.setAuStartPrice(rset.getInt("AUCTION_START_PRICE"));
//				au.setAuStartTime(rset.getDate("AUCTION_START_TIME"));
//				au.setCount(rset.getInt("AUCTION_COUNT"));
//				au.setMemberNo(rset.getInt("AUCTION_MEMBER_NO"));
				
				
				list.add(al);
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

	public int listCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query =  prop.getProperty("listCount");
		
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
			close(rset);
			close(stmt);
		}
				
		return result;
	}


	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 16. 오후 9:05:58
	 * @ModifyDate    : 2019. 12. 16. 오후 9:05:58
	 * @Description   : 경매 시작 메소드
	 * @param con
	 * @param requestAuction
	 * @return
	 */
	public int startAuction(Connection con, Auction requestAuction) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("startAuction");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestAuction.getAuctionStartPrice());
			pstmt.setInt(2, requestAuction.getAuctionPeriod());
			pstmt.setInt(3, requestAuction.getAuctionAr1Id());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 16. 오후 10:18:20
	 * @ModifyDate    : 2019. 12. 16. 오후 10:18:20
	 * @Description   : 경매이력에 이력추가 메소드
	 * @param con
	 * @param requestAuction
	 * @param typeCode
	 * @return
	 */
	public int insertAuctionHistory(Connection con, Auction requestAuction, String typeCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAuctionHistory");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, typeCode);
			pstmt.setInt(2, requestAuction.getAuctionAr1Id());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public HashMap<String, Object> selectOne(Connection con, String appId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> list = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			
			rset = pstmt.executeQuery();
			list = new HashMap<>();
			ArrayList<Attachment> atList = new ArrayList<>();
			Auction au = new Auction();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				atList.add(at);
				
				
				au.setAuctionAr1Id(rset.getInt("AUCTION_APP_ID"));
				au.setAuctionId(rset.getInt("AUCTION_ID"));
				au.setAuctionPeriod(rset.getInt("AUCTION_PERIOD"));
				au.setAuctionStartPrice(rset.getInt("AUCTION_START_PRICE"));
				au.setAuctionStartTime(rset.getDate("AUCTION_START_TIME"));
				au.setAuctionCount(rset.getInt("AUCTION_COUNT"));
				au.setAuctionMemberNo(rset.getInt("AUCTION_MEMBER_NO"));
				
			
			}
			list.put("attach", atList);
			list.put("auction", au);
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
