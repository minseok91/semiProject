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

import com.kh.lp.common.Attachment;
import com.kh.lp.item.model.vo.Item;
import com.kh.lp.item.model.vo.ItemDeli;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

@Log4j2
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
				item.setMemberId(rset.getString("MEMBER_ID"));
				
				
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
				item.setItemPurDate(rset.getString("ITEM_PUR_DATE"));
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
	
	public int insertItemHistory(Connection con, Item registItem, String status) {
		
		int result=0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertItemHistory");
		
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, registItem.getItemId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 19. 오전 3:35:47
	 * @ModifyDate    : 2019. 12. 19. 오전 3:35:47
	 * @Description   : 감정신청상품의 이미지를 불러오는 메소드
	 * @param con
	 * @param itemId
	 * @return
	 */
	public Attachment selectImg(Connection con, String itemId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment at = null;
		String query = prop.getProperty("selectImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(itemId));
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}

	// 마이페이지 - 감정상품 배송조회 리스트
	public ArrayList<ItemDeli> itemApprDeliSelectAll(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ItemDeli> list = null;
		int itemId = 0;
		int status = 0; 		// 배송상태 -> 2라면 회원주택 -> 회사이므로 배송상태를 보여줘야함
								// 			2가 아니라면 무조건 배송완료
		String deliStatus = ""; // 배송중 or 배송완료
		String appResult = ""; // 진품가품여부
		String deliType = "";
		
		String query = prop.getProperty("itemApprDeliSelectAll");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ItemDeli>();
			
			while(rset.next()) {
				ItemDeli id = new ItemDeli(); 
				itemId = rset.getInt(1);
				status = rset.getInt(2);
				
				if(status == 2) {			// 아직 배송중일 때 -> 해당 itemId를 기준으로 객체 이식
					deliStatus = "배송중";
					deliType = "상품감정신청";
					id = onlyItemInfo(con, itemId, deliStatus, deliType);
					
				} else if(status == 3) {	// 최소한 받은 상태 -> 배송완료
					deliStatus = "배송완료";
					deliType = "상품감정신청";
					id = onlyItemInfo(con, itemId, deliStatus, deliType);
					
				} else { 					// 감정결과가 나옴
					appResult = selectAppResult(con, itemId);
					log.debug(appResult);
					if(appResult.equals("AR2")) {
						deliStatus = "배송중";
						deliType = "가품으로 인한 배송";
						id = onlyItemInfo(con, itemId, deliStatus, deliType);
					} else {
						deliStatus = "배송완료";
						deliType = "상품감정신청";
						id = onlyItemInfo(con, itemId, deliStatus, deliType);
					}
				}
				
				list.add(id);
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
	
	// 해당 itemId를 기준으로 객체 이식
	public ItemDeli onlyItemInfo(Connection con, int itemId, String deliStatus, String deliType) {
		ItemDeli id = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("onlyItemInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemId);
			
			rset = pstmt.executeQuery();
			
			id = new ItemDeli();
			
			if(rset.next()) {
				id.setItemNo(rset.getInt("ITEM_ID"));
				id.setItemAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				id.setItemBrandAndModel(rset.getString("ITEM_BRAND_MODEL"));
				id.setItemCategory(deliType);
				id.setItemDeli(deliStatus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return id;
	}
	
	public String selectAppResult(Connection con, int itemId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String appResult = "";
		
		String sql = prop.getProperty("fakeStatus");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, itemId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				appResult = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return appResult;
	}

	public int listCount(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("listCount");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

}








































