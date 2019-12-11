package com.kh.lp.item.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.item.model.dao.ItemDao;
import com.kh.lp.item.model.vo.Item;

import static com.kh.lp.common.JDBCTemplate.*;

public class ItemService {

	public int listCount() {
		Connection con = getConnection();
		
		int result = new ItemDao().listCount(con);
		
		close(con);
		
		
		return result;
	}

	public ArrayList<Item> ItemPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Item> list = new ItemDao().ItemPaging(con, currentPage, limit);
		
		close(con);
		
		
		return list;
	}

}
