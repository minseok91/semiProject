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

import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.appraisal.model.vo.App;
import com.kh.lp.appraisal.model.vo.AppCom;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.GenDetail;
import com.kh.lp.appraisal.model.vo.Item;
import com.kh.lp.appraisal.model.vo.ItemHistory;
import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.auction.model.vo.Auction;

import lombok.extern.log4j.Log4j2;
import oracle.net.aso.i;

@Log4j2
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
//			pstmt.setInt(1, at.getBid());
//			pstmt.setString(2, at.getOriginName());
//			pstmt.setString(3, at.getChangeName());
//			pstmt.setString(4, at.getFilePath());
//			pstmt.setInt(5, 1);//일단 1로하자
			
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
				item.setItemId(Integer.parseInt(itemId));
				item.setItemMemberNo(rset.getInt("ITEM_MEMBER_NO"));
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

	public int insertIh(Connection con, ItemHistory ih) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertIh");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ih.getItemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertApp(Connection con, App ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertApp");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ap.getAppNote());
			pstmt.setInt(2, ap.getAppItemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertW(Connection con, Watch w) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertW");
		
		
//		WATCH_GUARANTEE_YN
//		WATCH_BOX_YN
//		WATCH_MATERIAL
//		WATCH_MOVEMENT
//		WATCH_CHRONOGRAPH

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, w.getWatchGuaranteeYn());
			pstmt.setString(2, w.getWatchBoxYn());
			pstmt.setString(3, w.getWatchMaterial());
			pstmt.setString(4, w.getWatchMovement());
			pstmt.setString(5, w.getWatchChronograph());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertArW(Connection con, AR1 ar) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertArW");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ar.getAr1Brand());
			pstmt.setString(2, ar.getAr1Model());
			pstmt.setInt(3, ar.getAr1Price());
			pstmt.setString(4, ar.getAr1Condition());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCurrvalApp(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int appid = 0;
		
		String query = prop.getProperty("selectCurrValApp");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				appid = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return appid;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileList.get(i).getAttachmentName());
			pstmt.setString(2, fileList.get(i).getAttachmentRename());
			pstmt.setString(3, fileList.get(i).getAttachmentPath());
			
			int level = 0;
			if(i == 0) {
				level = 0;
			} else {
				level = 1;
			}
			pstmt.setInt(4, level);
			pstmt.setInt(5, fileList.get(i).getAttachmentRefApp());
			
			result  += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAuction(Connection con, Auction au, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAuction");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int getMemberNo(Connection con, int itemId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int memberNo = 0;
		
		String query = prop.getProperty("getMemberNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, itemId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return memberNo;
	}

	public int insertB(Connection con, Bag b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertB");
		
		
//		BAG_ID
//		BAG_SIZE
//		BAG_STRAP
//		BAG_GENDER

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getBagSize());
			pstmt.setString(2, b.getBagStrap());
			pstmt.setString(3, b.getGender());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertArB(Connection con, AR1 ar) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertArB");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ar.getAr1Brand());
			pstmt.setString(2, ar.getAr1Model());
			pstmt.setInt(3, ar.getAr1Price());
			pstmt.setString(4, ar.getAr1Condition());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAppF(Connection con, App ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAppF");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ap.getAppNote());
			pstmt.setInt(2, ap.getAppItemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ArrayList<Object>> selectItemResult(Connection con, int memberNo) {
		ArrayList<ArrayList<Object>> app = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Item i = null;
		App a = null;
		AR1 ar = null;
		Attachment at = null;
		Auction au = null;
		
		String query = prop.getProperty("selectItemResult");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			app = new ArrayList<>();
			while(rset.next()) {
				i = new Item();
				a = new App();
				ar = new AR1();
				at = new Attachment();
				au = new Auction();
				ArrayList<Object> list = new ArrayList<>();
				
				i.setItemId(rset.getInt("ITEM_ID"));
				i.setItemBrandModel(rset.getString("ITEM_BRAND_MODEL"));
				a.setAppResult(rset.getString("NAME"));
				ar.setAr1Price(rset.getInt("AR1_PRICE"));
				at.setAttachmentRename(rset.getString("ATTACHMENT_RENAME"));
				au.setAuctionCount(rset.getInt("AUCTION_COUNT"));
				
				list.add(i);
				list.add(a);
				list.add(ar);
				list.add(at);
				list.add(au);
				
				app.add(list);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		log.debug(app);
		return app;
	}

	// 등록상품 갯수 추출
	public int getListCount(Connection con, int memberNo) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		
		
		return result;
	}
}
