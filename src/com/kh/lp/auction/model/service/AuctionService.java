package com.kh.lp.auction.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.auction.model.dao.AuctionDao;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.auction.model.vo.AuctionList;
import com.kh.lp.auction.model.vo.BiddingHistory;
import com.kh.lp.auction.model.vo.ClosedAuction;
import com.kh.lp.bidding.model.dao.BidDao;
import com.kh.lp.bidding.model.vo.BiddingList;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class AuctionService {

	public ArrayList<AuctionList> AuPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<AuctionList> list = new AuctionDao().AuPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int listCount() {
		Connection con = getConnection();
		
		int listCount = new AuctionDao().listCount(con);
		
		close(con);
		
		return listCount;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 16. 오후 8:52:41
	 * @ModifyDate    : 2019. 12. 16. 오후 8:52:41
	 * @Description   : 경매시작 시 진행되는 메소드
	 * @param requestAuction
	 * @return
	 */
	public int startAuction(Auction requestAuction) {
		Connection con = getConnection();
		
		int result = new AuctionDao().startAuction(con, requestAuction);
		
		if(result > 0) {
			int auctionHistoryResult = new AuctionDao().insertAuctionHistory(con, requestAuction, "AHT2");
			if(auctionHistoryResult > 0) {
				int biddingResult = new AuctionDao().insertBiddingHistory(con, requestAuction);
				if(biddingResult > 0) {
					log.debug(biddingResult);
					commit(con);
				} else {
					rollBack(con);
				}
			} else {
				rollBack(con);
			}
		} else {
			rollBack(con);
		}
		close(con);
		return result;
	}

	public HashMap<String, Object> selectOne(String appId) {
		Connection con = getConnection();
		
		//시계인지 가방인지 판별
		//boolean isWatch = new AuctionDao().isWatch(con, appId);
		
		HashMap<String, Object> list = new AuctionDao().selectOne(con, appId);
//		if(isWatch) {
//			//시계일때
//			list = new AuctionDao().selectOne(con, appId);
//		} else {
//			//가방일때
//			list = new AuctionDao().selectOne(con, appId);
//		}
		
		close(con);
		
		return list;
	}

	public ArrayList<ArrayList<Object>> doAuction(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<ArrayList<Object>> list = new AuctionDao().doAuction(con, memberNo);
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectOneBid(String appId) {
Connection con = getConnection();
		
		//시계인지 가방인지 판별
		//boolean isWatch = new AuctionDao().isWatch(con, appId);
		
		//아이템 정보 가져오기
		Member memberId = new AuctionDao().getMemberId(con, appId);
		//입찰이력
		ArrayList<BiddingHistory> bhList = new AuctionDao().getBiddingList(con, appId);
		
		System.out.println("입찰이력 : " + bhList);
		HashMap<String, Object> list = new AuctionDao().selectOneBid(con, appId);
//		if(isWatch) {
//			//시계일때
//			list = new AuctionDao().selectOne(con, appId);
//		} else {
//			//가방일때
//			list = new AuctionDao().selectOne(con, appId);
//		}
		list.put("memberId", memberId.getMemberId());
		list.put("bhList", bhList);
		
		close(con);
		
		return list;
	}

	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 19
	 * @ModifyDate    : 2019. 12. 20
	 * @Description   : 현재 로그인 되어있는 유저가 판매중인 경매마감상품 리스트 중 현재 페이지에 해당하는 리스트 5개 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<ClosedAuction> memberClosedAuctionList(int loginMemberNo, int currentPage, int limit) {
		
		ArrayList<ClosedAuction> selectedClosedAuctionList = null;
		
		Connection con = getConnection();
		
		selectedClosedAuctionList = new AuctionDao().selectClosedAuctionList(con, loginMemberNo, currentPage, limit);

		close(con);
		
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

	public int memberClosedAuctionCount(int loginMemberNo) {
		
		int memberClosedAuctionCount;
		
		Connection con = getConnection();
		
		memberClosedAuctionCount = new AuctionDao().memberClosedAuctionCount(con, loginMemberNo);
		
		close(con);
		
		return memberClosedAuctionCount;
	}


}





































