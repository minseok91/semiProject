package com.kh.lp.admin.report.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.lp.admin.report.model.vo.Report;

import static com.kh.lp.common.JDBCTemplate.*;

public class ReportDao {
	Properties prop = new Properties();
	public ReportDao() {
		String fileName = ReportDao.class.getResource("/sql/admin/Report/Report-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 7:13:14
	 * @ModifyDate    : 2019. 12. 11. 오후 7:13:14
	 * @Description   : 신고리스트 횟수 조회 메소드
	 * @param userId
	 * @param con
	 * @return
	 */
	public int listReportCount(String userId, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("admin_listReportCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 11. 오후 7:14:01
	 * @ModifyDate    : 2019. 12. 11. 오후 7:14:01
	 * @Description   : 신고조회 메소드
	 * @param currentPage
	 * @param limit
	 * @param con
	 * @param userId
	 * @return
	 */
	public ArrayList<Report> selectList(int currentPage, int limit, Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Report> list = null;
		Report r = null;
		
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (startRow + 10) - 1;
		
		String query = prop.getProperty("admin_selectReport");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Report>();
			while(rset.next()) {
				/*
				 * r = new Report(); r.setRnum(rset.getInt("RNUM"));
				 * r.setReportId(rset.getString("Report_ID"));
				 * r.setReporting(rset.getString("REPORTING"));
				 * r.setReported(rset.getString("REPORTED"));
				 * r.setReportcontent(rset.getString("REPORT_CONTENT"));
				 * r.setReportDate(rset.getDate("REPORT_DATE"));
				 * r.setReport_subject(rset.getString("REPORT_TYPE"));
				 * r.setReportType(rset.getString("BOARD_TYPE"));
				 */
			
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public HashMap<String, Object> selectOne(Connection con, String reportId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> list = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reportId);
			
			rset = pstmt.executeQuery();
			
			list = new HashMap<String, Object>();
			while(rset.next()) {
				
				list.put("boardId", rset.getInt("REPORT_ID"));
				list.put("boardTitle", rset.getString("BOARD_TITLE"));
				list.put("boardContent",rset.getString("REPORT_CONTENT"));
				list.put("boardDate", rset.getDate("REPORT_DATE"));
				list.put("boardTYPE", rset.getString("BOARD_TYPE"));
				list.put("boardIntoType", rset.getString("REPORT_TYPE"));
				list.put("reporting", rset.getString("REPORTING"));
				list.put("reported", rset.getString("REPORTED"));
				
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int ReportCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("reportCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectType(int currentPage, int limit, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hm = null;
		
		String query = prop.getProperty("reportSelectType");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = (startRow + limit - 1);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hm = new HashMap<>();
				hm.put("Rnum", rset.getInt("RNUM"));
				hm.put("boardId", rset.getInt("REPORT_ID")); 
				hm.put("MemberName", rset.getString("MEMBER_NAME")); 
				hm.put("REPORTED_MEMBER_NO",rset.getInt("REPORTED_MEMBER_NO")); 
				hm.put("boardContent",rset.getString("REPORT_CONTENT")); 
				hm.put("boardDate",rset.getDate("REPORT_DATE")); 
				hm.put("Report_board",rset.getInt("REPORT_BOARD")); 
				hm.put("Report_reply",rset.getInt("REPORT_REPLY")); 
				hm.put("boardStatus",rset.getString("REPORT_TYPE")); 
				hm.put("boardTitle",rset.getString("BOARD_TITLE"));
				 
			
				list.add(hm);
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

}
