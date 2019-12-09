package com.kh.lp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class CheckPasswordCodeServlet
 */
@Log4j2
@WebServlet("/checkPwdCode.me")
public class CheckPasswordCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPasswordCodeServlet() {
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
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberEmail1 = request.getParameter("memberEmail1");
		String memberEmail2 = request.getParameter("memberEmail2");
		String memberEmail = memberEmail1 + "@" + memberEmail2;
		log.debug(code);
		log.debug(memberId);
		log.debug(memberName);
		log.debug(memberEmail);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
