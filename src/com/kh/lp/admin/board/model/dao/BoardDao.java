package com.kh.lp.admin.board.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

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

import com.kh.lp.admin.board.model.vo.Board;

public class BoardDao {
	
	Properties admin_prop = new Properties();
	
	public BoardDao() {
		
		String fileName = BoardDao.class.getResource("/sql/admin/board/board-query.properties").getPath();
		
		try {
			admin_prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:22:22
	 * @ModifyDate    : 2019. 12. 18. 오후 7:22:22
	 * @Description   : 게시판 갯수 조회
	 * @param con
	 * @return
	 */
	public int listCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = admin_prop.getProperty("admin_listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:21:51
	 * @ModifyDate    : 2019. 12. 18. 오후 7:21:51
	 * @Description   : 페이징 포함한 게시판 검색
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Board> BoardPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = admin_prop.getProperty("admin_selectBoard");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("RNUM"));
				b.setBoardId(rset.getInt("BOARD_ID"));
				b.setBoardMemberName(rset.getString("REPORTING"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				b.setBoardCount(rset.getInt("BOARD_COUNT"));
				b.setBoardType(rset.getString("BOARD_TYPE"));
				b.setBoardStatus(rset.getString("BOARD_STATUS"));
				b.setBoardModifyDate(rset.getDate("BOARD_MODIFY_DATE"));
				
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:21:26
	 * @ModifyDate    : 2019. 12. 18. 오후 7:21:26
	 * @Description   : 게시판 상세로 들어가기 위한 필요한 정보 조회
	 * @param con
	 * @param bid
	 * @return
	 */
	public Board selectOneBoard(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = admin_prop.getProperty("BoardSelectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			b = new Board();
			if(rset.next()) {
				b.setBoardId(rset.getInt("BOARD_ID"));
				b.setBoardMemberNo(rset.getInt("BOARD_MEMBER_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				b.setBoardType(rset.getString("BOARD_TYPE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:21:15
	 * @ModifyDate    : 2019. 12. 18. 오후 7:21:15
	 * @Description   : 게시물 제거
	 * @param con
	 * @param boardId
	 * @return
	 */
	public int deleteBoard(Connection con, int boardId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("deleteOne");
		
		try {
			pstmt  = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
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
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:20:55
	 * @ModifyDate    : 2019. 12. 18. 오후 7:20:55
	 * @Description   : 게시물 추가
	 * @param con
	 * @param b
	 * @return
	 */
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("dao : " + b);
		String query = admin_prop.getProperty("insertBoard");
		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardMemberNo());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardType());
			//채우기
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
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:20:36
	 * @ModifyDate    : 2019. 12. 18. 오후 7:20:36
	 * @Description   : 게시판 작성자 번호 가져오기
	 * @param con
	 * @param writer
	 * @return
	 */
	public int selectMn(Connection con, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int memberNo = 0;
		
		String query = admin_prop.getProperty("selectMemberNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, writer);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getInt("MEMBER_No");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberNo;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:20:07
	 * @ModifyDate    : 2019. 12. 18. 오후 7:20:07
	 * @Description   : 게시판 수정하기
	 * @param con
	 * @param b
	 * @return
	 */
	public int updateBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getBoardType());
			pstmt.setInt(4, b.getBoardId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertFAQ(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("insertFAQ");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardMemberNo());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardType());
			
			result = pstmt.executeUpdate();
			
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
	 * @CreateDate    : 2019. 12. 18. 오후 7:19:56
	 * @ModifyDate    : 2019. 12. 18. 오후 7:19:56
	 * @Description   : FAQ 검색
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Board> selectFAQ(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		
		String query = admin_prop.getProperty("admin_selectFAQ");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
		
			list = new ArrayList<Board>();
			while(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("RNUM"));
				b.setBoardId(rset.getInt("BOARD_ID"));
				b.setBoardMemberName(rset.getString("REPORTING"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				b.setBoardCount(rset.getInt("BOARD_COUNT"));
				b.setBoardType(rset.getString("BOARD_TYPE"));
				b.setBoardStatus(rset.getString("BOARD_STATUS"));
				b.setBoardModifyDate(rset.getDate("BOARD_MODIFY_DATE"));
				
				list.add(b);
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

	public int FAQListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int FAQListCount = 0;
		
		
		String query = admin_prop.getProperty("FAQListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				FAQListCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return FAQListCount;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 18. 오후 7:19:37
	 * @ModifyDate    : 2019. 12. 18. 오후 7:19:37
	 * @Description   : 타입을 이용한 게시판 검색
	 * @param currentPage
	 * @param limit
	 * @param con
	 * @param type
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectType(int currentPage, int limit, Connection con, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hm = null;
		
		String query = admin_prop.getProperty("selectType");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			//  여기부터 ****
			list = new ArrayList<>();
			while(rset.next()) {
				hm = new HashMap<>();
				hm.put("Rnum", rset.getInt("RNUM"));
				hm.put("BoardId", rset.getInt("BOARD_ID"));
				hm.put("BoardMemberNo", rset.getInt("BOARD_MEMBER_NO"));
				hm.put("MemberName", rset.getString("MEMBER_NAME"));
				hm.put("BoardTitle", rset.getString("BOARD_TITLE"));
				hm.put("BoardDate", rset.getString("BOARD_DATE").substring(0,10));
				hm.put("BoardModifyDate", rset.getString("BOARD_MODIFY_DATE").substring(0,10));
				hm.put("BoardType", rset.getString("BOARD_TYPE"));
				hm.put("BoardCount", rset.getInt("BOARD_COUNT"));
				
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
	 * @CreateDate    : 2019. 12. 18. 오후 7:19:17
	 * @ModifyDate    : 2019. 12. 18. 오후 7:19:17
	 * @Description   : 게시판 갯수 읽어오기
	 * @param type
	 * @param con
	 * @return
	 */
	public int selectCount(String type, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = admin_prop.getProperty("selectTypeCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	

}
