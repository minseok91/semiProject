package com.kh.lp.appraisal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.GenDetail;

/**
 * Servlet implementation class AppraisalInsertServlet
 */
@WebServlet("/insert.app")
public class AppraisalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppraisalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isGen = request.getParameter("isGen");
		System.out.println("isGen : " + isGen);
		String desc = request.getParameter("comment");
		String desc2 = request.getParameter("comment2");
		int result = 0;
		
		if(isGen.equals("Y")) {
			AppResult ap = new AppResult();
			ap.setDetailDesc(desc);
			ap.setGenStatus(isGen);
			
			String brand = request.getParameter("brand");
			String model = request.getParameter("model");
			int price = Integer.parseInt(request.getParameter("price"));
			
			GenDetail gd = new GenDetail();
			gd.setBrand(brand);
			gd.setModelName(model);
			gd.setAppPrice(price);
			
			result = new AppraisalService().insertGenDetail(ap, gd);
			System.out.println("여긴 진품일때");
		} else {
			System.out.println("여긴 가품일때");
			AppResult ap = new AppResult();
			//감정번호 가져와서 넣기 ap.setAppId(appId);
			//넣는거 아님 시퀀스로 ap.setAppResultNo(appResultNo);
			//이건 첨부파일 관련해서 ap.setAttachId(attachId);
			ap.setDetailDesc(desc2);
			ap.setGenStatus(isGen);
			System.out.println("ap : " + ap);
			//이건 입력할 떄 sysdate 로 ap.setResultDate(resultDate);
			result = new AppraisalService().insertFake(ap);
		}
		
		 
		
		String page = "";
		if(result > 0) {
			page = "views/admin/appRequest.jsp";
			response.sendRedirect(page);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "인서트 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
