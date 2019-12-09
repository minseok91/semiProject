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

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:17:01
	 * @ModifyDate    : 2019. 12. 9. 오후 8:17:01
	 * @Description   : 로그인 메소드
	 * @param requestMember
	 * @return
	 */
	public Member loginCheck(Member requestMember) {
		Connection con = getConnection();
		Member loginMember = new MemberDao().loginCheck(con, requestMember);

		close(con);
		return loginMember;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:16:48
	 * @ModifyDate    : 2019. 12. 9. 오후 8:16:48
	 * @Description   : 회원가입 메소드
	 * @param requestMember
	 * @return
	 */
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
		close(con);
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:16:38
	 * @ModifyDate    : 2019. 12. 9. 오후 8:16:38
	 * @Description   : 아이디 체크 메소드
	 * @param memberId
	 * @return
	 */
	public int idCheck(String memberId) {
		Connection con = getConnection();

		int result = new MemberDao().idCheck(con, memberId);

		close(con);
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:16:31
	 * @ModifyDate    : 2019. 12. 9. 오후 8:16:31
	 * @Description   : 이메일 전송 메소드
	 * @param requestMember
	 * @return
	 */
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

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:16:23
	 * @ModifyDate    : 2019. 12. 9. 오후 8:16:23
	 * @Description   : 이메일 인증코드 체크 메소드
	 * @param code
	 * @param requestMember
	 * @return
	 */
	public int checkEmail(String code, Member requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().checkEmail(con, code, requestMember);

		close(con);
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:16:17
	 * @ModifyDate    : 2019. 12. 9. 오후 8:16:17
	 * @Description   : 아이디 찾기 메소드
	 * @param requestMember
	 * @return
	 */
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

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:16:03
	 * @ModifyDate    : 2019. 12. 9. 오후 8:16:03
	 * @Description   : 패스워드 변경 메소드
	 * @param requestMember
	 * @return
	 */
	public int updatePassword(Member requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().updatePassword(con, requestMember);
		
		if(result > 0) {
			int delResult = new MemberDao().deleteEmailCode(con, requestMember.getMemberId());
			if(delResult > 0) {
				commit(con);
			} else {
				rollBack(con);
			}
		} else {
			rollBack(con);
		}
		close(con);
		return result;
	}

}
