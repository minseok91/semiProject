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
		
		
				
		return 0;
	}

	public ArrayList<Item> ItemPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Item> list = null;
		ResultSet rset = null;
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow =  startRow + limit -1;
		
		String query = prop.getProperty("itemPaging");
		
		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			
			while(rset.next()) {
				Item item = new Item();
				
				item.setItemAppDate(rset.getDate(""));
				item.setItemBrandModel(rset.getString(""));
				item.setItemDetail(rset.getString(""));
				item.setItemId(rset.getInt(""));
				item.setItemMemberNo(rset.);
				item.setItemPurDate(itemPurDate);
				item.setItemType(itemType);
				item.setItemWarrantyYn(rset.);
				
				list.add(item);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return null;
	}

}
