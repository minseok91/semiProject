package com.kh.lp.admin.board.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.admin.board.model.dao.BoardDao;
import com.kh.lp.admin.board.model.vo.Board;

public class BoardService {

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:00:30
	 * @ModifyDate    : 2019. 12. 17. 오후 9:00:30
	 * @Description   : 처음 게시판 불러올때 게시판 수 조회
	 * @return
	 */
	public int listCount() {
		Connection con = getConnection();
		
		int result = new BoardDao().listCount(con);
		
		close(con);
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:01:09
	 * @ModifyDate    : 2019. 12. 17. 오후 9:01:09
	 * @Description   : 게시판 검색(페이징 포함)
	 * @param currentPage
	 * @param limit
	 * @return
	 */
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

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:01:36
	 * @ModifyDate    : 2019. 12. 17. 오후 9:01:36
	 * @Description   : 게시판 삭제
	 * @param num
	 * @return
	 */
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

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:01:50
	 * @ModifyDate    : 2019. 12. 17. 오후 9:01:50
	 * @Description   : 게시판 작성
	 * @param b
	 * @return
	 */
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

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:02:15
	 * @ModifyDate    : 2019. 12. 17. 오후 9:02:15
	 * @Description   : 
	 * @param writer
	 * @return
	 */
	public int selectMn(String writer) {
		Connection con = getConnection();
		
		int memberNo = new BoardDao().selectMn(con, writer);
		
		close(con);
		
		return memberNo;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:02:33
	 * @ModifyDate    : 2019. 12. 17. 오후 9:02:33
	 * @Description   : 게시판 수정
	 * @param b
	 * @return
	 */
	public int updateBoard(Board b) {
		Connection con = getConnection();
		
		int updateBoard = new BoardDao().updateBoard(con,b);
		
		if(updateBoard > 0) {
			
			commit(con);
			
		} else {
			
			rollBack(con);
			
		}
		
		
		return updateBoard;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:02:55
	 * @ModifyDate    : 2019. 12. 17. 오후 9:02:55
	 * @Description   : FAQ입력
	 * @param b
	 * @return
	 */
	public int insertFAQ(Board b) {
		Connection con = getConnection();
		
		int insertFAQ = new BoardDao().insertFAQ(con, b);
		
		if(insertFAQ > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		
		return insertFAQ;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:03:12
	 * @ModifyDate    : 2019. 12. 17. 오후 9:03:12
	 * @Description   : FAQ검색
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Board> selectFAQ(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectFAQ(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:03:23
	 * @ModifyDate    : 2019. 12. 17. 오후 9:03:23
	 * @Description   : FAQ게시판 갯수 불러오기
	 * @return
	 */
	public int FAQListCount() {
		Connection con = getConnection();
		
		int FAQListCount = new BoardDao().FAQListCount(con);
		
		
		return FAQListCount;
	}

	/**
	 * @param limit 
	 * @param currentPage 
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:04:15
	 * @ModifyDate    : 2019. 12. 17. 오후 9:04:15
	 * @Description   : 게시판 타입으로 조회
	 * @param type
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectType(int currentPage, int limit, String type) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectType(currentPage, limit, con, type);
		
		close(con);
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 9:22:44
	 * @ModifyDate    : 2019. 12. 17. 오후 9:22:44
	 * @Description   : 게시판 타입에 따라 갯수 조회
	 * @param type
	 * @return
	 */
	public int selectCount(String type) {
		Connection con = getConnection();
		
		int result = new BoardDao().selectCount(type, con);
		
		close(con);
		
		return result;
	}

	

}
