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
import java.util.Properties;

import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.auction.model.vo.AuctionList;

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
			pstmt.setInt(3, requestAuction.getAuctionAppId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertAuctionHistory(Connection con, Auction requestAuction, String type) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAuctionHistory");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 13);
			pstmt.setString(2, type);
			pstmt.setInt(3, 4);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
