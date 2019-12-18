package com.kh.lp.bidding.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.bidding.model.dao.bidDao;
import com.kh.lp.bidding.model.vo.Bid;

public class bidService {

	public ArrayList<Bid> watchSelectList() {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new bidDao().watchSelectList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Bid> selectWatchDetail(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new bidDao().selectWatchDetail(con, num);
		
		close(con);
		
		return list;
	}

	public ArrayList<Bid> selectListBidUser(int num) {
		Connection con = getConnection();
		
		ArrayList<Bid> list = new bidDao().selectListBidUser(con, num);
		
		close(con);
		
		return list;
	}

}
