package com.kh.lp.report.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.report.model.vo.Report;

import static com.kh.lp.common.JDBCTemplate.*;

public class ReportDao {
	Properties prop = new Properties();
	public ReportDao() {
		String fileName = ReportDao.class.getResource("/sql/Report/Report-query.properties").getPath();
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
		
		String query = prop.getProperty("selectReport");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Report>();
			while(rset.next()) {
				r = new Report();
				r.setRnum(rset.getInt("RNUM"));
				r.setReport_id(rset.getString("Report_ID"));
				r.setReporting_member_no(rset.getString("REFORTING"));
				r.setReported_member_no(rset.getString("ReportED"));
				r.setReported_content(rset.getString("ReportED_CONTENT"));
				r.setReport_date(rset.getDate("Report_DATE"));
				r.setReport_subject(rset.getString("Report"));
				r.setReport_type(rset.getString("BOARD"));
			
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

}
