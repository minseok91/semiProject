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

	public ArrayList<Auction> AuPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Auction> list = null;
		
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
				Auction au = new Auction();
				au.setAuAppId(rset.getInt("AUCTION_APP_ID"));
				au.setAuctionId(rset.getInt("AUCTION_ID"));
				au.setAuPeriod(rset.getInt("AUCTION_PERIOD"));
				au.setAuStartPrice(rset.getInt("AUCTION_START_PRICE"));
				au.setAuStartTime(rset.getDate("AUCTION_START_TIME"));
				au.setCount(rset.getInt("AUCTION_COUNT"));
				au.setMemberNo(rset.getInt("AUCTION_MEMBER_NO"));
				
				
				list.add(au);
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
}
