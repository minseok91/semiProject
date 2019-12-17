package com.kh.lp.admin.qnaAndReport.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.admin.qnaAndReport.model.dao.QNADao;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.member.model.vo.Member;

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
	public HashMap<String, Object> selectOne(String qnaId) {
		Connection con = getConnection();
		
		HashMap<String, Object> list = new QNADao().selectOne(con, qnaId);
		
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
	public int updateStatus(String qnaId, String type) {
		Connection con = getConnection();
		
		int result = new QNADao().updateStatus(con, qnaId, type);
		
		close(con);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 1:41:09
	 * @ModifyDate    : 2019. 12. 17. 오후 1:41:09
	 * @Description   : 
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectType( int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new QNADao().selectType( con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 17. 오후 1:40:30
	 * @ModifyDate    : 2019. 12. 17. 오후 1:40:30
	 * @Description   :  문의 페이지에서 댓글 읽어오는 메소드
	 * @param qnaId
	 * @return
	 */
	public QNA selectQnaReply(String qnaId) {
		Connection con = getConnection();
		
		QNA list = new QNADao().selectQnaReply(con, qnaId);
		
		close(con);
		
		return list;
	}
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 17
	 * @ModifyDate    : 2019. 12. 17
	 * @Description   :  관리자에게 문의 보내는 메소드
	 * @param
	 * @return
	 */
	public int qnaSend(Member loginMember, QNA sendQNA) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		//QNA테이블에 인서트할 dao메소드 불러오기
		int qnaResult = new QNADao().insertQna(con, loginMember, sendQNA);
		
		
		//QNA테이블에 인서트된 정보 중 QNA_ID값 가져오는 dao메소드 불러오기
		int qnaId = new QNADao().getQnaId(con);
		
		
		//가져온 QNA_ID값을 sendQNA 객체에 넣어주기
		sendQNA.setQnaId(qnaId);
		
		
		//QNA_HISTORY 테이블에 인서트할 dao메소드 불러오기
		int qnaHistoryResult = new QNADao().insertQnaHistory(con, loginMember, sendQNA);
		
		
		//QNA테이블과 QNA_HISTORY테이블에 둘 다 정상적으로 인서트 됐을때만 result=1로 반환하고 커밋, 아니면 롤백
		if(qnaResult>0 && qnaHistoryResult>0) {
			result = 1;
			commit(con);
		}else {
			rollBack(con);
		}
		
		
		close(con);
		
		return result;
	}

}














































