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

import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.item.model.vo.Item;
import com.kh.lp.member.model.vo.Member;

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
				//item.setItemId(rset.getInt("RNUM"));
				item.setItemAppDate(rset.getDate("ITEM_APP_DATE"));
				//item.setItemBrandModel(rset.getString("ITEM_BRAND_MODEL"));
				item.setItemDetail(rset.getString("ITEM_DETAIL"));
				item.setItemId(rset.getInt("ITEM_ID"));
				item.setItemMemberNo(rset.getInt("MEMBER_NO"));
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
				item.setItemMemberNo(rset.getInt("MEMBER_NO"));
				//item.setItemPurDate(rset.getDate("ITEM_PUR_DATE"));
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

	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 16
	 * @ModifyDate    : 2019. 12. 16
	 * @Description   :  ITEM 테이블에 인서트하는 메소드
	 * @param
	 * @return
	 */
	public int insertItem(Connection con, Member loginMember, Item registItem) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertItem");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginMember.getMemberNo());
			pstmt.setString(2, registItem.getItemType());
			pstmt.setString(3, registItem.getItemBrandModel());
			pstmt.setString(4, registItem.getItemPurDate());
			pstmt.setString(5, registItem.getItemWarrantyYn());
			pstmt.setString(6, registItem.getItemDetail());
			
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
	 * @CreateDate    : 2019. 12. 16
	 * @ModifyDate    : 2019. 12. 16
	 * @Description   :  ITEM_HISTORY 테이블, ATTACHMENT 테이블에 입력할때 FK 연결을 위해 ITEM 테이블에 입력된 ITEM_ID값 가져오는 메소드
	 * @param
	 * @return
	 */
	public int getItemId(Connection con) {
		
		int itemId=0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getItemId");
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				itemId = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return itemId;
	}
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 16
	 * @ModifyDate    : 2019. 12. 16
	 * @Description   :  ATTACHMENT 테이블에 첨부파일정보 인서트하는 메소드
	 * @param
	 * @return
	 */
	public int insertAttachment(Connection con, Attachment itemPic) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, itemPic.getAttachmentName());
			pstmt.setString(2, itemPic.getAttachmentRename());
			pstmt.setString(3, itemPic.getAttachmentPath());
			pstmt.setInt(4, itemPic.getAttachmentRefItem());
			
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
	 * @CreateDate    : 2019. 12. 16
	 * @ModifyDate    : 2019. 12. 16
	 * @Description   :  ITEM_HISTORY 테이블에 인서트하는 메소드
	 * @param
	 * @return
	 */
	
	public int insertItemHistory(Connection con, Item registItem) {
		
		int result=0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertItemHistory");
		
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, registItem.getItemId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}








































