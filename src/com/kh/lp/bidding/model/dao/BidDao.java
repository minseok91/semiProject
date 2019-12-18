package com.kh.lp.bidding.model.dao;

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

import com.kh.lp.bidding.controller.watchDetail;
import com.kh.lp.bidding.model.vo.Bid;

import lombok.extern.log4j.Log4j2;

import static com.kh.lp.common.JDBCTemplate.*;

@Log4j2
public class bidDao {
	Properties prop = new Properties();
	
	public bidDao() {
		String fileName = bidDao.class.getResource("/sql/bid/bid-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 시계리스트 추출(페이징 아님)
	public ArrayList<Bid> watchSelectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Bid b = new Bid();
				
				b.setBidAuctionId(rset.getInt("AUCTION_ID"));
				b.setBidId(rset.getInt("BIDDING_ID"));
				b.setBidPrice(rset.getInt("BIDDING_PRICE"));
				b.setBidAttachment(rset.getString("ATTACHMENT_RENAME"));
				b.setBidBrand(rset.getString("AR1_BRAND"));
				b.setBidModel(rset.getString("AR1_MODEL"));
				b.setBidAuctionStartTime(rset.getDate("AUCTION_START_TIME"));
				b.setBidAuctionPeriod(rset.getInt("AUCTION_PERIOD"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Bid> selectWatchDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectWatchDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Bid b = new Bid();
				
				b.setBidUserId(rset.getString("MEMBER_ID"));
				b.setBidAttachment(rset.getString("ATTACHMENT_RENAME"));
				b.setBidBrand(rset.getString("AR1_BRAND"));
				b.setBidModel(rset.getString("AR1_MODEL"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Bid> selectListBidUser(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectListBidUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Bid b = new Bid();
				
				b.setBidUserId(rset.getString("MEMBER_ID"));
				b.setBidPrice(rset.getInt("BIDDING_PRICE"));
				b.setBidAuctionStartTime(rset.getDate("BIDDING_TIME")); // 입찰시간
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
