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

import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.auction.model.vo.AuctionList;
import com.kh.lp.auction.model.vo.BiddingHistory;
import com.kh.lp.auction.model.vo.ClosedAuction;
import com.kh.lp.common.Attachment;
import com.kh.lp.item.model.vo.Item;
import com.kh.lp.member.model.vo.Member;
import com.kh.lp.win.model.vo.Win;

import lombok.extern.log4j.Log4j2;

@Log4j2
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
				al.setAuctionType(rset.getString("AUCTION_STATUS"));
				al.setAuctionAr1Id(rset.getInt("AUCTION_AR1_ID"));
				al.setType(rset.getString("AR1_WATCH_BAG"));
				al.setModel(rset.getString("AR1_MODEL"));
				al.setBrand(rset.getString("AR1_BRAND"));
				
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
		log.debug(result);
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
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertEndAuctionHistory(Connection con, Auction requestAuction, String typeCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertEndAuctionHistory");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, typeCode);
			pstmt.setInt(2, requestAuction.getAuctionId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public HashMap<String, Object> selectOne(Connection con, String appId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> list = null;
		
		String query = prop.getProperty("selectOne");
		System.out.println("appId :" + appId );
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			
			rset = pstmt.executeQuery();
			list = new HashMap<>();
			ArrayList<Attachment> atList = new ArrayList<>();
			Auction au = new Auction();
			AR1 ar1 = new AR1();
			Watch w = new Watch();
			Bag b = new Bag();
			Member m = new Member();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				atList.add(at);
				
				au.setAuctionAr1Id(rset.getInt("AUCTION_AR1_ID"));
				au.setAuctionAppDate(rset.getDate("AUCTION_APP_DATE"));
				au.setAuctionAr1Id(rset.getInt("AUCTION_AR1_ID"));
				au.setAuctionId(rset.getInt("AUCTION_ID"));
				au.setAuctionPeriod(rset.getInt("AUCTION_PERIOD"));
				au.setAuctionStartPrice(rset.getInt("AUCTION_START_PRICE"));
				au.setAuctionStartTime(rset.getDate("AUCTION_START_TIME"));
				au.setAuctionCount(rset.getInt("AUCTION_COUNT"));
				au.setAuctionMemberNo(rset.getInt("AUCTION_MEMBER_NO"));
				
				
				ar1.setAr1BagDetail(rset.getInt("AR1_BAG_DETAIL"));
				ar1.setAr1Brand(rset.getString("AR1_BRAND"));
				ar1.setAr1Condition(rset.getString("AR1_CONDITION"));
				ar1.setAr1Id(rset.getInt("AR1_ID"));
				ar1.setAr1Model(rset.getString("AR1_MODEL"));
				ar1.setAr1Price(rset.getInt("AR1_PRICE"));
				ar1.setAr1WatchDetail(rset.getInt("AR1_WATCH_DETAIL"));
				
				w.setWatchBoxYn(rset.getString("WATCH_BOX_YN"));
				w.setWatchChronograph(rset.getString("WATCH_CHRONOGRAPH"));
				w.setWatchGuaranteeYn(rset.getString("WATCH_GUARANTEE_YN"));
				w.setWatchId(rset.getInt("WATCH_ID"));
				w.setWatchMaterial(rset.getString("WATCH_MATERIAL"));
				w.setWatchMovement(rset.getString("WATCH_MOVEMENT"));
				
				b.setBagId(rset.getInt("BAG_ID"));
				b.setBagSize(rset.getString("BAG_SIZE"));
				b.setBagStrap(rset.getString("BAG_STRAP"));
				b.setGender(rset.getString("BAG_GENDER"));
				
				m.setMemberName(rset.getString("MEMBER_ID"));
						
						
				
				
			
			}
			list.put("memberId", m.getMemberName());
			list.put("b", b);
			list.put("w", w);
			list.put("ar1", ar1);
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

	public boolean isWatch(Connection con, String appId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isWatch = false;
		
		String query = prop.getProperty("isWatch");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println("여기 워치애용 ? ");
				isWatch = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return isWatch;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 18. 오후 7:22:11
	 * @ModifyDate    : 2019. 12. 18. 오후 7:22:11
	 * @Description   : 진행경매 불러오는 메소드
	 * @param con
	 * @param memberNo
	 * @return
	 */
	public ArrayList<ArrayList<Object>> doAuction(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArrayList<Object>> list = null;
		Item i = null;
		Attachment at = null;
		Auction au = null;
		
		String query = prop.getProperty("doAuction");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				i = new Item();
				at = new Attachment();
				au = new Auction();
				ArrayList<Object> list2 = new ArrayList<>();
				
				au.setAuctionId(rset.getInt(1));
				at.setAttachmentRename(rset.getString(2));
				i.setItemBrandModel(rset.getString(3));
				au.setAuctionStartPrice(rset.getInt(4));
				au.setAuctionDoPrice(rset.getInt(5));
				au.setAuctionBiddingCount(rset.getInt(6));
				au.setEndTime(rset.getInt(7));
				
				list2.add(i);
				list2.add(at);
				list2.add(au);
				
				list.add(list2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		log.debug(list);
		return list;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 18. 오후 7:21:59
	 * @ModifyDate    : 2019. 12. 18. 오후 7:21:59
	 * @Description   : 입찰이력 등록하는 메소드
	 * @param con
	 * @param requestAuction
	 * @return
	 */
	public int insertBiddingHistory(Connection con, Auction requestAuction) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBiddingHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestAuction.getAuctionMemberNo());
			pstmt.setInt(2, requestAuction.getAuctionAr1Id());
			pstmt.setInt(3, requestAuction.getAuctionMemberNo());
			pstmt.setInt(4, requestAuction.getAuctionStartPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
  
	public HashMap<String, Object> selectOneBid(Connection con, String appId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> list = null;
		
		String query = prop.getProperty("selectOneBid");
		System.out.println("appId :" + appId );
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			
			rset = pstmt.executeQuery();
			list = new HashMap<>();
			ArrayList<Attachment> atList = new ArrayList<>();
			Auction au = new Auction();
			AR1 ar1 = new AR1();
			Watch w = new Watch();
			Bag b = new Bag();
			Win win = new Win();
			String memberId = "";
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				atList.add(at);
				
				
				au.setAuctionAr1Id(rset.getInt("AUCTION_AR1_ID"));
				au.setAuctionAppDate(rset.getDate("AUCTION_APP_DATE"));
				au.setAuctionAr1Id(rset.getInt("AUCTION_AR1_ID"));
				au.setAuctionId(rset.getInt("AUCTION_ID"));
				au.setAuctionPeriod(rset.getInt("AUCTION_PERIOD"));
				au.setAuctionStartPrice(rset.getInt("AUCTION_START_PRICE"));
				au.setAuctionStartTime(rset.getDate("AUCTION_START_TIME"));
				au.setAuctionCount(rset.getInt("AUCTION_COUNT"));
				au.setAuctionMemberNo(rset.getInt("AUCTION_MEMBER_NO"));
				
				
				ar1.setAr1BagDetail(rset.getInt("AR1_BAG_DETAIL"));
				ar1.setAr1Brand(rset.getString("AR1_BRAND"));
				ar1.setAr1Condition(rset.getString("AR1_CONDITION"));
				ar1.setAr1Id(rset.getInt("AR1_ID"));
				ar1.setAr1Model(rset.getString("AR1_MODEL"));
				ar1.setAr1Price(rset.getInt("AR1_PRICE"));
				ar1.setAr1WatchDetail(rset.getInt("AR1_WATCH_DETAIL"));
				
				w.setWatchBoxYn(rset.getString("WATCH_BOX_YN"));
				w.setWatchChronograph(rset.getString("WATCH_CHRONOGRAPH"));
				w.setWatchGuaranteeYn(rset.getString("WATCH_GUARANTEE_YN"));
				w.setWatchId(rset.getInt("WATCH_ID"));
				w.setWatchMaterial(rset.getString("WATCH_MATERIAL"));
				w.setWatchMovement(rset.getString("WATCH_MOVEMENT"));
				
				b.setBagId(rset.getInt("BAG_ID"));
				b.setBagSize(rset.getString("BAG_SIZE"));
				b.setBagStrap(rset.getString("BAG_STRAP"));
				b.setGender(rset.getString("BAG_GENDER"));
				
				win.setWinsecondPrice(rset.getInt("WIN_SECOND_PRICE"));
				win.setWinPrice(rset.getInt("WIN_PRICE"));
				win.setWinnerName(rset.getString("WINNER"));
				win.setWinner2ndName(rset.getString("2ND"));
				win.setWinAuctionId(rset.getInt("WIN_AUCTION_ID"));
				win.setWinStatus(rset.getString("WIN_STATUS"));
				
				memberId = rset.getString("MEMBER_ID");
				
			
			}
			list.put("memberId", memberId);
			list.put("win", win);
			list.put("b", b);
			list.put("w", w);
			list.put("ar1", ar1);
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

	public ArrayList<BiddingHistory> getBiddingList(Connection con, String appId) {
		PreparedStatement pstmt = null;
		ArrayList<BiddingHistory> bdList = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getBiddingList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			
			rset = pstmt.executeQuery();
			bdList = new ArrayList<BiddingHistory>();
			while(rset.next()) {
				BiddingHistory bd = new  BiddingHistory();
				bd.setBiddingAuctionId(rset.getInt("BIDDING_AUCTION_ID"));
				bd.setBiddingCount(rset.getInt("BIDDING_COUNT"));
				bd.setBiddingId(rset.getInt("BIDDING_ID"));
				bd.setBiddingMemberId(rset.getString("MEMBER_ID"));
				bd.setBiddingPrice(rset.getInt("BIDDING_PRICE"));
				bd.setBiddingDate(rset.getDate("BIDDING_DATE"));
				bd.setBiddingTime(rset.getTime("BIDDING_TIME"));
				
				bdList.add(bd);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return bdList;
	}

	public Member getMemberId(Connection con, String appId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("getMemberId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			
			rset = pstmt.executeQuery();
			
			m = new Member();
			if(rset.next()) {
				m.setMemberId(rset.getString("MEMBER_ID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return m;
	}
	
	

	/**
	 * @Author        : 오수민
	 * @CreateDate    : 2019. 12. 19
	 * @ModifyDate    : 2019. 12. 19
	 * @Description   : 로그인된 유저의 경매마감된 판매상품 AUCTION_ID 불러와서 ArrayList<Integer>에 담는 메소드
	 * @param
	 * @return
	 */
	
	public ArrayList<Integer> selectClosedAuctionIds(Connection con, int loginMemberNo) {
		
		ArrayList<Integer> selectedClosedAuctionIds = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectClosedAuctionIds");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			
			rset = pstmt.executeQuery();
			
			selectedClosedAuctionIds = new ArrayList<>();
			
			while(rset.next()) {
				selectedClosedAuctionIds.add(rset.getInt(1));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return selectedClosedAuctionIds;
	}

	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 19
	 * @ModifyDate    : 2019. 12. 19
	 * @Description   : 현재 로그인 되어있는 유저가 판매중인 경매마감상품 리스트 중 현재 페이지에 해당하는 리스트 5개 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<ClosedAuction> selectClosedAuctionList(Connection con, int loginMemberNo, int currentPage,
			int limit) {
		
		ArrayList<ClosedAuction> selectedClosedAuctionList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ClosedAuction cau = null;
		
		//현재  페이지에서의 리스트 시작번호
		int startRow = (currentPage -1) * limit + 1;
		//현재 페이지에서의 리스트 마지막번호
		int endRow = (startRow + limit -1);
		
		
		String query = prop.getProperty("selectMemberClosedAuctionList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			selectedClosedAuctionList = new ArrayList<>();
			
			while(rset.next()) {
				
				cau = new ClosedAuction();
				
				cau.setAuctionId(rset.getInt("AUCTION_ID"));
				cau.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				cau.setAr1Brand(rset.getString("AR1_BRAND"));
				cau.setAr1Model(rset.getString("AR1_MODEL"));
				cau.setWinPrice(rset.getInt("WIN_PRICE"));
				cau.setWinSecondPrice(rset.getInt("WIN_SECOND_PRICE"));
				cau.setMoneyStatus(rset.getString("MONEY_STATUS"));
//				cau.setMoneyStatus(rset.getString("MONEY_STATUS"));
				
				//WIN 테이블에서의 WIN_STATUS에 따라 띄워줘야하는 현재가격이 달라짐
				int winStatus = 99;
				winStatus = rset.getInt("WIN_STATUS");
				
				if(winStatus==0) {
					cau.setCurrentPrice(0);
				}else if(winStatus==1) {
					cau.setCurrentPrice(cau.getWinPrice());
				}else if(winStatus==2) {
					cau.setCurrentPrice(cau.getWinSecondPrice());
				}
				
				
				
				selectedClosedAuctionList.add(cau);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return selectedClosedAuctionList;
		
	}

	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 21
	 * @ModifyDate    : 2019. 12. 22
	 * @Description   : 현재 로그인된 회원의 마감된 경매 갯수를 불러오는 메소드
	 * @param
	 * @return
	 */
	public int memberClosedAuctionCount(Connection con, int loginMemberNo) {
		
		int memberClosedAuctionCount=0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("memberClosedAuctionCount");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				memberClosedAuctionCount = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return memberClosedAuctionCount;
		
	}

	public Win getWinner(Connection con, String appId) {
		PreparedStatement pstmt = null;
		Win winner = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getWinner");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(appId));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				winner.setWinPrice(rset.getInt(""));
				winner.setWinnerName(rset.getString(""));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return winner;
	}


	public ArrayList<ArrayList<Object>> serverSelectList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArrayList<Object>> list = null;
		Auction ac = null;
		Member m = null;
		String query = prop.getProperty("serverSelectList");
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				ArrayList<Object> list2 = new ArrayList<>();
				
				ac = new Auction();
				m = new Member();
				ac.setAuctionId(rset.getInt(1));
				ac.setAuctionStartPrice(rset.getInt(2));
				m.setMemberId(rset.getString(3));
				ac.setAuctionPeriod(rset.getInt(4));
				
				list2.add(ac);
				list2.add(m);
				
				list.add(list2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public int failAuction(Connection con, Auction requestAuction) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("failAuction");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestAuction.getAuctionId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int winAuction(Connection con, Auction requestAuction) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("winAuction");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestAuction.getAuctionId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public ArrayList<Win> selectWinner(Connection con, Auction requestAuction) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("selectWinner");
		ResultSet rset = null;
		ArrayList<Win> list = null;
		Win w = null;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestAuction.getAuctionId());
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				w = new Win();
				w.setWinMemberNo(rset.getInt("BIDDING_MEMBER_NO"));
				w.setWinPrice(rset.getInt("BIDDING_PRICE"));
				
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	public int insertWinner(Connection con, Auction requestAuction, ArrayList<Win> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertWinner");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestAuction.getAuctionId());
			pstmt.setInt(2, list.get(0).getWinMemberNo());
			pstmt.setInt(3, list.get(0).getWinPrice());
			pstmt.setInt(4, list.get(1).getWinMemberNo());
			pstmt.setInt(5, list.get(1).getWinPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}






































