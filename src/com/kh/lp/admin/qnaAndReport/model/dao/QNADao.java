package com.kh.lp.admin.qnaAndReport.model.dao;

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

import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.member.model.vo.Member;

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
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = (startRow + limit - 1);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			rset = pstmt.executeQuery();
			
			list = new ArrayList<QNA>();
			while(rset.next()) {
				q = new QNA();
				q.setRowNum(rset.getInt("RNUM"));
				q.setQnaId(rset.getInt("QNA_ID"));
				q.setQnaMemberId(rset.getString("MEMBER_ID"));
				q.setQnaTitle(rset.getString("QNA_TITLE"));
				q.setQnaContent(rset.getString("QNA_CONTENT"));
				q.setQnaDate(rset.getDate("QNA_DATE"));
				q.setQnaStatus(rset.getString("QNA_STATUS"));
				
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
	public HashMap<String, Object> selectOne(Connection con, String qnaId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> q = null;
		
		String query = admin_prop.getProperty("admin_selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(qnaId));
			
			rset = pstmt.executeQuery();
			
			q = new HashMap<String, Object>();
			if(rset.next()) {
				
				q.put("boardId", rset.getInt("QNA_ID"));
				q.put("boardTitle", rset.getString("QNA_TITLE"));
				q.put("boardContent",rset.getString("QNA_CONTENT"));
				q.put("boardDate", rset.getDate("QNA_DATE"));
				q.put("boardIntoType", rset.getString("QNA_STATUS"));
				q.put("memberId", rset.getString("MEMBER_ID"));
				q.put("memberNo", rset.getInt("MEMBERNO"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return q;
	}
	public int updateStatus(Connection con, String qnaId, String type) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_updateStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (type));
			pstmt.setInt(2, Integer.parseInt(qnaId));
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public ArrayList<HashMap<String, Object>> selectType(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hm = null;
		
		String query = admin_prop.getProperty("admin_selectAll");
		
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
				hm.put("boardId", rset.getInt("QNA_ID"));
				hm.put("MemberName", rset.getString("MEMBER_ID"));
				hm.put("boardTitle", rset.getString("QNA_TITLE"));
				hm.put("boardContent", rset.getString("QNA_CONTENT"));
				hm.put("boardDate", rset.getString("QNA_DATE").substring(0,10));
				hm.put("boardStatus", rset.getString("QNA_STATUS"));
				
				
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
	public QNA selectQnaReply(Connection con, String qnaId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QNA list = null;
		
		String query = admin_prop.getProperty("admin_selectQNAReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(qnaId));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list = new QNA();
				list.setQnaId(rset.getInt("QNA_REPLY_ID"));
				list.setQnaContent(rset.getString("QNA_REPLY_COMMENT"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return list;
	}
	
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 17
	 * @ModifyDate    : 2019. 12. 17
	 * @Description   :  관리자에게 문의 보내는 메소드
	 * @param
	 * @return
	 */
	public int qnaSend(Connection con, Member loginMember, QNA sendQNA) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = admin_prop.getProperty("qnaSend");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMember.getMemberNo());
			pstmt.setString(2, sendQNA.getQnaTitle());
			pstmt.setString(3, sendQNA.getQnaContent());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}















































