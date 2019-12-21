package com.kh.lp.admin.qnaAndReport.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 2:25:04
	 * @ModifyDate    : 2019. 12. 19. 오후 2:25:04
	 * @Description   : QNA 게시판 갯수 조회
	 * @param con
	 * @return
	 */
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
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 2:25:37
	 * @ModifyDate    : 2019. 12. 19. 오후 2:25:37
	 * @Description   : QNA 게시물 조회
	 * @param currentPage
	 * @param limit
	 * @param con
	 * @return
	 */
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
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 2:26:13
	 * @ModifyDate    : 2019. 12. 19. 오후 2:26:13
	 * @Description   : QNA상세 조회
	 * @param con
	 * @param qnaId
	 * @return
	 */
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
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 2:26:36
	 * @ModifyDate    : 2019. 12. 19. 오후 2:26:36
	 * @Description   : QNA 상태 변경
	 * @param con
	 * @param qnaId
	 * @param type
	 * @return
	 */
	public int updateStatus(Connection con, String qnaId, String type) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("QNA 아이디 : "+qnaId);
		System.out.println("QNA type : "+type);
		
		
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
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 2:26:59
	 * @ModifyDate    : 2019. 12. 19. 오후 2:26:59
	 * @Description   : QNA 상태를 이용한 QNA 조회
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @return
	 */
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
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 2:27:25
	 * @ModifyDate    : 2019. 12. 19. 오후 2:27:25
	 * @Description   : QNA댓글 조회
	 * @param con
	 * @param qnaId
	 * @return
	 */
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
				list.setQnaId(rset.getInt("QNA_ID"));
				list.setQnaContent(rset.getString("QNA_REPLY_DETAIL"));
				
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
	 * @Description   :  QNA테이블에 문의정보 인서트하는 메소드
	 * @param
	 * @return
	 */
	public int insertQna(Connection con, Member loginMember, QNA sendQNA) {
		
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
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 17
	 * @ModifyDate    : 2019. 12. 17
	 * @Description   :  QNA테이블에 기록된 정보 중 QNA_ID 값 가져오는 메소드
	 * @param
	 * @return
	 */
	public int getQnaId(Connection con) {
		
		int qnaId = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = admin_prop.getProperty("getQnaId");
		
		
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				qnaId = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return qnaId;
	}
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 17
	 * @ModifyDate    : 2019. 12. 17
	 * @Description   :  QNA_HISTORY테이블에 인서트하는 메소드
	 * @param
	 * @return
	 */
	
	public int insertQnaHistory(Connection con, Member loginMember, QNA sendQNA) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = admin_prop.getProperty("insertQnaHistory");
		
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sendQNA.getQnaId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   :  QNA테이블에서 로그인돼있는 멤버의 QNA 리스트 갯수를 반환하는 메소드
	 * @param
	 * @return
	 */
	public int memberQnaCount(Connection con, int loginMemberNo) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		
		String query = admin_prop.getProperty("selectMemberQnaCount");
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   :  QNA테이블에서 현재 로그인 되어있는 유저가 작성한 QNA리스트 중 현재 페이지에 해당하는 리스트 10개 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<QNA> memberQnaList(Connection con, int loginMemberNo, int currentPage, int limit) {
		ArrayList<QNA> memberQnaList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QNA qna = null;
		
		//현재  페이지에서의 리스트 시작번호
		int startRow = (currentPage -1) * limit + 1;
		//현재 페이지에서의 리스트 마지막번호
		int endRow = (startRow + limit -1);
		
		
		String query = admin_prop.getProperty("selectQnaList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMemberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			memberQnaList = new ArrayList<QNA>();
			
			while(rset.next()) {
				
				qna = new QNA();
				qna.setRowNum(rset.getInt("RNUM"));
				qna.setQnaId(rset.getInt("QNA_ID"));
				qna.setQnaTitle(rset.getString("QNA_TITLE"));
				qna.setQnaContent(rset.getString("QNA_CONTENT"));
				qna.setQnaDate(rset.getDate("QNA_DATE"));
				qna.setQnaStatus(rset.getString("QNA_STATUS"));
				
				memberQnaList.add(qna);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return memberQnaList;
	}
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 18
	 * @ModifyDate    : 2019. 12. 18
	 * @Description   :  현재 웹페이지에서 클릭한 관리자 문의 제목에 해당하는 상세정보를 QNA테이블, QNA_REPLY 테이블에서 가져오는 메소드
	 * @param
	 * @return
	 */
	public QNA selectOneQna(Connection con, int qnaId) {
		
		QNA selectedQnaDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//QNA테이블과 QNA_REPLY테이블에서 값 가져오는 쿼리문
		String query = admin_prop.getProperty("selectOneQnaDetail");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qnaId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				selectedQnaDetail = new QNA();
				
				selectedQnaDetail.setQnaId(qnaId);
				selectedQnaDetail.setQnaTitle(rset.getString("QNA_TITLE"));
				selectedQnaDetail.setQnaContent(rset.getString("QNA_CONTENT"));
				selectedQnaDetail.setQnaDate(rset.getDate("QNA_DATE"));
				selectedQnaDetail.setQnaStatus(rset.getString("QNA_STATUS"));
				selectedQnaDetail.setQnaReply(rset.getString("QNA_REPLY_DETAIL"));
				selectedQnaDetail.setQnaReplyDate(rset.getDate("QNA_REPLY_DATE"));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return selectedQnaDetail;
	}
	public int insertHistory(int qNAId, String type, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_insertQNAHistory");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qNAId);
			pstmt.setString(2, type);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return result;
	}
}















































