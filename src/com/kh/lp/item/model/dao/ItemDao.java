package com.kh.lp.item.model.dao;

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

import com.kh.lp.item.model.vo.Item;

public class ItemDao {
	Properties prop = new Properties();
	
	public ItemDao() {
	
		String fileName = ItemDao.class.getResource("/sql/item/item-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	public int listCount(Connection con) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("itemListCount");
		
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

	public ArrayList<Item> ItemPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Item> list = null;
		ResultSet rset = null;
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		System.out.println("startRow :" + startRow);
		System.out.println("endRow :" + endRow);
		
		String query = prop.getProperty("itemPaging");
		
		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
//			RNUM, MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_MODIFY_DATE,MEMBER_STATUS,
//			ITEM_ID,ITEM_MEMBER_NO,ITEM_TYPE,ITEM_BRAND_MODEL,ITEM_PUR_DATE,ITEM_WARRANTY_YN,ITEM_DETAIL,ITEM_APP_DATE
			
			while(rset.next()) {
				Item item = new Item();
				
				item.setItemAppDate(rset.getDate("ITEM_APP_DATE"));
				//item.setItemBrandModel(rset.getString("ITEM_BRAND_MODEL"));
				item.setItemDetail(rset.getString("ITEM_DETAIL"));
				item.setItemId(rset.getInt("ITEM_ID"));
				item.setItemMemberNo(rset.getString("MEMBER_ID"));
//				item.setItemPurDate(rset.getDate("ITEM_PUR_DATE"));
				item.setItemType(rset.getString("ITEM_TYPE"));
//				item.setItemWarrantyYn(rset.getString("ITEM_WARRANTY_YN"));
				
				list.add(item);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("listDao :" + list);
		
		return list;
	}

	public Item selectOne(Connection con, String itemId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Item item = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(itemId));
			
			rset = pstmt.executeQuery();
			item = new Item();
			if(rset.next()) {
				item.setItemAppDate(rset.getDate("ITEM_APP_DATE"));
				item.setItemBrandModel(rset.getString("ITEM_BRAND_MODEL"));
				item.setItemDetail(rset.getString("ITEM_DETAIL"));
				item.setItemId(rset.getInt("ITEM_ID"));
				item.setItemMemberNo(rset.getString("MEMBER_ID"));
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

}
