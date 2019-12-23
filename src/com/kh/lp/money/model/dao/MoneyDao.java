package com.kh.lp.money.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.lp.common.JDBCTemplate.*;
import com.kh.lp.money.model.vo.Money;
import com.kh.lp.money.model.vo.MoneyDetail;
import com.kh.lp.win.model.vo.Win;

public class MoneyDao {
	Properties prop = new Properties();
	
	public MoneyDao() {
		String fileName = MoneyDao.class.getResource("/sql/money/money-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertApp(Connection con, Money m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertApp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getMemberNo());
			pstmt.setString(2, m.getMerId());
			pstmt.setInt(3, m.getAmount());
			pstmt.setString(4, m.getImpId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 22. 오후 7:08:19
	 * @ModifyDate    : 2019. 12. 22. 오후 7:08:19
	 * @Description   : 회원 상세에서 구매갯수 조회오는 메소드
	 * @param userId
	 * @param con
	 * @return
	 */
	public int purchaseCount(int userNo, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("PurchaseCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int salesCont(int memberNo, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("salesCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertMoney(Connection con, Money money, Win win) {
		PreparedStatement pstmt  = null;
		int result = 0;
		
		String query = prop.getProperty("insertMoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, win.getWinMemberNo()); //멤버no 
			pstmt.setString(2, money.getApplyNum()); //승인번호
			pstmt.setInt(3, win.getWinAuctionId()); // 낙찰 번호 
			pstmt.setInt(4, money.getAmount()); // 결제금액 
			pstmt.setString(5, money.getImpId()); //impUid
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertMoneyHistory(Connection con, Money money) {
		PreparedStatement pstmt  = null;
		int result = 0;
		
		String query = prop.getProperty("insertMoneyHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Win getWinner(Connection con, int auctionId) {
		PreparedStatement pstmt = null;
		Win winner = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getWinner");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, auctionId);
			
			rset = pstmt.executeQuery();
			winner = new Win();
			if(rset.next()) {
				winner.setWinAuctionId(auctionId);
				winner.setWinMemberNo(rset.getInt("WIN_MEMBER_NO"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return winner;
	}

	public MoneyDetail getMoneyDetail(Connection con, int auctionId) {
		PreparedStatement pstmt = null;
		MoneyDetail md = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getMoneyDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, auctionId);
			
			rset = pstmt.executeQuery();
			md = new MoneyDetail();
			if(rset.next()) {
				md.setAuctionId(auctionId);
				md.setAddress(rset.getString("MEMBER_ADDRESS"));
				md.setPhone(rset.getString("MEMBER_PHONE"));
				md.setMemberName(rset.getString("MEMBER_NAME"));
				md.setBrand(rset.getString("AR1_BRAND"));
				md.setModel(rset.getString("AR1_MODEL"));
				md.setPrice(rset.getInt("WIN_PRICE"));
				md.setPriceFee(rset.getInt("WIN_PRICE") * 0.15);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return md;
	}

}
