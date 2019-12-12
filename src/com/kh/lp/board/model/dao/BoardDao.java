package com.kh.lp.board.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.board.model.vo.Board;

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
				b.setBoardMemberNo(rset.getString("MEMBER_ID"));
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
				b.setBid(bid);
				b.setbDate(rset.getDate("BDATE"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbContent(rset.getString("BCONTENT"));
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

	public int deleteBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("deleteOne");
		
		try {
			pstmt  = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return result;
	}

	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("insertBoard");
		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setString(1, b.getbContent());
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

}
