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
				commit(con);
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

}
