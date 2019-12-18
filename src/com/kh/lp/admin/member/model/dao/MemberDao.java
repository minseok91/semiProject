package com.kh.lp.admin.member.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.admin.member.model.vo.Member;
import com.kh.lp.admin.member.model.vo.memberHistory;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MemberDao {
	private Properties admin_prop = new Properties();
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/admin/member/member-query.properties").getPath();
		try {
			admin_prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
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
		System.out.println(status1);
		System.out.println(status2);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, status1);
			pstmt.setString(2, status2);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
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
				m.setRowNum(rset.getInt("RNUM"));
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPwd(rset.getString("MEMBER_PWD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberPhone(rset.getString("MEMBER_PHONE"));
				m.setMemberEmail(rset.getString("MEMBER_EMAIL"));
				m.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
				m.setMemberEnrollDate(rset.getDate("MEMBER_ENROLL_DATE"));
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
				user.setMemberStatus(rset.getString("MEMBER_STATUS"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 13. 오후 3:54:10
	 * @ModifyDate    : 2019. 12. 13. 오후 3:54:10
	 * @Description   : 관리자 회원 상태 변경
	 * @param con
	 * @param userId
	 * @param status
	 * @return
	 */
	public int typeUpdate(Connection con, int MemberNo, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_statusUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, MemberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public int historyUpdate(Connection con, memberHistory memberHistory) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_memberHistoryInsert");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberHistory.getMemberNo());
			pstmt.setString(2, memberHistory.getMemberHistoryType());
			pstmt.setString(3, memberHistory.getMemberHistoryDetail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
}