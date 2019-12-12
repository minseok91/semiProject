package com.kh.lp.member.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import com.kh.lp.common.EmailTemplate;
import com.kh.lp.member.model.vo.Member;
import com.kh.lp.wrapper.EmailCodeWrapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MemberDao {
	private Properties prop = new Properties();
	private Properties admin_prop = new Properties();
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 5. 오후 4:42:54
	 * @ModifyDate    : 2019. 12. 5. 오후 4:42:54
	 * @Description   : 로그인체크하고 MEMBER2 테이블을 조회하는 메소드
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public Member loginCheck(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginMember = null;
		String query = prop.getProperty("loginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberPwd());
			log.debug(requestMember.getMemberId());
			log.debug(requestMember.getMemberPwd());
			rset = pstmt.executeQuery();
			loginMember = new Member();
			if(rset.next()) {
				loginMember.setMemberNo(rset.getInt("MEMBER_NO"));
				loginMember.setMemberId(rset.getString("MEMBER_ID"));
				loginMember.setMemberPwd(rset.getString("MEMBER_PWD"));
				loginMember.setMemberName(rset.getString("MEMBER_NAME"));
				loginMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
				loginMember.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				loginMember.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				loginMember.setMemberEnrollDate(rset.getDate("MEMBER_ENROLL_DATE"));
				loginMember.setMemberModifyDate(rset.getDate("MEMBER_MODIFY_DATE"));
				loginMember.setMemberStatus(rset.getString("MEMBER_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		log.debug(loginMember);
		return loginMember;
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 5. 오후 4:42:32
	 * @ModifyDate    : 2019. 12. 5. 오후 4:42:32
	 * @Description   : 회원가입해서 MEMBER2 테이블에 저장하는 메소드
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public int insertMember(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			/* pstmt.set 넣어주기 */
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberPwd());
			pstmt.setString(3, requestMember.getMemberName());
			pstmt.setString(4, requestMember.getMemberPhone());
			pstmt.setString(5, requestMember.getMemberAddress());
			pstmt.setString(6, requestMember.getMemberEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		
		return result;
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 4. 오후 9:33:05
	 * @ModifyDate    : 2019. 12. 4. 오후 9:33:05
	 * @Description   : 아이디 중복체크 메소드
	 * @param con
	 * @param memberId
	 * @return
	 */
	public int idCheck(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 5. 오후 4:41:57
	 * @ModifyDate    : 2019. 12. 5. 오후 4:41:57
	 * @Description   : 이메일 인증코드 보내고 EMAIL_CERTI 테이블에 저장하는 메소드
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public String sendEmail(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("sendEmail");
		String emailCode = new EmailTemplate().createCode();
		log.debug(emailCode);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberEmail());
			pstmt.setString(3, emailCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		if(result > 0) {
			return emailCode;
		} else {
			return null;
		}
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 5. 오후 7:23:33
	 * @ModifyDate    : 2019. 12. 5. 오후 7:23:33
	 * @Description   : 이메일 인증코드 체크 메소드
	 * @param con
	 * @param code
	 * @param memberId 
	 * @return
	 */
	public int checkEmail(Connection con, String code, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("checkEmail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberEmail());
			pstmt.setString(3, code);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			log.debug(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 5. 오후 7:41:28
	 * @ModifyDate    : 2019. 12. 5. 오후 7:41:28
	 * @Description   : 회원가입 성공 시 인증번호 삭제하는 메소드
	 * @param con
	 * @param memberId
	 * @return
	 */
	public int deleteEmailCode(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteEmailCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 6. 오전 3:57:14
	 * @ModifyDate    : 2019. 12. 6. 오전 3:57:14
	 * @Description   : 아이디 찾는 메소드 파라미터 값에 의해 DB에 유저가 있으면 아이디값을 반환
	 * @param con
	 * @param memberName
	 * @param memberEmail
	 * @return
	 */
	public String findId(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("findId");
		String result = null;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberName());
			pstmt.setString(2, requestMember.getMemberEmail());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("MEMBER_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 8. 오전 3:52:24
	 * @ModifyDate    : 2019. 12. 8. 오전 3:52:24
	 * @Description   : 비밀번호 찾는 메소드 파라미터값에 의해 DB에 유저가 있는지 없는지 조회한다.
	 * @param con
	 * @param memberId
	 * @param memberName
	 * @param memberEmail
	 * @return
	 */
	public int findPwd(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("findPwd");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberName());
			pstmt.setString(3, requestMember.getMemberEmail());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 9. 오후 8:18:56
	 * @ModifyDate    : 2019. 12. 9. 오후 8:18:56
	 * @Description   : 비밀번호 변경 메소드
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public int updatePassword(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePassword");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberPwd());
			pstmt.setString(2, requestMember.getMemberId());
			pstmt.setString(3, requestMember.getMemberName());
			pstmt.setString(4, requestMember.getMemberEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 11. 오후 6:13:29
	 * @ModifyDate    : 2019. 12. 11. 오후 6:13:29
	 * @Description   : 비밀번호 체크 메소드
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public int passwordCheck(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("passwordCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestMember.getMemberNo());
			pstmt.setString(2, requestMember.getMemberPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 5:12:52
	 * @ModifyDate    : 2019. 12. 11. 오후 5:12:52
	 * @Description   : 관리자_회원 조회메소드(페이징 떄문에)
	 * @param con
	 * @param status2 
	 * @param status1 
	 * @return
	 */
	public int listCount(Connection con, String status1, String status2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = admin_prop.getProperty("admin_listCount");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, status1);
			pstmt.setString(2, status2);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println(listCount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 5:14:39
	 * @ModifyDate    : 2019. 12. 11. 오후 5:14:39
	 * @Description   : 관리자_회원 목록 조회(페이징 포함)
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Member> selectUser(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> userList = null;
		Member m = null;
		
		int startRow =  (currentPage -1) * 10 + 1;
		int endRow = startRow + 10 - 1;
		String query = admin_prop.getProperty("admin_selectUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			userList = new ArrayList<Member>();
			while(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPwd(rset.getString("MEMBER_PWD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberPhone(rset.getString("MEMBER_PHONE"));
				m.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				m.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				m.setMemberEnrollDate(rset.getDate("MEMBER_ENROLL_DATE"));
				m.setMemberModifyDate(rset.getDate("MEMBER_MODIFY_DATE"));
				m.setMemberStatus(rset.getString("MEMBER_STATUS"));
				
				userList.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return userList;
	}
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 6:02:51
	 * @ModifyDate    : 2019. 12. 11. 오후 6:02:51
	 * @Description   : 관리자_회원 상세 조회 메소드
	 * @param userId
	 * @param con
	 * @return
	 */
	public Member selectOne(String userId, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member user = null;
		
		String query = admin_prop.getProperty("admin_selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
				user = new Member();
			while(rset.next()) {
				user.setMemberNo(rset.getInt("MEMBER_NO"));
				user.setMemberId(rset.getString("MEMBER_ID"));
				user.setMemberPwd(rset.getString("MEMBER_PWD"));
				user.setMemberName(rset.getString("MEMBER_NAME"));
				user.setMemberPhone(rset.getString("MEMBER_PHONE"));
				user.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				user.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				user.setMemberEnrollDate(rset.getDate("MEMBER_ENROLL_DATE"));
				user.setMemberModifyDate(rset.getDate("MEMBER_MODIFY_DATE"));
				user.setMemberStatus(rset.getString("MEMBER_STATUS"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(user);
		return user;
	}
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 9:16:33
	 * @ModifyDate    : 2019. 12. 11. 오후 9:16:33
	 * @Description   : 관리자_블랙리스트 조회
	 * @param currentPage
	 * @param limit
	 * @param con
	 * @return
	 */
	public ArrayList<Member> selectBlackList(int currentPage, int limit, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		ArrayList<Member> list = null;
		Member m = null;
		
		String query = admin_prop.getProperty("admin_selectBlackList");
		
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 10 - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPwd(rset.getString("MEMBER_PWD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberPhone(rset.getString("MEMBER_PHONE"));
				m.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				m.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				m.setMemberEnrollDate(rset.getDate("MEMBER_ENROLL_DATE"));
				m.setMemberModifyDate(rset.getDate("MEMBER_MODIFY_DATE"));
				m.setMemberStatus(rset.getString("MEMBER_STATUS"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public int typeUpdate(Connection con, String userId, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_statusUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateMemberNP(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMemberNP");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getMemberName());
			pstmt.setString(2, requestMember.getMemberPhone());
			pstmt.setString(3, requestMember.getMemberAddress());
			pstmt.setInt(4, requestMember.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMember(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getMemberName());
			pstmt.setString(2, requestMember.getMemberPwd());
			pstmt.setString(3, requestMember.getMemberPhone());
			pstmt.setString(4, requestMember.getMemberAddress());
			pstmt.setInt(5, requestMember.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}