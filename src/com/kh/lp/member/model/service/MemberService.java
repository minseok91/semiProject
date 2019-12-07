package com.kh.lp.member.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;

import com.kh.lp.common.EmailTemplate;
import com.kh.lp.member.model.dao.MemberDao;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

@Log4j2
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

		if (result > 0) {
			int delResult = new MemberDao().deleteEmailCode(con, requestMember.getMemberId());
			if (delResult > 0) {
				log.debug(delResult);
				commit(con);
			} else {
				rollBack(con);
			}
		} else {
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

	public String sendEmail(Member requestMember) {
		Connection con = getConnection();

		String result = new MemberDao().sendEmail(con, requestMember);

		if (result != null) {
			commit(con);
			new EmailTemplate().sendEmailCode(requestMember.getMemberId(), requestMember.getMemberEmail(), result);
		} else {
			rollBack(con);
		}
		close(con);
		return result;
	}

	public int checkEmail(String code, String memberId) {
		Connection con = getConnection();
		int result = new MemberDao().checkEmail(con, code, memberId);

		close(con);
		return result;
	}

	public String findId(Member requestMember) {
		Connection con = getConnection();
		String result = new MemberDao().findId(con, requestMember);

		close(con);
		return result;
	}

	public int findPwd(Member requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().findPwd(con, requestMember);
		
		close(con);
		return result;
	}

}
