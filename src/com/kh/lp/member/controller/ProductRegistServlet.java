package com.kh.lp.member.controller;

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

@WebServlet("/productRegist.me")
public class ProductRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductRegistServlet() {
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
				brandModel = watchBrand + model;
			}else {
				brandModel = bagBrand + model;
			}
			String purYear = multiRequest.getParameter("purYear");
			String purMonth = multiRequest.getParameter("purMonth");
			String purDate = purYear+purMonth;
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
			itemPic.setAtName(itemPicOriginName);
			itemPic.setAtRename(itemPicRename);
			itemPic.setAtPath(savePath);
			itemPic.setFileLevel(1);
			itemPic.setType("AT1");
			
			
			Member loginMember = (Member)(request.getSession().getAttribute("loginMember"));
			
			int result = new ItemService().itemRegister(loginMember, registItem, itemPic);
			
			
			
			
			
			
			
			
			
		}
		
		
		
		
		
		

		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}