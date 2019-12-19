package com.kh.lp.bidding.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.bidding.model.dao.BidDao;
import com.kh.lp.bidding.model.vo.Bid;
import com.kh.lp.bidding.model.vo.BiddingList;

public class BidService {

	// 시계 목록 불러오기
	public ArrayList<Bid> watchSelectList() {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().watchSelectList(con);
		
		close(con);
		
		return list;
	}

	// 특정 시계상품 상세보기
	public ArrayList<Bid> selectWatchDetail(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().selectWatchDetail(con, num);
		
		close(con);
		
		return list;
	}

	// 특정 경매에 입찰한 회원들(5명까지)
	public ArrayList<Bid> selectListBidUser(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().selectListBidUser(con, num);
		
		close(con);
		
		return list;
	}

	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   : 로그인돼있는 회원이 지금까지 입찰한 BIDDING_AUCTION_ID 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<Integer> getBiddingAuctionIds(int loginMemberNo) {
		
		ArrayList<Integer> selectedBiddingAuctionIds = null;
		
		Connection con = getConnection();
		
		selectedBiddingAuctionIds = new BidDao().selectBiddingAuctionIds(con, loginMemberNo);
		
		close(con);
		
		return selectedBiddingAuctionIds;
	}
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   : 로그인돼있는 회원이 지금까지 입찰한 BIDDING_ID 불러오는 메소드
	 * @param
	 * @return
	 */

	public ArrayList<BiddingList> getBiddingList(int loginMemberNo, ArrayList<Integer> memberBiddingAuctionIds) {
		
		ArrayList<BiddingList> selectedBiddingList = null;
		
		
		
		Connection con = getConnection();
		
		selectedBiddingList = new ArrayList<>();
		
		//로그인된 회원의 입찰아이디들을 하나씩 DAO 메소드로 보내서 처리
		for(int i = 0; i < memberBiddingAuctionIds.size(); i++) {
			
			BiddingList eachBiddingList = new BidDao().selectEachBiddingList(con, memberBiddingAuctionIds.get(i));
			
			int maxPrice = new BidDao().selectBiddingMaxPrice(con, eachBiddingList.getBiddingAuctionId());
			
			eachBiddingList.setBiddingMaxPrice(maxPrice);
			
			selectedBiddingList.add(eachBiddingList);
			
		}
		
		close(con);
		
		return selectedBiddingList;
	}

	// 입찰 등록
	public int insertBidding(Bid b) {
		Connection con = getConnection();
		
		// count값 확인 -> 횟수제한에 걸리지않는지 확인
		int count = new BidDao().checkCount(con, b);
		
		int result = 0;
		
		if(count < 3) 
			result = new BidDao().insertBidding(b, count, con); // 행의 갯수를 들고 감
		
		close(con);
		
		return result;
	}

}






































