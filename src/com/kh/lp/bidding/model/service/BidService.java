package com.kh.lp.bidding.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.bidding.model.dao.BidDao;
import com.kh.lp.bidding.model.vo.Bid;

public class BidService {

	public ArrayList<Bid> watchSelectList() {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().watchSelectList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Bid> selectWatchDetail(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().selectWatchDetail(con, num);
		
		close(con);
		
		return list;
	}

	public ArrayList<Bid> selectListBidUser(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new BidDao().selectListBidUser(con, num);
		
		close(con);
		
		return list;
	}

}
