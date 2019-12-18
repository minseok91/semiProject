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
import com.kh.lp.bidding.model.vo.BiddingList;

import lombok.extern.log4j.Log4j2;

import static com.kh.lp.common.JDBCTemplate.*;

@Log4j2
public class BidDao {
	Properties prop = new Properties();
	
	public BidDao() {
		String fileName = BidDao.class.getResource("/sql/bid/bid-query.properties").getPath();
		
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
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   : 로그인돼있는 회원이 지금까지 입찰한 BIDDING_ID 셀렉트해오는 메소드
	 * @param
	 * @return
	 */

	public ArrayList<Integer> selectBiddingAuctionIds(Connection con, int loginMemberNo) {
		
		ArrayList<Integer> selectedBiddingAuctionIds = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberBiddingAuctionIds");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			
			rset = pstmt.executeQuery();
			
			selectedBiddingAuctionIds = new ArrayList<>();
			
			while(rset.next()) {
				selectedBiddingAuctionIds.add(rset.getInt(1));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return selectedBiddingAuctionIds;
		
	}
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   : 로그인돼있는 회원이 입찰한 상품 목록을 하나씩 반환하는 메소드 (현재입찰최고가 정보 제외)
	 * @param
	 * @return
	 */

	public BiddingList selectEachBiddingList(Connection con, Integer memberBiddingAuctionId) {
		
		BiddingList oneBiddingList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneBiddingList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberBiddingAuctionId);
			pstmt.setInt(2, memberBiddingAuctionId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				oneBiddingList = new BiddingList();
				oneBiddingList.setBiddingAuctionId(rset.getInt("BIDDING_AUCTION_ID"));
				oneBiddingList.setBiddingMemberPrice(rset.getInt("BIDDING_PRICE"));
				oneBiddingList.setBrand(rset.getString("AR1_BRAND"));
				oneBiddingList.setModel(rset.getString("AR1_MODEL"));
				oneBiddingList.setThumbnailRename(rset.getString("ATTACHMENT_RENAME"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return oneBiddingList;
	}
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   : 로그인돼있는 회원이 입찰한 상품 하나에 대한 현재최고입찰가격 조회하는 메소드 
	 * @param
	 * @return
	 */

	public int selectBiddingMaxPrice(Connection con, int biddingAuctionId) {
		
		int maxBiddingPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMaxBiddingPrice");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, biddingAuctionId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				maxBiddingPrice = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return maxBiddingPrice;
	}


}















































