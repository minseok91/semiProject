package com.kh.lp.item.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.common.Attachment;
import com.kh.lp.item.model.dao.ItemDao;
import com.kh.lp.item.model.vo.Item;
import com.kh.lp.item.model.vo.ItemDeli;
import com.kh.lp.member.model.vo.Member;

public class ItemService {

	public int listCount() {
		Connection con = getConnection();
		
		int result = new ItemDao().listCount(con);
		
		close(con);
		
		
		return result;
	}

	public ArrayList<Item> ItemPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Item> list = new ItemDao().ItemPaging(con, currentPage, limit);
		
		close(con);
		
		
		return list;
	}

	/**
	 * @Author      : 민석
	 * @Description : 아이템 상세보기
	 * @CreateDate  : Dec 20, 2019
	 * @ModifyDate  : Dec 20, 2019
	 */
	public Item selectOne(String itemId) {
		Connection con = getConnection();
		
		Item item = new ItemDao().selectOne(con, itemId);
		
		close(con);
		
		
		return item;
	}
	
	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 16
	 * @ModifyDate    : 2019. 12. 16
	 * @Description   :  감정신청상품 등록하는 메소드
	 * @param
	 * @return
	 */

	public int itemRegister(Member loginMember, Item registItem, Attachment itemPic) {

		int result = 0;
		Connection con = getConnection();
		
		//ITEM 테이블에 인서트하는 dao메소드 불러오기
		int insertItemResult = new ItemDao().insertItem(con, loginMember, registItem);
		
		//ITEM 테이블에 인서트된 정보 중 ITEM_ID를 가져올 dao 메소드 불러오기
		int itemId = new ItemDao().getItemId(con);
		
		//가져온 ITEM_ID값을 registItem, itemPic 객체에 넣어주기
		registItem.setItemId(itemId);
		itemPic.setAttachmentRefItem(itemId);
		
		//ITEM_HISTORY 테이블에 인서트하는 dao메소드 불러오기
		int insertItemHistoryResult1 = new ItemDao().insertItemHistory(con, registItem, "IHS1");
		int insertItemHistoryResult2 = new ItemDao().insertItemHistory(con, registItem, "IHS2");
		int insertItemHistoryResult3 = new ItemDao().insertItemHistory(con, registItem, "IHS3");
		
		
		//ATTACHMENT 테이블에 인서트할 dao메소드 불러오기
		int insertAttachmentResult = new ItemDao().insertAttachment(con, itemPic);
		
		
		//ITEM 테이블, ITEM_HISTORY 테이블, ATTACHMENT 테이블에 다 제대로 입력됐을 때에만 result를 1로 반환하고 커밋, 아니면 롤백
		if(insertItemResult>0 && insertItemHistoryResult1>0 && insertItemHistoryResult2>0 && insertItemHistoryResult3>0 && insertAttachmentResult>0) {
			result = 1;
			
			commit(con);
			
		}else {
			rollBack(con);
		}
		
		
		close(con);
		
		
		return result;
	}

	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 19. 오전 3:33:44
	 * @ModifyDate    : 2019. 12. 19. 오전 3:33:44
	 * @Description   : 감정신청이미지 불러오는 메소드
	 * @param itemId
	 * @return
	 */
	public Attachment selectImg(String itemId) {
		Connection con = getConnection();
		
		Attachment at = new ItemDao().selectImg(con, itemId);
		
		close(con);
		return at;
	}

	// 마이페이지 - 감정상품 배송조회 리스트
	public ArrayList<ItemDeli> itemApprDeliSelectAll(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<ItemDeli> list = new ItemDao().itemApprDeliSelectAll(con, memberNo);
		
		close(con);
		
		return list;
	}

	public int listCount(int memberNo) {
		Connection con = getConnection();
		
		int listCount = new ItemDao().listCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}

}
























































