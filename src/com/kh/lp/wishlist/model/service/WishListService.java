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
	 * @ModifyDate    : 2019. 12. 20
	 * @Description   : 로그인되어있는 유저가 등록해놓은 위시리스트 중 view 값(전체/시계/가방)에 따라 해당 조건에 맞는 위시리스트를 골라서 리턴하는 메소드
	 * 					각 상품에대한 현재 최고입찰가 정보는 따로 불러와서 추가
	 * @param
	 * @return
	 */
	public ArrayList<WishList> getMemberWishList(int loginMemberNo, String selectedView) {
		
		ArrayList<Integer> memberAuctionIds = null;
		ArrayList<WishList> memberWishList = null;
		Connection con = getConnection();
		
		
		//로그인된 유저가 관심상품 등록한 목록 WISHLIST 테이블에서 selectedView값(전체/시계/가방)에 대한 WISHLIST_AUCTION_ID값 가져와서 ArrayList<Integer>에 담기
		memberAuctionIds = new WishListDao().selectMemberAuctionId(con, loginMemberNo, selectedView);
		
		
		//각 memberAuctionId에 해당하는 위시리스트 정보들을 받아서 생성된 WishList객체에 담아온 후에 가격정보를 담아와서 setter로 추가 후 memberWishList에 추가
		memberWishList = new ArrayList<>();
		
		for(int i=0; i<memberAuctionIds.size(); i++) {
			
			WishList eachInfo = new WishListDao().selectEachInfo(con, memberAuctionIds.get(i));
			int eachCurrentPrice = new WishListDao().getEachCurrentPrice(con, memberAuctionIds.get(i));
			
			eachInfo.setAuctionCurrentPrice(eachCurrentPrice);
			
			memberWishList.add(eachInfo);
		}
		
		
		close(con);
				
		return memberWishList;
	}
	
	


}





































