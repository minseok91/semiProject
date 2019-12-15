package com.kh.lp.auction.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.auction.model.dao.AuctionDao;
import com.kh.lp.auction.model.vo.Auction;

import static com.kh.lp.common.JDBCTemplate.*;

public class AuctionService {

	public ArrayList<Auction> AuPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Auction> list = new AuctionDao().AuPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int listCount() {
		Connection con = getConnection();
		
		int listCount = new AuctionDao().listCount(con);
		
		close(con);
		
		return listCount;
	}

}
