package com.kh.lp.wishlist.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.wishlist.model.dao.WishListDao;
import com.kh.lp.wishlist.model.vo.WishList;



public class WishListService {

	
	
	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 19
	 * @ModifyDate    : 2019. 12. 19
	 * @Description   :  로그인되어있는 유저가 등록해놓은 위시리스트를 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<WishList> getMemberWishList(int loginMemberNo, String view) {
		
		ArrayList<WishList> memberWishList = null;
		
		Connection con = getConnection();
		
		memberWishList = new WishListDao().selectMemberWishList(con, loginMemberNo, view);
		
		close(con);
				
		return memberWishList;
	}

}












































