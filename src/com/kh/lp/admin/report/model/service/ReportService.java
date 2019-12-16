package com.kh.lp.admin.report.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.lp.admin.report.model.dao.ReportDao;
import com.kh.lp.admin.report.model.vo.Report;


public class ReportService {
	
	public int listReportCount(String userId) {
		Connection con = getConnection();
		
		int listReportCount = new ReportDao().listReportCount(userId, con);
		
		close(con);
		
		return listReportCount;
	}

	public ArrayList<Report> selectList(int currentPage, int limit, String userId) {
		Connection con = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectList(currentPage, limit, con, userId);
			
		close(con);
			
		return list;
	}

	public HashMap<String, Object> selectOne(String reportId) {
		Connection con = getConnection();
		
		HashMap<String, Object> list = new ReportDao().selectOne(con, reportId);
		
		close(con);
		
		return list;
	}

	public int ReportCount() {
		Connection con = getConnection();
		
		int ReportCount = new ReportDao().ReportCount(con);
		
		close(con);
		
		return ReportCount;
	}

	public ArrayList<HashMap<String, Object>> selectType(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new ReportDao().selectType(currentPage, limit, con);
	
				
		return list;
	}

}
