package com.kh.lp.admin.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.lp.admin.report.model.service.ReportService;
import com.kh.lp.admin.report.model.vo.Report;

import jdk.nashorn.api.scripting.JSObject;

/**
 * Servlet implementation class userReportDetailServlet
 */
@WebServlet("/userReportDetail.me")
public class ReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reportId = request.getParameter("reportId");
		
		System.out.println(reportId);
		Report list = new ReportService().selectOne(reportId);
		
		
		
		
		
		
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8"); 
		  new Gson().toJson(list, response.getWriter());
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
