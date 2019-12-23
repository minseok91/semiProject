package com.kh.lp.win;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.money.model.service.MoneyService;
import com.kh.lp.money.model.vo.Money;

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
		String name = request.getParameter("name");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String address = request.getParameter("address");
		String applyNum = (request.getParameter("applyNum"));
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		
		System.out.println("impId : "+impId);
		System.out.println("merId : "+merId);
		System.out.println("amount : "+amount);
		System.out.println("name : "+name);
		System.out.println("memberNo : "+memberNo);
		System.out.println("address : "+address);
		System.out.println("applyNum : "+applyNum);
		System.out.println("auctionId : "+auctionId);
		
		String page = "";
		
		Money money = new Money(impId,memberNo,merId,amount,address,applyNum,auctionId,name);
		
		System.out.println("money : "+ money);
		
//		money.setAmount(amount);
//		money.setImpId(impId);
//		money.setMemberNo(memberNo);
//		money.setMerId(merId);
		
		int result = new MoneyService().insertPayment(money);
		System.out.println("result : "+ result);
		if(result > 0 ) {
//			request.setAttribute("money", money);
			page = "/selectOne.mo?auctionId="+auctionId;
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			System.out.println("durls 에러입니다 ^^ ");
		}
		
		//response.sendRedirect(page);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
