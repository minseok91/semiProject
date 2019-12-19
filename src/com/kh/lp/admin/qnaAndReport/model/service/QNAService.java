package com.kh.lp.admin.qnaAndReport.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.admin.qnaAndReport.model.dao.QNADao;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

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
	 * @Description   : QNA타입으로 검색하여 조회하는 메소드
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

	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   :  QNA테이블에서 현재 로그인 되어있는 유저가 작성한 QNA들의 갯수를 세는 메소드
	 * @param
	 * @return
	 */
	
	public int memberQnaCount(int loginMemberNo) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = new QNADao().memberQnaCount(con, loginMemberNo);
		
		close(con);
		
		return result;
		

	}
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   :  QNA테이블에서 현재 로그인 되어있는 유저가 작성한 QNA리스트 중 현재 페이지에 해당하는 리스트 10개 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<QNA> memberQnaList(int loginMemberNo, int currentPage, int limit) {
		
		ArrayList<QNA> memberQnaList = null;
		
		Connection con = getConnection();
		
		memberQnaList = new QNADao().memberQnaList(con, loginMemberNo, currentPage, limit);
		
		close(con);
		
		return memberQnaList;
	}

	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   :  현재 웹페이지에서 클릭한 관리자 문의 제목에 해당하는 상세정보를 QNA테이블, QNA_REPLY 테이블에서 가져오는 메소드
	 * @param
	 * @return
	 */
	public QNA getQnaDetail(int qnaId) {
		
		QNA getQnaDetail = null;
		
		Connection con = getConnection();
		
		getQnaDetail = new QNADao().selectOneQna(con, qnaId);
		
		close(con);
		
		return getQnaDetail;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 5:11:30
	 * @ModifyDate    : 2019. 12. 19. 오후 5:11:30
	 * @Description   : 관리자가 읽거나 댓글을 남기면 히스토리에 저장하는 메소드
	 * @param qNAId
	 * @param type
	 * @return
	 */
	public int insertHistory(int qNAId, String type) {
		Connection con = getConnection();
		
		int insertHistroy = new QNADao().insertHistory(qNAId,type,con);
		
		if(insertHistroy > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		
		return insertHistroy;
	}

}














































