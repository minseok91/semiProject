package com.kh.lp.appraisal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.appraisal.model.vo.App;
import com.kh.lp.appraisal.model.vo.Attachment;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class AppraisalSelectItemResultServlet
 */
@Log4j2
@WebServlet("/selectItemResult.app")
public class AppraisalSelectItemResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppraisalSelectItemResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		log.debug(memberNo);
		
		int currentPage; //현재 페이지를 표시할 변수
		int limit; 		 //한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage;	//전체 페이지에서 가장 마지막 페이지
		int startPage;	//한 번에 표시될 페이지의 시작할 페이지
		int endPage;	//한 번에 표시될 페이지의 마지막 페이지
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new AppraisalService().getListCount(memberNo);
		
		ArrayList<ArrayList<Object>> app = new AppraisalService().selectItemResult(memberNo);
		PrintWriter out = response.getWriter();
		String msg = "";
		if(app != null) {
			for(int n = 0; n < app.size(); n++) {
				AR1 ar = (AR1) app.get(n).get(0);
				Attachment at = (Attachment) app.get(n).get(1);
				if(n == app.size() - 1) {
					msg += ar.getAr1Id() + "::" + at.getAttachmentRename() + "::" + ar.getAr1Brand() + "::" + (ar.getAr1Price());
				} else {
					msg += ar.getAr1Id() + "::" + at.getAttachmentRename() + "::" + ar.getAr1Brand() + "::" + ar.getAr1Price() + "#";
				}
			}
			out.append(msg);
		}  else {
			log.debug("실패");
			out.append("fail");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
