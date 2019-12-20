package com.kh.lp.board.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.board.model.dao.BoardDao;
public class BoardService {

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 11:50:58
	 * @ModifyDate    : 2019. 12. 19. 오후 11:50:58
	 * @Description   : 처음 게시판 들어오면 4개의 타입을 각자 조회하는 메소드
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectTypeBoard(String type) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectTypeBoard(con, type);
		
		close(con);
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 20. 오전 3:09:21
	 * @ModifyDate    : 2019. 12. 20. 오전 3:09:21
	 * @Description   : 타입으로 해당 게시판 갯수 조회
	 * @param type
	 * @return
	 */
	public int listCount(String type) {
		Connection con = getConnection();
		
		int result = new BoardDao().listCount(con, type);
		
		close(con);
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 20. 오전 3:51:43
	 * @ModifyDate    : 2019. 12. 20. 오전 3:51:43
	 * @Description   : 타입을 이용한 페이징포함한 게시판 검색
	 * @param currentPage
	 * @param limit
	 * @param type
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectBoard(int currentPage, int limit, String type) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectBoard(con, currentPage, limit, type);
		
		close(con);
		
		return list;
	}

	public int insertBoard(HashMap<String, Object> list) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, list);
		
		if(result>0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> selectBoardOne(int boardId) {
		Connection con = getConnection();
		
		HashMap<String, Object> list = new BoardDao().selectBoardOne(boardId, con);
		
		close(con);
		
		return list;
	}

}
