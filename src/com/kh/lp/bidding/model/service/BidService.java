package com.kh.lp.bidding.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.admin.board.model.dao.BoardDao;
import com.kh.lp.admin.board.model.vo.Board;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.bidding.model.dao.BidDao;
import com.kh.lp.bidding.model.vo.Bid;
import com.kh.lp.bidding.model.vo.Bidding;
import com.kh.lp.bidding.model.vo.BiddingList;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class BidService {

	// 시계 목록 불러오기
//	public ArrayList<Bid> watchSelectList() {
//		Connection con = getConnection();
//		
//		ArrayList<Bid> list = new BidDao().watchSelectList(con);
//		
//		close(con);
//		
//		return list;
//	}

	// 특정 상품 정보
	public ArrayList<Bid> selectItemDetail(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().selectItemDetail(con, num);
		
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
		
		//로그인된 회원의 입찰아이디(BiddingAuctionId)들을 하나씩 DAO 메소드로 보내서 해당 아이디에 대한 입찰 정보를 가져와 selectedBiddingList에 담기
		for(int i = 0; i < memberBiddingAuctionIds.size(); i++) {
			
			//로그인돼있는 회원이 입찰한 상품 목록을 하나씩 반환해서 eachBiddingList 객체에 담는 메소드 (현재입찰최고가 정보 제외)
			BiddingList eachBiddingList = new BidDao().selectEachBiddingList(con, memberBiddingAuctionIds.get(i));
			//위에서 가져온 상품의 현재 입찰최고가격을 반환하는 메소드
			int maxPrice = new BidDao().selectBiddingMaxPrice(con, eachBiddingList.getBiddingAuctionId());
			//위의 eachBidddingList에 입찰최고가격정보 추가
			eachBiddingList.setBiddingMaxPrice(maxPrice);
			
			selectedBiddingList.add(eachBiddingList);
			
		}
		
		close(con);
		
		return selectedBiddingList;
	}

	// 입찰 등록
	public String insertWish(Bid b) {
		Connection con = getConnection();
		int result = 0;
		String status = "";
		
		// count값 확인 -> 기존에 했는지 안했는지 체크
		String yn = new BidDao().checkWishStatus(b, con);
		
		log.debug(yn);
		
		if(yn.equals("")) 
			result = new BidDao().insertWish(b, con); // 없다면 바로 데이터 삽입
		else {
			status = new BidDao().checkWishStatus(b, con); // 있다면 일단 상태를 먼저 확인
			log.debug(status);
			if(status.equals("Y"))
				result = new BidDao().changeWishN(b, con); // 상태가 Y라면 N으로 변경
			else 
				result = new BidDao().changeWishY(b, con); // 상태가 N이라면 Y로 변경
		}
		
		if(result > 0) 
			commit(con);
		else 
			rollBack(con);
		
		close(con);
		
		return result+yn;
	}

	// 가방목록리스트 불러오기
	public ArrayList<Bid> bagSelectList() {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().bagSelectList(con);
		
		close(con);
		
		return list;
	}

	public Watch selectWatchInfo(int num) {
		Connection con = getConnection();
		
		Watch watch = new BidDao().selectWatchInfo(con, num);
		
		close(con);
		
		return watch;
	}

	public Bag selectBagInfo(int num) {
		Connection con = getConnection();
		
		Bag bag = new BidDao().selectBagInfo(con, num);
		
		close(con);
		
		return bag;
	}

	public int insertBiddingHistory(Bidding requestBidding) {
		Connection con = getConnection();
		int result = 0;
		int biddingCount = new BidDao().selectCount(con, requestBidding);
		if(biddingCount < 3) {
			result = new BidDao().insertBiddingHistory(con, requestBidding);
			if(result > 0) {
				commit(con);
			}
		} else {
			rollBack(con);
		}
		close(con);
		return result;
}
  
	// 최근올라온 시계상품 -> 6개만 조회
	public ArrayList<Bid> latelyWatch() {
		Connection con = getConnection();
		
		ArrayList<Bid> latelyWatch = new BidDao().latelyWatch(con);
		
		close(con);
		
		return latelyWatch;
	}

	// 최근올라온 가방상품 -> 6개만 조회
	public ArrayList<Bid> latelyBag() {
		Connection con = getConnection();
		
		ArrayList<Bid> latelyBag = new BidDao().latelyBag(con);
		
		close(con);
		
		return latelyBag;
	}

	// 시계상품불러오기(페이징.ver)
	public ArrayList<Bid> watchSelectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().watchSelectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int listCount() {
		Connection con = getConnection();
		
		int result = new BidDao().listCount(con);
		
		close(con);
		
		return result;
	}

}






































