package com.kh.lp.appraisal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.App;
import com.kh.lp.appraisal.model.vo.Item;

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
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		log.debug(memberNo);
		ArrayList<ArrayList<Object>> app = new AppraisalService().selectItemResult(memberNo);
		PrintWriter out = response.getWriter();
		String msg = "";
		if(app != null) {
			for(int n = 0; n < app.size(); n++) {
				App a = (App) app.get(n).get(0);
				Item i = (Item) app.get(n).get(1);
				if(n == app.size() - 1) {
					msg += a.getAppId() + "::" + i.getItemBrandModel() + "::" + a.getAppResult();
				} else {
					msg += a.getAppId() + "::" + i.getItemBrandModel() + "::" + a.getAppResult() + "#";
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
