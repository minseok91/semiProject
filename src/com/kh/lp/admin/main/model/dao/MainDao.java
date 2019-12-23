package com.kh.lp.admin.main.model.dao;

import static com.kh.lp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.admin.board.model.vo.Board;
import com.kh.lp.item.model.vo.Item;

public class MainDao {
	Properties prop = new Properties();
	
	public MainDao() {
		
		String fileName = MainDao.class.getResource("/sql/main/main-query.properties").getPath();
		
		 try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public HashMap<String, Object> selectMain(Connection con) {
		HashMap<String, Object> hmap = null;
		Statement stmt1 = null;
		String getItemRequest = prop.getProperty("getItemRequest");
		Statement stmt2 = null;
		String getAuction = prop.getProperty("getAuction");
		Statement stmt3 = null;
		String getQNA = prop.getProperty("getQNA");
		Statement stmt4 = null;
		String getBoard = prop.getProperty("getBoard");
		
		try {
			stmt1 = con.createStatement();
			stmt2 = con.createStatement();
			stmt3 = con.createStatement();
			stmt4 = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return hmap;
	}

	public ArrayList<Item> itemRequestList(Connection con) {
		Statement stmt = null;
		ArrayList<Item> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getItemRequest");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Item>();
			
			while(rset.next()) {
				Item item = new Item();
				item.setItemBrandModel(rset.getString("ITEM_BRAND_MODEL"));
				
				list.add(item);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public int getItemCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getItemRequest");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<AR1> AuctionList3(Connection con) {
		Statement stmt = null;
		ArrayList<AR1> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getAuction");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<>();
			
			while(rset.next()) {
				AR1 ar1 = new AR1();
				ar1.setAr1Brand(rset.getString("AR1_BRAND"));
				ar1.setAr1Model(rset.getString("AR1_MODEL"));
				
				list.add(ar1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public int getauctionCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getAuctionCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<QNA> qnaList3(Connection con) {
		Statement stmt = null;
		ArrayList<QNA> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getQNA");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<>();
			
			while(rset.next()) {
				QNA qna = new QNA();
				qna.setQnaTitle(rset.getString("QNA_TITLE"));
				
				list.add(qna);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public int getQnaCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getQNACount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<Board> boardList3(Connection con) {
		Statement stmt = null;
		ArrayList<Board> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getBoard");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<>();
			
			while(rset.next()) {
				Board board = new Board();
				board.setBoardTitle(rset.getString("BOARD_TITLE")); 
				
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public int getboardCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getBoardCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}
	
	
	

}
