package com.kh.lp.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.kh.lp.common.JDBCTemplate.*;
public class BoardDao {
	static Properties prop = new Properties();
	public BoardDao() {
			String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 20. 오전 12:34:07
	 * @ModifyDate    : 2019. 12. 20. 오전 12:34:07
	 * @Description   : 처음 게시판 들어오면 4개의 타입을 각자 조회하는 메소드
	 * @param con
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectTypeBoard(Connection con, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hm = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				hm = new HashMap<String, Object>();
				hm.put("RNUM", rset.getInt("RNUM"));
				hm.put("BoardId", rset.getInt("BOARD_ID"));
				hm.put("BoardMemberNo", rset.getInt("BOARD_MEMBER_NO"));
				hm.put("BoardTitle", rset.getString("BOARD_TITLE"));
				hm.put("BoardDate", rset.getDate("BOARD_DATE"));
				hm.put("BoardCount", rset.getInt("BOARD_COUNT"));
				hm.put("BoardType", rset.getString("BOARD_TYPE"));
				hm.put("BoardStatus", rset.getString("BOARD_STATUS"));
				hm.put("BoardModifyDate",rset.getDate("BOARD_MODIFY_DATE"));
				list.add(hm);
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
	public int listCount(Connection con, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("listCountType");
		
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
			close(rset);
			close(pstmt);
		}
		
		
		
		return result;
	}
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 20. 오전 7:25:18
	 * @ModifyDate    : 2019. 12. 20. 오전 7:25:18
	 * @Description   : 4개의 게시판을 가져오는 메소드
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @param type
	 * @return
	 */
	public ArrayList<HashMap<String, Object>> selectBoard(Connection con, int currentPage, int limit, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hm = null;
		
		String query = prop.getProperty("selectTypeBoard");
		
		int startRow = (currentPage - 1)*limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				hm = new HashMap<String, Object>();
				hm.put("RNUM", rset.getInt("RNUM"));
				hm.put("BoardId", rset.getInt("BOARD_ID"));
				hm.put("BoardMemberNo", rset.getInt("BOARD_MEMBER_NO"));
				hm.put("BoardTitle", rset.getString("BOARD_TITLE"));
				hm.put("BoardDate", rset.getDate("BOARD_DATE"));
				hm.put("BoardCount", rset.getInt("BOARD_COUNT"));
				hm.put("BoardType", rset.getString("BOARD_TYPE"));
				hm.put("BoardStatus", rset.getString("BOARD_STATUS"));
				hm.put("BoardModifyDate",rset.getDate("BOARD_MODIFY_DATE"));
				hm.put("BoardMemberName", rset.getString("MEMBER_NAME"));
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
	public int insertBoard(Connection con, HashMap<String, Object> list) {
		PreparedStatement pstmt = null;
		int reuslt = 0;
		
		String query = prop.getProperty("insertAllBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt((String)list.get("memberNo")));
			pstmt.setString(2,(String)list.get("title"));
			pstmt.setString(3, (String)list.get("content"));
			pstmt.setString(4, (String)list.get("boardKinds"));
			
			reuslt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return reuslt;
	}
	public HashMap<String, Object> selectBoardOne(int boardId, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hm = null;

		String query = prop.getProperty("selectBoardOne");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hm = new HashMap<>();
				hm = new HashMap<String, Object>();
				hm.put("RNUM", rset.getInt("RNUM"));
				hm.put("BoardId", rset.getInt("BOARD_ID"));
				hm.put("BoardMemberNo", rset.getInt("BOARD_MEMBER_NO"));
				hm.put("BoardTitle", rset.getString("BOARD_TITLE"));
				hm.put("BoardDate", rset.getDate("BOARD_DATE"));
				hm.put("BoardCount", rset.getInt("BOARD_COUNT"));
				hm.put("BoardType", rset.getString("BOARD_TYPE"));
				hm.put("BoardStatus", rset.getString("BOARD_STATUS"));
				hm.put("BoardModifyDate",rset.getDate("BOARD_MODIFY_DATE"));
				hm.put("BoardMemberName", rset.getString("MEMBER_NAME"));
				hm.put("BoardContent", rset.getString("BOARD_CONTENT"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return hm;
	}

}
