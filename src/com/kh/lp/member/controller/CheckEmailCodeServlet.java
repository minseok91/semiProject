package com.kh.lp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.member.model.service.MemberService;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class CheckEmailCodeServlet
 */
@Log4j2
@WebServlet("/checkEmailCode.me")
public class CheckEmailCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String code = request.getParameter("code");
		String memberId = request.getParameter("id");
		log.debug(code);
		log.debug(memberId);
		
		int result = new MemberService().checkEmail(code, memberId);
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			log.debug(result);
			out.append("true");
		} else {
			log.debug(result);
			out.append("false");
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
