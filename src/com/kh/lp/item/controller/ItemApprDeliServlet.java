package com.kh.lp.item.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.common.PageInfo;
import com.kh.lp.item.model.service.ItemService;
import com.kh.lp.item.model.vo.ItemDeli;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class ItemApprDeliServlet
 */
@Log4j2
@WebServlet("/apprDeli.se")
public class ItemApprDeliServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemApprDeliServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 감정신청 상품 배송 관련 리스트
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		int currentPage;	//현재페이지 정보를 동적으로 담을 변수
		int limit;			//한 페이지에 띄울 목록 갯수
		int pagingSize =1;	//한번에 보여줄 페이징 갯수 (아래에서 pagingSize가 분모가되기때문에 0이 아닌수로 초기화)
		int maxPage;		//목록 갯수에 따른 맨 마지막 페이지 번호를 담을 변수
		int startPage;		//한번에 보여주는 페이지들 중 맨 처음 페이지 번호를 동적으로 담을 변수
		int endPage;		//한번에 보여주는 페이지들 중 맨 마지막 페이지 번호를 동적으로 담을 변수
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		limit = 10;
		
		pagingSize = 5;
		
		int listCount = new ItemService().listCount(memberNo);
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		double var = 1 - (1/pagingSize);//아래계산식에서 쓰일 변수
		startPage = (int)(((double)currentPage/pagingSize+var)-1)*pagingSize + 1;
		endPage = startPage + 5 -1;
		
		if(endPage >= maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pInfo = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);
		
		
		ArrayList<ItemDeli> list = new ItemService().itemApprDeliSelectAll(memberNo);
		
		log.debug(list);
		
		PrintWriter out = response.getWriter();
		
		String msg = "";
		
		if(list != null) {
			for(int n = 0; n < list.size(); n++) {
				ItemDeli id = list.get(n);
				
				if(n == list.size() - 1)
					msg += id.getItemCategory() + "::" + id.getItemNo() + "::" + id.getItemAttachmentRename()
					 + "::" + id.getItemBrandAndModel() + "::" + id.getItemDeli();
				else 
					msg += id.getItemCategory() + "::" + id.getItemNo() + "::" + id.getItemAttachmentRename()
					 + "::" + id.getItemBrandAndModel() + "::" + id.getItemDeli() + "#";
			}
		} else {
			msg = "아직 감정신청하신 이력이 없습니다!";
		}
		
		out.append(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
