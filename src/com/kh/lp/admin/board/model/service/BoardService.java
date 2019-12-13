package com.kh.lp.admin.board.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.admin.board.model.dao.BoardDao;
import com.kh.lp.admin.board.model.vo.Board;

public class BoardService {

	public int listCount() {
		Connection con = getConnection();
		
		int result = new BoardDao().listCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> BoradPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().BoardPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public Board selectOne(int bid) {
		Connection con = getConnection();
		
		Board b = new BoardDao().selectOneBoard(con, bid);
		
		close(con);
		
		return b;
	}

	public int deleteBoard(int num) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteBoard(con, num);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		return result;
	}

	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}

}
