package com.kh.lp.wishlist.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.wishlist.model.vo.WishList;



public class WishListDao {

	private Properties prop = new Properties();
	public WishListDao() {
		String fileName = WishListDao.class.getResource("/sql/wishList/wishList-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Author         : 오수민
	 * @CreateDate    : 2019. 12. 19
	 * @ModifyDate    : 2019. 12. 19
	 * @Description   :  로그인되어있는 유저가 등록해놓은 위시리스트를 불러오는 메소드
	 * @param
	 * @return
	 */
	public ArrayList<WishList> selectMemberWishList(Connection con, int loginMemberNo, String view) {
		ArrayList<WishList> selectedMemberWishList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query1 = prop.getProperty("selectMemberWishList");
		String query2 = prop.getProperty("eachCurrentPrice");
		
		//로그인된 유저가 등록해놓은 위시리스트 가져오기(입찰가격 빼고)
		
		
		
		//로그인된 유저가 등록해놓은 위시리스트 각각 입찰최고가 가져오기
		
		
		
		
		return selectedMemberWishList;
	}

}



















































