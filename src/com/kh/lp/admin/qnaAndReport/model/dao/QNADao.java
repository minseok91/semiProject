package com.kh.lp.admin.qnaAndReport.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.admin.qnaAndReport.model.vo.QNA;

import static com.kh.lp.common.JDBCTemplate.*;

public class QNADao {
	static Properties admin_prop = new Properties();
	public QNADao() {
		String fileName = QNADao.class.getResource("/sql/admin/qnaAndReport/QNA-query.properties").getPath();
		try {
			admin_prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int QNACount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_QNACount");
		
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
	
	public ArrayList<QNA> QNASelectAll(int currentPage, int limit, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QNA> list = null;
		QNA q = null;
		
		String query = admin_prop.getProperty("admin_selectAll");
		
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (startRow + 10 - 1);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			rset = pstmt.executeQuery();
			
			list = new ArrayList<QNA>();
			while(rset.next()) {
				q = new QNA();
				q.setRnum(rset.getInt("RNUM"));
				q.setQnaId(rset.getInt("QNA_ID"));
				q.setMemberId(rset.getString("MEMBER_ID"));
				q.setQnaTitle(rset.getString("QNA_TITLE"));
				q.setQnaContent(rset.getString("QNA_CONTENT"));
				q.setQnaDate(rset.getDate("QNA_DATE"));
				q.setQnastatus(rset.getString("QNA_STATUS"));
				
				list.add(q);
				
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
