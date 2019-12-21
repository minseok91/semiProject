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

import com.kh.lp.admin.board.model.vo.Board;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.bidding.model.vo.Bid;
import com.kh.lp.bidding.model.vo.Bidding;
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
//	public ArrayList<Bid> watchSelectList(Connection con) {
//		Statement stmt = null;
//		ResultSet rset = null;
//		ArrayList<Bid> list = null;
//		
//		String query = prop.getProperty("selectWatchList");
//		
//		try {
//			stmt = con.createStatement();
//			rset = stmt.executeQuery(query);
//			
//			list = new ArrayList<>();
//			
//			while(rset.next()) {
//				Bid b = new Bid();
//				
//				b.setBidAuctionId(rset.getInt("AUCTION_ID"));
//				b.setBidId(rset.getInt("BIDDING_ID"));
//				b.setBidPrice(rset.getInt("BIDDING_PRICE"));
//				b.setBidAttachment(rset.getString("ATTACHMENT_RENAME"));
//				b.setBidBrand(rset.getString("AR1_BRAND"));
//				b.setBidModel(rset.getString("AR1_MODEL"));
//				b.setBidAuctionStartTime(rset.getDate("AUCTION_START_TIME"));
//				b.setBidAuctionPeriod(rset.getInt("AUCTION_PERIOD"));
//				
//				list.add(b);
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(stmt);
//		}
//		
//		return list;
//	}

	public ArrayList<Bid> selectItemDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectItemDetail");
		
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
				
				// 아이디 가리기
				String user = rset.getString("MEMBER_ID").substring(0, 3)+"******";
				b.setBidUserId(user);
				b.setBidPrice(rset.getInt("BIDDING_PRICE"));
				b.setBidInsertTime(rset.getDate("BIDDING_TIME")); // 입찰시간
				
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

	// 필터처리 후 데이터 삽입
	// 경매번호, 회원번호, 상태
	public int insertWish(Bid b, int count, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBidding");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getBidAuctionId());
			pstmt.setInt(2, b.getBidMemberNo());
			pstmt.setInt(3, count+1);
			pstmt.setInt(4, b.getBidPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String checkWishStatus(Bid b, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String status = "";
		
		String query = prop.getProperty("checkWishStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getBidAuctionId());
			pstmt.setInt(2, b.getBidMemberNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				status = rset.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return status;
	}
 
	// 상태 N으로 변경
	public int changeWishN(Bid b, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeWishN");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getBidAuctionId());
			pstmt.setInt(2, b.getBidMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 상태 Y로 변경
	public int changeWishY(Bid b, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeWishY");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getBidAuctionId());
			pstmt.setInt(2, b.getBidMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 위시리스트 이력 넣기
	public int insertWish(Bid b, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWish");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getBidAuctionId());
			pstmt.setInt(2, b.getBidMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Bid> bagSelectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectBagList");
		
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

	public Watch selectWatchInfo(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Watch watch = null;
		
		String query = prop.getProperty("selectWatchInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			watch = new Watch();
			if(rset.next()) {
				watch.setWatchGuaranteeYn(rset.getString("WATCH_GUARANTEE_YN"));
				watch.setWatchBoxYn(rset.getString("WATCH_BOX_YN"));
				watch.setWatchMaterial(rset.getString("WATCH_MATERIAL"));
				watch.setWatchMovement(rset.getString("WATCH_MOVEMENT"));
				watch.setWatchChronograph(rset.getString("WATCH_CHRONOGRAPH"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return watch;
	}

	public Bag selectBagInfo(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Bag b = null;
		
		String query = prop.getProperty("selectBagInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			b = new Bag();
			if(rset.next()) {
				b.setBagSize(rset.getString("BAG_SIZE"));
				b.setBagStrap(rset.getString("BAG_STRAP"));
				b.setGender(rset.getString("BAG_GENDER"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return b;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 20. 오전 3:57:46
	 * @ModifyDate    : 2019. 12. 20. 오전 3:57:46
	 * @Description   : 입찰하는 메소드
	 * @param con
	 * @param requestBidding
	 * @return
	 */
	public int insertBiddingHistory(Connection con, Bidding requestBidding) {
		PreparedStatement pstmt = null;
		int result = 0;
		log.debug(requestBidding);
		String query = prop.getProperty("insertBiddingHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestBidding.getBiddingAuctionId());
			pstmt.setInt(2, requestBidding.getBiddingMemberNo());
			pstmt.setInt(3, requestBidding.getBiddingMemberNo());
			pstmt.setInt(4, requestBidding.getBiddingPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 20. 오전 3:57:53
	 * @ModifyDate    : 2019. 12. 20. 오전 3:57:53
	 * @Description   : 입찰횟수 세는 메소드
	 * @param con
	 * @param requestBidding
	 * @return
	 */
	public int selectCount(Connection con, Bidding requestBidding) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestBidding.getBiddingMemberNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
  }
	// 최근올라온 시계상품 6개만 정보를 추출
	public ArrayList<Bid> latelyWatch(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectSixWatchList");
		
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

	// 최근올라온 가방상품 6개만 정보추출
	public ArrayList<Bid> latelyBag(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectSixBagList");
		
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

	// 시계상품불러오기(페이징.ver)
	public ArrayList<Bid> watchSelectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bid> list = null;
		
		String query = prop.getProperty("selectWatchList");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Bid>();
			
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
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
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
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}
}


