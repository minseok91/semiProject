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

import com.kh.lp.bidding.model.vo.Bid;
import static com.kh.lp.common.JDBCTemplate.*;

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

	public ArrayList<HashMap<String, Object>> selectWatchDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectWatchDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			if(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
				hmap.put("memberId", rset.getString("MEMBER_ID"));
				hmap.put("fileName", rset.getString("ATTACHMENT_RENAME"));
				hmap.put("brand", rset.getString("AR1_BRAND"));
				hmap.put("model", rset.getString("AR1_MODEL"));
				
				list.add(hmap);
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
