package com.kh.lp.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.member.controller.SendEmailServlet;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class test
 */
@WebServlet("/test.t")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * paymentBefore에서 값받아오기 테스트
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String impId = request.getParameter("impId");
		String merId = request.getParameter("merId");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		System.out.println("impId : "+impId);
		System.out.println("merId : "+merId);
		System.out.println("amount : "+amount);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
