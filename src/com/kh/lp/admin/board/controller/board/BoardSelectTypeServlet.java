package com.kh.lp.admin.board.controller.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class BoardSelectTypeServlet
 */
@WebServlet("/BoardSelectType.bo")
public class BoardSelectTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		limit = 10;
		int listCount=0;
		//게시판의 종류가 -- 선택 -- 이 아닌것을 선택하기 위해 
			
		
			listCount = new BoardService().selectCount(type);
			
			System.out.println(type);
			
			maxPage = (int)((double)listCount/limit+0.9);
			startPage = (int)(((double)currentPage/limit+0.9)-1)*10 + 1;
			endPage = startPage + 10 - 1;
			
			if(endPage >= maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);
			ArrayList<HashMap<String, Object>> list = new BoardService().selectType(currentPage, limit, type);
			String page = "";
			
			ArrayList<Object> allList = new ArrayList<>();
			allList.add(list);
			allList.add(pi);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(allList,response.getWriter());
			
			
		
		System.out.println(listCount);
		

		
		
		


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
