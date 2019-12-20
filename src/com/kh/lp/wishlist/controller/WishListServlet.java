package com.kh.lp.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.wishlist.model.service.WishListService;
import com.kh.lp.wishlist.model.vo.WishList;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 19
 * @ModifyDate    : 2019. 12. 19
 * @Description   :  유저페이지 > 마이페이지 > 구매정보 > 위시리스트에 유저 위시리스트 띄우는 서블렛
 * @param
 * @return
 */
@WebServlet("/wishList.wi")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int loginMemberNo = Integer.parseInt(request.getParameter("loginMemberNo"));
		String selected = request.getParameter("selected");
		String view = "";
		ArrayList<WishList> memberWishList = null;
		
		
		switch(selected) {
		case "viewAll" : view = "all"; break;
		case "viewWatches" : view = "W"; break;
		case "viewBags" : view = "B"; break;
		}
		
		memberWishList = new WishListService().getMemberWishList(loginMemberNo, view);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(memberWishList,response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}












































