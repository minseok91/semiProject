package com.kh.lp.member.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

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
				int historyResult = new MemberDao().insertMemberHistory(con, requestMember);
				if(historyResult > 0) {
					commit(con);
				} else {
					rollBack(con);
				}
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

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 11. 오후 6:05:38
	 * @ModifyDate    : 2019. 12. 11. 오후 6:05:38
	 * @Description   : 비밀번호 체크 메소드
	 * @param requestMember
	 * @return
	 */
	public int passwordCheck(Member requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().passwordCheck(con ,requestMember);
		
		close(con);
		return result;
	}
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
		System.out.println(con);
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

	public int updateMemberNP(Member requestMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMemberNP(con, requestMember);
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}
	
	public int updateMember(Member requestMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMember(con, requestMember);
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}
}
