package com.kh.lp.member.model.dao;

import static com.kh.lp.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MemberDao {
	private Properties prop = new Properties();
	
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
				loginMember.setMemberGender(rset.getString("MEMBER_GENDER"));
				loginMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
				loginMember.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				loginMember.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				loginMember.setMemberEnrollDate(rset.getDate("MEMBER_ENROLL_DATE"));
				loginMember.setMemberWithdrawYn(rset.getString("MEMBER_WITHDRAW_YN"));
				loginMember.setMemberWithdrawDate(rset.getDate("MEMBER_WITHDRAW_DATE"));
				loginMember.setMemberWithrawCause(rset.getString("MEMBER_WITHDRAW_CAUSE"));
				loginMember.setMemberTempPwdYn(rset.getString("MEMBER_TEMP_PWD_YN"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginMember;
	}
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
		}
		return result;
	}

	

}
