package com.kh.lp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.member.model.service.MemberService;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class PasswordCheckServlet
 */
@Log4j2
@WebServlet("/passwordCheck.me")
public class PasswordCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordCheckServlet() {
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
		String memberPwd = request.getParameter("memberPwd");
		int num = Integer.parseInt(request.getParameter("num"));
		log.debug(memberNo);
		log.debug(memberPwd);
		log.debug(num);
		
		
		Member requestMember = new Member();
		
		requestMember.setMemberNo(memberNo);
		requestMember.setMemberPwd(memberPwd);
		
		int result = new MemberService().passwordCheck(requestMember);
		
		if(result > 0) {
			log.debug(num);
			if(num == 1) {
				response.sendRedirect(request.getContextPath() + "/views/myPage/memberChange/memberInfoChange.jsp");
			}else if(num == 2) {
				log.debug("실행");
				request.setAttribute("msg", "delete");
				request.getRequestDispatcher("/views/common/successPage.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("msg", "wrongPwd");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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