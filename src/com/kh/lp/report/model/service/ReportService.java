package com.kh.lp.report.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.report.model.dao.ReportDao;
import com.kh.lp.report.model.vo.Report;

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

}
