package com.kh.lp.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.common.PageInfo;
import com.kh.lp.wishlist.model.service.WishListService;
import com.kh.lp.wishlist.model.vo.WishList;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 23
 * @ModifyDate    : 2019. 12. 23
 * @Description   :  유저페이지 > 마이페이지 > 위시리스트 > 위시리스트에서 삭제목록 받아와서 처리하는  서블렛(ajax)
 * @param
 * @return
 */

@WebServlet("/wishListDeleteAjax.wi")
public class WishListDeleteAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishListDeleteAjaxServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	//로그인된 유저의 MEMBER_ID 받아서 인트 변수에 담기
    	int loginMemberNo = Integer.parseInt(request.getParameter("loginMemberNo"));
    	
    	//삭제 목록 체크된 String[]
    	String[] deleteArr = request.getParameterValues("deleteArr[]");
    	
    	//검색 종류(전체/시계/가방)를 스트링 변수에 담기
		String selected = request.getParameter("selected");
		String selectedView = "all";

		switch(selected) {
		case "viewAll" : selectedView = "all"; break;
		case "viewWatches" : selectedView = "watch"; break;
		case "viewBags" : selectedView= "bag"; break;
		}
    	
    	
    	//받아온 auctionId 리스트에 해당하는 wishList목록들의 상태를 'Y'에서 'N'으로 변경하고오기
    	int deleteWishListResult = new WishListService().deleteWishList(loginMemberNo, deleteArr);
    	
    	
    	
    	if(deleteWishListResult>0) {

    		//----------------------------------------------페이징 처리 로직------------------------------------------------//

    		//페이징 처리를 위한 변수들 선언
    		int currentPage;	//현재페이지 정보를 동적으로 담을 변수
    		int limit;			//한 페이지에 띄울 목록 갯수
    		int pagingSize =1;	//한번에 보여줄 페이징 갯수 (아래에서 pagingSize가 분모가되기때문에 0이 아닌수로 초기화)
    		int maxPage;		//목록 갯수에 따른 맨 마지막 페이지 번호를 담을 변수
    		int startPage;		//한번에 보여주는 페이지들 중 맨 처음 페이지 번호를 동적으로 담을 변수
    		int endPage;		//한번에 보여주는 페이지들 중 맨 마지막 페이지 번호를 동적으로 담을 변수

    		//현재페이지 1로 초기화 (아무것도 클릭 안했을땐 1페이지여야 하므로)
    		currentPage = 1;

    		//웹페이지에서 다른 페이지 번호를 클릭했을 경우 parameter로 넘어간 currentPage value를 받아서 currentPage 변수에 담음
    		if(request.getParameter("currentPage") != null) {
    			currentPage = Integer.parseInt(request.getParameter("currentPage"));
    		}

    		//한 페이지 리스트 갯수는 10개로 제한
    		limit = 12;

    		//페이징은 한 번에 5개씩 보여주기
    		pagingSize = 5;

    		//현재 로그인된 회원의 위시리스트 갯수를 불러오는 메소드 소환
    		int listCount = new WishListService().memberWishListCount(loginMemberNo, selectedView);

    		//총 페이징 갯수 계산(=맨 마지막 페이지 번호)
    		maxPage = (int)((double)listCount/limit+0.9);

    		//현재 페이지에 따른 페이징시작번호 및 페이징 끝번호 (ex. 현재페이지:4, 페이징시작번호:1, 페이징끝번호:5)
    		double var = 1 - (1/pagingSize);//아래계산식에서 쓰일 변수
    		startPage = (int)(((double)currentPage/pagingSize+var)-1)*pagingSize + 1;
    		endPage = startPage + 5 -1;

    		//페이징 끝번호가 마지막페이지번호 이상일 땐 페이징 끝번호 = 마지막페이지번호
    		if(endPage >= maxPage) {
    			endPage = maxPage;
    		}
    		
    		if(maxPage==0) {
    			endPage=1;
    			maxPage=1;
    		}


    		System.out.println("listCount : " + listCount);
    		System.out.println("maxPage : " + maxPage);


    		//PageInfo 객체에 페이지 정보 저장
    		PageInfo pInfo = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);

    		//--------------------------------------------------------------------------------------------------------//



    		//이제 다시 가서 selectedView에 해당하는 wishlist 목록 가져오기
    		ArrayList<WishList> newMemberWishList = new WishListService().getMemberWishList(loginMemberNo, selectedView, currentPage, limit);

    		System.out.println("삭제시킨 목록 반영하고 나서 다시 불러온 위시리스트 : " + newMemberWishList);
    		
    		Map<String, Object> updatedWishList = new HashMap<String, Object> ();
    		updatedWishList.put("pInfo", pInfo);
    		updatedWishList.put("updatedWishList", updatedWishList);
    		
    		
    		response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		new Gson().toJson(updatedWishList,response.getWriter());
    		
    		

    	}

    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
