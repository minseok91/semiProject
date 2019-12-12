package com.kh.lp.appraisal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.GenDetail;
import com.kh.lp.appraisal.model.vo.Item;
import com.kh.lp.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class AppraisalInsertServlet
 */
@WebServlet("/insert.app")
public class AppraisalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppraisalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String isGen = request.getParameter("isGen");
//		System.out.println("isGen : " + isGen);
//		String desc = request.getParameter("comment");
//		String desc2 = request.getParameter("comment2");
		int result = 0;
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
		//전송파일 용량 제한 10mb 로 용향제한
		int maxSize = 1024 * 1024 * 10;
		
		//웹서버 컨테이너 경로추출
		String root = request.getSession().getServletContext().getRealPath("/");
		
		System.out.println(root);
		
		//파일 저장 경로 
		String savePath = root + "img/appraisal/";
		
		//사용자가 올린 파일을 그대로 저장하지 않는 것이 일반적이다.
		//1. 같은 파일명이 있는 경우 이전 파일을 덮어씌운다;
		//2. 한글로된 파일명 , 특수기호, 띄어쓰기 등이 서버의 운영체제에 따라 문제가 생길 수 있다.
		//DefaultFileRenamePolicy는 cos.jar안에 존재하는 클래스로 
		//같은 파일명이 존재 하는지 검사하고, 있는 경우 파일명 뒤에 숫자를 붙여준다.
		//ex :aaa.zip, aaa1.zip, aaa2.zip
		//MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		System.out.println("multiRequest : " + multiRequest);
		
		
		//감정아이템정보 가져오기 시작
		
		String itemId = multiRequest.getParameter("itemId");
		
		
//		Item item = new AppraisalService().getItemInfo(itemId);
		//감정아이템정보 가져오기 끝	
		//감정신청이력 4로 인서트 시작
//		int resultHisory = new AppraisalService().insertHistory(item); 
		//감정신청이력 4로 인서트 끝
		String isGen = multiRequest.getParameter("isGen");
		System.out.println("isGen" + isGen);
		
		//저장할 파일의 이름을 저장할 arrayList를 생성 
		ArrayList<String> saveFiles = new ArrayList<String>();
		
		//원본파일의 이름을 저장할 arrayList 를 생성 
		ArrayList<String> originFiles = new ArrayList<>();
		
		//파일이 전송된 input 태그의 name을 반환
		Enumeration<String> files =  multiRequest.getFileNames();
		System.out.println("files :" + files);
		
		String name = files.nextElement();
		saveFiles.add(multiRequest.getFilesystemName(name));
		originFiles.add(multiRequest.getOriginalFileName(name));
		
		if(isGen.equals("Y")) {
			String multiBrand = multiRequest.getParameter("brand");
			String multiModel = multiRequest.getParameter("model");
			int multiPrice = Integer.parseInt(multiRequest.getParameter("price"));
			String multiComment = multiRequest.getParameter("comment");
			
			String chronograph = multiRequest.getParameter("chronograph");
			String movement = multiRequest.getParameter("movement");
			String matertial = multiRequest.getParameter("matertial");
			String boxYn = multiRequest.getParameter("boxYn");
			String guaranteeYn = multiRequest.getParameter("guaranteeYn");
			
			System.out.println("brand" + multiBrand);
			System.out.println("model" + multiModel);
			System.out.println("price" + multiPrice);
			System.out.println("comment" + multiComment);
			
			System.out.println("chronograph" + chronograph);
			System.out.println("movement" + movement);
			System.out.println("matertial" + matertial);
			System.out.println("boxYn" + boxYn);
			System.out.println("guaranteeYn" + guaranteeYn);
			
			AppResult ap = new AppResult();
			ap.setDetailDesc(multiComment);
			ap.setGenStatus(isGen);
			
			
			GenDetail gd = new GenDetail();
			gd.setBrand(multiBrand);
			gd.setModelName(multiModel);
			gd.setAppPrice(multiPrice);
			
			//첨부파일 관련
			Attachment at = new Attachment();
			at.setFilePath(savePath);
			at.setOriginName(originFiles.get(0));
			at.setChangeName(saveFiles.get(0));
			System.out.println("at : " + at );
			result = new AppraisalService().insertGenDetail(ap, gd , at);
			
			System.out.println("여긴 진품일때");
		} else {
			System.out.println("여긴 가품일때");
			
			itemId = multiRequest.getParameter("rejName");
			System.out.println("itemid :" + itemId);
			
			//하나의 서비스로 합치기 시작 (가품)
			int resultAll = new AppraisalService().insertAppraisalInfoFake(itemId);
			//하나의 서비스로 합치기 끝
			
			String multiComment = multiRequest.getParameter("comment2");
			System.out.println("comment" + multiComment);
			System.out.println("여긴 가품일때");
			AppResult ap = new AppResult();
			
			
			//감정번호 가져와서 넣기 ap.setAppId(appId);
			//넣는거 아님 시퀀스로 ap.setAppResultNo(appResultNo);
			//이건 첨부파일 관련해서 ap.setAttachId(attachId);
			ap.setDetailDesc(multiComment);
			ap.setGenStatus(isGen);
			System.out.println("ap : " + ap);
			//이건 입력할 떄 sysdate 로 ap.setResultDate(resultDate);
			//result = new AppraisalService().insertFake(ap);
		}
		
		 
		
		String page = "";
		if(result > 0) {
			page = "views/admin/appRequest.jsp";
			response.sendRedirect(page);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "인서트 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
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
