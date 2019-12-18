package com.kh.lp.admin.member.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.admin.member.model.dao.MemberDao;
import com.kh.lp.admin.member.model.vo.Member;
import com.kh.lp.admin.member.model.vo.MemberHistory;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MemberService {
	/**
	 * @param status2 
	 * @param status1 
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 5:06:01
	 * @ModifyDate    : 2019. 12. 11. 오후 5:06:01
	 * @Description   : 페이징할 검색 목록 숫자 불러오기
	 * @return
	 */
	public int listCount(String status1, String status2) {
		Connection con = getConnection();
		
		int listCount = new MemberDao().listCount(con, status1, status2);
		close(con);
		
		return listCount;
	}
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 5:10:23
	 * @ModifyDate    : 2019. 12. 11. 오후 5:10:23
	 * @Description   : 회원 조회 메소드(페이징 포함)
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Member> selectUser(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectUser(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 5:58:17
	 * @ModifyDate    : 2019. 12. 11. 오후 5:58:17
	 * @Description   : 회원 상세 조회 메소드
	 * @param userId
	 * @return
	 */
	public Member selectOne(String userId) {
		Connection con = getConnection();
		
		Member user = new MemberDao().selectOne(userId, con);
		
		close(con);
		
		return user;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 9:12:42
	 * @ModifyDate    : 2019. 12. 11. 오후 9:12:42
	 * @Description   : 블랙리스트 회원 조회
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Member> selectBlackList(int currentPage, int limit) {
		Connection con = getConnection();
		
		
		
		ArrayList<Member> list = new MemberDao().selectBlackList(currentPage, limit, con);
		
		close(con);
		
		return list;
	}

	public int typeUpdate(int MemberNo, String status) {
		Connection con = getConnection();
		
		int result = new MemberDao().typeUpdate(con, MemberNo, status);
		
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
	 * @CreateDate    : 2019. 12. 15. 오후 9:39:39
	 * @ModifyDate    : 2019. 12. 15. 오후 9:39:39
	 * @Description   :  회원 타입 변경 히스토리 저장
	 * @param memberHistory
	 * @return
	 */
	public int historyUpdate(MemberHistory memberHistory) {
		Connection con = getConnection();
		
		//타입을 멤버타입히스토리에 맞는 타입으로 변경
		String type = "";
		switch(memberHistory.getMemberHistoryType()) {
		case "MS1" : type = "MHT1"; break;
		case "MS2" : type = "MHT2"; break;
		case "MS3" : type = "MHT3"; break;
		case "MS4" : type = "MHT4"; break;
		}
		memberHistory.setMemberHistoryType(type);
		
		int resutl = new MemberDao().historyUpdate(con, memberHistory);
		
		if(resutl > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		return resutl;
	}
}
