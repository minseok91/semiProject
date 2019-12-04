package com.kh.lp.member.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.lp.member.model.dao.MemberDao;
import com.kh.lp.member.model.vo.Member;

public class MemberService {

	public Member loginCheck(Member requestMember) {
		Connection con = getConnection();
		Member loginMember = new MemberDao().loginCheck(con, requestMember);
		
		close(con);
		return loginMember;
	}

	public int insertMember(Member requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		}else {
			rollBack(con);
		}
		return result;
	}

	public int idCheck(String memberId) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, memberId);
		
		close(con);
		return result;
	}

	

}
