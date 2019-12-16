package com.kh.lp.admin.qnaAndReport.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.admin.qnaAndReport.model.dao.QNADao;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;

public class QNAService {

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 16. 오후 2:13:46
	 * @ModifyDate    : 2019. 12. 16. 오후 2:13:46
	 * @Description   : 문의 갯수 조회
	 * @return
	 */
	public int QNACount() {
		Connection con = getConnection();
		
		int result = new QNADao().QNACount(con);
		
		close(con);
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 16. 오후 2:14:10
	 * @ModifyDate    : 2019. 12. 16. 오후 2:14:10
	 * @Description   : 문의 게시판 조회
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<QNA> selectAll(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<QNA> list = new QNADao().QNASelectAll(currentPage, limit, con);
		
		close(con);
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 16. 오후 2:14:34
	 * @ModifyDate    : 2019. 12. 16. 오후 2:14:34
	 * @Description   : QNA상세 조회
	 * @param qnaId
	 * @return
	 */
	public QNA selectOne(String qnaId) {
		Connection con = getConnection();
		
		QNA list = new QNADao().selectOne(con, qnaId);
		
		close(con);
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 16. 오후 2:14:55
	 * @ModifyDate    : 2019. 12. 16. 오후 2:14:55
	 * @Description   : 관리자 문의 읽을 시 문의 확인 상태 변경
	 * @param qnaId
	 * @return
	 */
	public int updateStatus(String qnaId) {
		Connection con = getConnection();
		
		int result = new QNADao().updateStatus(con, qnaId);
		
		close(con);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		return result;
	}

	public ArrayList<QNA> selectType(String type, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<QNA> list = new QNADao().selectType(type, con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
