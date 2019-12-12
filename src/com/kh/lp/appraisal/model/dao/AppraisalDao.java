package com.kh.lp.appraisal.model.dao;

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

import com.kh.lp.appraisal.model.vo.AppCom;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.GenDetail;
import com.kh.lp.appraisal.model.vo.Item;

public class AppraisalDao {
	
	Properties prop = new Properties();
	
	public AppraisalDao() {
		
		String fileName = AppraisalDao.class.getResource("/sql/appraisal/appraisal-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public int insertFake(Connection con, AppResult ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFake");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);//지금은 임시로 감정 ID 를 넣음 
			pstmt.setString(2, ap.getDetailDesc());
			//파일첨부터 쿼리에서 강제로 넣음
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertGenResult(Connection con, AppResult ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGenResult");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);//지금은 임시로 감정 ID 를 넣음 
			pstmt.setString(2, ap.getDetailDesc());
			//파일첨부터 쿼리에서 강제로 넣음
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertGenDetail(Connection con, GenDetail gd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGenDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, gd.getBrand());
			pstmt.setString(2, gd.getModelName());
			pstmt.setInt(3, gd.getAppPrice());
			System.out.println("gd :"  + gd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttach(Connection con, Attachment at) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttach");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, at.getBid());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			pstmt.setInt(5, 1);//일단 1로하자
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Item getItemInfo(Connection con, String itemId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Item item = null;
		
		String query = prop.getProperty("getItemInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, itemId);
			
			rset = pstmt.executeQuery();
			item = new Item();
			
			if(rset.next()) {
				
				item.setItemAppDate(rset.getDate("ITEM_APP_DATE"));
				item.setItemBrandModel(rset.getString("ITEM_BRAND_MODEL"));
				item.setItemDetail(rset.getString("ITEM_DETAIL"));
				item.setItemId(itemId);
				item.setItemMemberNo(rset.getString("ITEM_MEMBER_NO"));
				item.setItemPurDate(rset.getDate("ITEM_PUR_DATE"));
				item.setItemType(rset.getString("ITEM_TYPE"));
				item.setItemWarrantyYn(rset.getString("ITEM_WARRANTY_YN"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return item;
	}

	public int insertHistory(Connection con, String itemId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, itemId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAppFake(Connection con, String itemId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAppFake");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, itemId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int listCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
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
			close(stmt);
			close(rset);
		}
		
		return result;
	}

	public ArrayList<AppCom> appPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AppCom> list = null;
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		String query = prop.getProperty("appPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				AppCom app = new AppCom();
				app.setAppResult(rset.getString("APP_RESULT"));
				app.setItemAppDate(rset.getDate("ITEM_APP_DATE"));
				app.setItemId(rset.getInt("ITEM_ID"));
				app.setItemMemberNo(rset.getInt("ITEM_MEMBER_NO"));
				app.setItemType(rset.getString("ITEM_TYPE"));
				app.setMemberName(rset.getString("MEMBER_NAME"));
				
				list.add(app);
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

}
