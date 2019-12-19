package com.kh.lp.item.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.common.MyFileRenamePolicy;
import com.kh.lp.item.model.service.ItemService;
import com.kh.lp.item.model.vo.Item;
import com.kh.lp.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 16
 * @ModifyDate    : 2019. 12. 16
 * @Description   :  유저페이지 > 마이페이지 > 판매정보 > 상품감정신청 > 판매시작버튼 > 상품등록 창에서 입력값들 받아오는 서블렛
 * @param
 * @return
 */

@WebServlet("/itemRegister.it")
public class ItemRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ItemRegisterServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {

			//전송 파일 용량 제한 : 10MB
			int maxSize = 1024*1024*10;


			//웹서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			//root -> C:\Users\Sooo\git\semiProject\web\

			String savePath = root + "img/userItemPic/";

			//MultipartRequest객체 생성
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			//저장되는 파일명(변경파일명)
			//String renameFile = multiRequest.getfile


			//스트링에 값들 저장
			String itemPicOriginName = multiRequest.getOriginalFileName("itemPic");
			String itemPicRename = multiRequest.getFilesystemName("itemPic");
			String itemType = multiRequest.getParameter("itemType");


			String watchBrand = multiRequest.getParameter("watchBrand");
			String bagBrand = multiRequest.getParameter("bagBrand");
			String model = multiRequest.getParameter("model");
			String brandModel ="";
			if(watchBrand != null) {
				brandModel = watchBrand + "/" + model;
			}else {
				brandModel = bagBrand + "/" + model;
			}
			String purYear = multiRequest.getParameter("purYear");
			String purMonth = multiRequest.getParameter("purMonth");
			String purDate = purYear+ " " + purMonth;
			String warrYN = multiRequest.getParameter("warrYN");
			String itemDetail = multiRequest.getParameter("itemDetail");


			//Item 객체 생성
			Item registItem = new Item();

			registItem.setItemType(itemType);
			registItem.setItemBrandModel(brandModel);
			registItem.setItemPurDate(purDate);
			registItem.setItemWarrantyYn(warrYN);
			registItem.setItemDetail(itemDetail);


			//Attachment 객체 생성
			Attachment itemPic = new Attachment();
			itemPic.setAttachmentName(itemPicOriginName);
			itemPic.setAttachmentRename(itemPicRename);
			itemPic.setAttachmentPath(savePath);
			itemPic.setAttachmentLevel(1);
			itemPic.setAttachmentType("AT1");

			
			//로그인돼있는 회원 Member객체에 담기
			Member loginMember = (Member)(request.getSession().getAttribute("loginMember"));
			
			
			//결과처리
			int result = new ItemService().itemRegister(loginMember, registItem, itemPic);
			
			if(result>0) {
				response.sendRedirect(request.getContextPath() + "/views/myPage/sale/goodsEnrollList.jsp");
			}else {
				
				File failedPic = new File(savePath + itemPicRename);
				failedPic.delete();
				
				request.setAttribute("msg", "상품감정신청 실패");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);	
				
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
