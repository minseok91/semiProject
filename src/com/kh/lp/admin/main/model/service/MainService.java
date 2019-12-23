package com.kh.lp.admin.main.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.admin.main.model.dao.MainDao;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.admin.board.model.vo.Board;
import com.kh.lp.item.model.vo.Item;

public class MainService {

	public HashMap<String, Object> selectMain() {
		Connection con = getConnection();
		
		
		
		
		HashMap<String, Object> hmap = new HashMap<String, Object>(); 
				
		ArrayList<Item> itemList3 = new MainDao().itemRequestList(con);
		System.out.println("itemList3 :" + itemList3);
		int itemCount = new MainDao().getItemCount(con);
		System.out.println("itemCount :" + itemCount);
		ArrayList<AR1> auctionList3 = new MainDao().AuctionList3(con);
		System.out.println("auctionList3 :" + auctionList3);
		int auctionCount = new MainDao().getauctionCount(con);
		System.out.println("auctionCount :" + auctionCount);
		ArrayList<QNA> qnaList3 = new MainDao().qnaList3(con);
		System.out.println("qnaList3 :" + qnaList3);
		int qnaCount = new MainDao().getQnaCount(con);
		System.out.println("qnaCount :" + qnaCount);
		ArrayList<Board> boardList3 = new MainDao().boardList3(con);
		System.out.println("boardList3 :" + boardList3);
		int boardCount = new MainDao().getboardCount(con);
		System.out.println("boardCount :" + boardCount);
		hmap.put("item", itemList3);
		hmap.put("itemC", itemCount);
		hmap.put("auction", auctionList3);
		hmap.put("auctionC", auctionCount);
		hmap.put("qna", qnaList3);
		hmap.put("qnaC", qnaCount);
		hmap.put("board", boardList3);
		hmap.put("boardC", boardCount);
		
		close(con);
		
		return hmap;
	}

}
