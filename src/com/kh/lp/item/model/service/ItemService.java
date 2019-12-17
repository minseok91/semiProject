package com.kh.lp.item.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.item.model.dao.ItemDao;
import com.kh.lp.item.model.vo.Item;
import com.kh.lp.member.model.vo.Member;

import static com.kh.lp.common.JDBCTemplate.*;

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
		
		int resultItemInfo = new ItemDao().insertItemInfo(con, loginMember, registItem);
		System.out.println("아이템테이블 인서트 : " + resultItemInfo);
		
		
		
		int itemNo = new ItemDao().getItemNo(con);
		System.out.println("itemNo" + itemNo);
		
		itemPic.setAttachmentRefItem(itemNo);
		
		
		int resultItemPic = new ItemDao().insertItemPic(con, itemPic);
		System.out.println("첨부파일테이블 인서트 : " + resultItemInfo);
		
		if(resultItemInfo>0 && resultItemPic>0) {
			result = 1;
			
			commit(con);
			
		}else {
			rollBack(con);
		}
		
		
		close(con);
		
		
		
		return result;
	}

}

























































