package com.kh.lp.wishlist.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.wishlist.model.vo.WishList;

import static com.kh.lp.common.JDBCTemplate.*;

public class WishListDao {

	private Properties prop = new Properties();
	public WishListDao() {
		String fileName = WishListDao.class.getResource("/sql/wishList/wishList-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 22
	 * @ModifyDate    : 2019. 12. 22
	 * @Description   : 현재 로그인된 회원의 위시리스트 갯수를 불러오는 메소드
	 * @param
	 * @return
	 */
	
	public int memberWishListCount(Connection con, int loginMemberNo, String selectedView) {
		
		int memberWishListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty(selectedView + "MemberWishListCount");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberWishListCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return memberWishListCount;
	}
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 20
	 * @ModifyDate    : 2019. 12. 20
	 * @Description   :  로그인된 유저가 관심상품 등록한 목록 WISHLIST 테이블에서 WISHLIST_AUCTION_ID값 가져와서 ArrayList<Integer>에 담기
	 * @param
	 * @return
	 */
	
	public ArrayList<Integer> selectMemberAuctionId(Connection con, int loginMemberNo, String selectedView, int currentPage, int limit) {
		
		ArrayList<Integer> selectedMemberAuctionId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		
		//현재  페이지에서의 리스트 시작번호
		int startRow = (currentPage -1) * limit + 1;
		//현재 페이지에서의 리스트 마지막번호
		int endRow = (startRow + limit -1);
		
		
		String query = prop.getProperty(selectedView + "AuctionIds");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();	
			
			selectedMemberAuctionId = new ArrayList<>();
			
			while(rset.next()) {
				selectedMemberAuctionId.add(rset.getInt("WISHLIST_AUCTION_ID"));
			}
			
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println("selectedMemberAuctionId : " + selectedMemberAuctionId);
		
		return selectedMemberAuctionId;
	}

	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 20
	 * @ModifyDate    : 2019. 12. 20
	 * @Description   :  로그인된 유저가 관심상품 등록한 목록 WISHLIST 테이블에서 WISHLIST_AUCTION_ID값 가져와서 ArrayList<Integer>에 담기
	 * @param
	 * @return
	 */

	public WishList selectEachInfo(Connection con, int memberAuctionIds, int loginMemberNo) {
		
		WishList selectedEachInfo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberWishList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberAuctionIds);
			pstmt.setInt(2, loginMemberNo);
			
			rset = pstmt.executeQuery();
			
			selectedEachInfo = new WishList();
			
			while(rset.next()) {
				selectedEachInfo.setAuctionId(memberAuctionIds);
				selectedEachInfo.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				selectedEachInfo.setAr1Brand(rset.getString("AR1_BRAND"));
				selectedEachInfo.setAr1Model(rset.getString("AR1_MODEL"));
				selectedEachInfo.setAuctionEndDate(rset.getDate("AUCTION_END_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return selectedEachInfo;
	}


	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 20
	 * @ModifyDate    : 2019. 12. 20
	 * @Description   : 받아온 WISHLIST_AUCTION_ID 상품에 대한 현재 최고입찰가격 정보를 리턴하는 메소드
	 * @param
	 * @return
	 */
	public int getEachCurrentPrice(Connection con, int memberAuctionIds) {
		
		int eachCurrentPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("eachCurrentPrice");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberAuctionIds);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				eachCurrentPrice = rset.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return eachCurrentPrice;
	}


	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 23
	 * @ModifyDate    : 2019. 12. 23
	 * @Description   : 위시리스트에서 삭제목록 받아와서 위시리스트 상태변경 처리하는 메소드
	 * @param
	 * @return
	 */
	public int deleteWishList(Connection con, int loginMemberNo, String deleteArr) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteWishList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			pstmt.setString(2, deleteArr);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
		
		
	}

	
	
	

}



















































