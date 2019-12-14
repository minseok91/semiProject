package com.kh.lp.admin.member.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.admin.member.model.dao.MemberDao;
import com.kh.lp.admin.member.model.vo.Member;

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

	public int typeUpdate(String userId, String status) {
		Connection con = getConnection();
		
		int result = new MemberDao().typeUpdate(con, userId, status);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		close(con);
		
		return result;
	}
}
