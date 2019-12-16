package com.kh.lp.auction.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.auction.model.dao.AuctionDao;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.auction.model.vo.AuctionList;

import static com.kh.lp.common.JDBCTemplate.*;

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

	public HashMap<String, Object> selectOne(String appId) {
		Connection con = getConnection();
		
		HashMap<String, Object> list = new AuctionDao().selectOne(con, appId);
		
		close(con);
		
		return list;
	}

}
